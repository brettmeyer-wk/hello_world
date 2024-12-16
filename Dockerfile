FROM drydock-prod.workiva.net/workiva/dart2_base_image:1 as build
WORKDIR /build/

# TODO: Make a decision about wether or not you need sass support.
# Compile the release sass before we create our artifact.

# Performing a pub get requires a pubspec.yaml file. The lock should be copied if it is committed.
#COPY pubspec.yaml ./
RUN #timeout 5m dart pub get

# Running a dart dev command requires the tool directory. 
COPY tool tool
# To compile sass we need lib.
COPY lib lib
#RUN dart run dart_dev sass --release
# TODO: END: Make a decision about wether or not you need sass support.

# Copy the remainder of the files and publish
COPY . /build/
#RUN create_publishable_artifact.sh
#ARG BUILD_ARTIFACTS_PUB=/build/pub_package.pub.tgz

# Create a new stage to avoid secrets in the final stage (GIT_SSH_KEY)
#FROM scratch
