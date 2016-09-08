set +x
source ~/.bashrc
set -x
echo $BUILD_NUMBER
./gradlew clean testStagingRelease testPrdRelease assembleQaRelease assembleStagingRelease assemblePrdRelease