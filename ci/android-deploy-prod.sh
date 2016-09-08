set +x
source ~/.bashrc
set -x
./gradlew clean assemblePrdRelease

export APP_STORE=/app/appstore

cp /var/lib/jenkins/workspace/android-deploy-production/app/build/outputs/apk/*-release.apk $APP_STORE/repo/app-prd-release.apk
docker run --rm -v /app/appstore:/apk -v /app/appstore/repo:/apk/repo gotsunami/fdroid:v3 /usr/local/bin/run.sh

cp ./app/build/outputs/apk/*-release.apk /home/ubuntu/In-App-AutoUpdate-Server/apk-updater/apks/