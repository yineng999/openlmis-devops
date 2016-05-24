# Release failure plan

This readme will detail the development team process when a release is problematic.

## 1. No data migration in the release

If a release has critical issues, and the release does not include any data migrations, we can simply roll back the release:

Web: use the rollback script on web server side and roll back to the previous version.
App: use the previous app apk and update the version number to the newest. Push to app store.


## 2. Data migrations included in the release, issues are with new features

If a release has critical issues, and the release includes data migrations (either on web side or app side), and the critical issues are with the new features:

Web: turn off the feature toggle for the problematic new features, and release again.
App: turn off the feature toggle for the problematic new features, and release again.

## 3. Data migrations included in the release, issues are with existing features

If a release has critical issues, and the release includes data migrations (either on web side or app side), and the critical issues are with the existing features:

In this case, we need to put in a hot fix.

Web: add the hot fix to hot-deploy branch, and use Jenkins to build the war. Follow the same deployment procedure.
App: add the hot fix to hot-deploy branch, and use the jenkins hot-deploy pipeline.