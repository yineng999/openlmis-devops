# Release failure plan

This readme will detail the development team process when a release is problematic.

## 1. No data migration in the release

If a release has critical issues, and the release does not include any data migrations, we can simply roll back the release:

Web: use the rollback script on web server side and roll back to the previous version.

$ `ansible-playbook -u xxx -private-key=xxx -i provisioning/hosts deployment/rollback-prod-playbook.yml`

App: use the previous app apk and update the version number to the newest. Push to app store.

$ `git checkout PREVIOUS_VERSION_TAG`
$ `git checkout hot-deploy`
Update the version number in gradle.properties
Build the jenkins job android-hot-deploy


## 2. Data migrations included in the release, issues are with new features

If a release has critical issues, and the release includes data migrations (either on web side or app side), and the critical issues are with the new features:

Web: turn off the feature toggle for the problematic new features, and release again.

On the servers, find app.properties and switch the features with problems to "false". Restart tomcat.

App: turn off the feature toggle for the problematic new features, and release again.

$ `git checkout PREVIOUS_VERSION_TAG`
$ `git checkout hot-deploy`
Turn off features with problems
Update the version number in gradle.properties
Build the jenkins job android-hot-deploy


## 3. Data migrations included in the release, issues are with existing features

If a release has critical issues, and the release includes data migrations (either on web side or app side), and the critical issues are with the existing features:

In this case, we need to put in a hot fix.

Web: add the hot fix to hot-deploy branch, and use Jenkins to build the war. Follow the same deployment procedure.

$ `git checkout hot-deploy`
Make the fix
Make sure all tests pass (including app and web)
Build the Jenkins web-build-hot-deploy pipeline.
$ `ansible-playbook -u xxx -private-key=xxx -i provisioning/hosts --extra-vars '{"BUILD_NO":"[HOT_DEPLOY_BUILD]", "DBPASSWORD":"[DB_PASSWORD]"}'  deploy-to-prod-playbook.yml`

App: add the hot fix to hot-deploy branch, and use the jenkins hot-deploy pipeline.

$ `git checkout hot-deploy`
Make the fix
Make sure all tests pass
Build the jenkins job android-hot-deploy

