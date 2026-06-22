We currently have no apps released to production in either app store so we follow a simple continuous deployment model. Pushing to `main` builds the apps in GitHub Actions and automatically releases the build to our named internal testers.

## Android

### Manual first release

1. Update the version in `pubspec.yaml` to `0.0.1`
a. Remove the `+` build number on the end - we will inject that manually in GitHub Actions CD.
1. Set up your key store locally to sign the app bundle
a. Open the `android` subfolder project created by Flutter in Android Studio
b. Follow the official instructions [Sign your app | Android Studio | Android Developers](https://developer.android.com/studio/publish/app-signing#generate-key), choosing **App Bundle** not APK
c. For key store path, choose a path not in the repository just to avoid accidentally committing it. Note this must be an absolute path, not a relative one.
d. For `alias`, choose `upload`. (It can be anything but ultimately this is an ?Android Upload Key so useful to try and be descriptive and consistent)
1. Reference the keystore from the build: [Android | Flutter](https://docs.flutter.dev/deployment/android#reference-the-keystore-from-the-app)
1a. Add the `key.properties` file to `.gitignore`
1. Configure signing in Gradle: [Android | Flutter](https://docs.flutter.dev/deployment/android#configure-signing-in-gradle)
1. Review the app manifest
1. Build the app bundle locally (`flutter build appbundle`)
a. You have to do the first upload manually before you can set up CI with GitHub actions
1. Create the app in the [Google Play console](https://play.google.com/console/u/0/developers)
1. `Start testing now` > `Release your app early for internal testing without review
` > `Select testers`. Choose `Internal Testing`
1. Click `Create a new release`
a. Upload the build we did earlier (`build\app\outputs\bundle\release\app-release.aab`)
b. I got an error here as it seems the build is debug signed even though it's in the release folder `You uploaded an APK or Android App Bundle that was signed in debug mode. You need to sign your APK or Android App Bundle in release mode`
1c. Instead I went to Android Studio and `Build` > `Generate Signed App Bundle or APK`. That wrote the build to `android/app/release` and it seemed to be accepted. Probably something I did wrong. Either way, don't commit that build to git.
1. Save and Publish
2. Click the Testers tab on the Release. On the bottom of that page is a link that users in the "Internal Testers" group can use to install the app.

### Release to closed testing to workaround Play Store bug

We are just using Internal Testing for now which grants access to the users whitelisted in the "Internal Testers" group and doesn't require Google approval. Unfortunately there is a bug where you can't do an automated internal testing release before you have submitted at least one release for "Closed Testing".

- [Only releases with status draft may be created on draft app. · Issue #70 · r0adkll/upload-google-play](https://github.com/r0adkll/upload-google-play/issues/70)
- [How does fully create an internal release on Google Play Console via API? - Stack Overflow](https://stackoverflow.com/questions/76541480/how-does-fully-create-an-internal-release-on-google-play-console-via-api)
- [Google Play API: How can I make a draft release available to internal testers - Google Play Developer Community](https://support.google.com/googleplay/android-developer/thread/240224208?hl=en&msgid=240505590)

Whilst this does require Google approval it seems like placeholder information is fine and it unblocks the automated internal releases as soon as we submit for review rather than on approval.

1. Go to the app on the [Google Play console](https://play.google.com/console/u/0/developers)
2. Follow the steps under `Set up your app` > `Provide information about your app and set up your Store Listing
`
a. It will often send to back to the "Publishing Overview" page after completing a step so try going back in through the dashboard to see what's left to complete
b. For Privacy Policy, use the [RCPCH Website Privacy Policy](https://www.rcpch.ac.uk/about-us/privacy-policy-website) as the placeholder
c. For Content Rating email address use incubator@rcpch.ac.uk
d. You have the click "Save" on the "Content Rating" questionnaire before you can click "Next" :skull:
e. For "Target Audience", choose "18+" but don't choose "Restrict declared minors from my app"
f. On "Store settings" (from "select an app category") you have to click "Edit" in the top right of each section to update them
e. For Contact Details, put incubator@rcpch.ac.uk and the RCPCH switchboard phone (+44 (0)20 7092 6000)
f. For "App Icon", I'm using a placeholder Incubator icon 
![incubator-white-icon|500x500, 50%](upload://Aduscpoy5deBDszEqQLvUsbw4bW.png)
g. For "Feature graphic" I just resized the placeholder icon 
![incubator-white-feature|690x336, 50%](upload://bxNzLzYS3J9ir3tLMM3ZOC5KAl5.png)
h. It says Tablet screenshots are mandatory but it seems to accept creating the release without them
3. Follow the steps under "Release your app" > "Test your app with a larger group of testers that you control"
a. Don't click "Create new release". Instead go to the internal testing release we made earlier and promote it to "Closed testing"
4. Send the changes for review on the "Publishing Overview" tab


### Automate internal testing releases on main

1. Copy the example GitHub action from [rcpch-livinglens/.github/workflows/deploy-testing.yml at main · rcpch/rcpch-livinglens](https://github.com/rcpch/rcpch-livinglens/blob/main/.github/workflows/deploy-testing.yml)
1. Create the `s/ci` script to build the app
1. base64 encode the `key.properties` file and keystore you created in the previous steps and add them as repo secrets ([idea cribbed from here](https://medium.com/lodgify-technology-blog/deploy-your-flutter-app-to-google-play-with-github-actions-f13a11c4492e))
a. `base64 -i upload-keystore.jks > upload-keystore.jks.b64.txt`
1. Create a Google Cloud service account to call the API [following these instructions](https://github.com/r0adkll/upload-google-play?tab=readme-ov-file#configure-access-via-service-account)
a. Currently the service accounts are in a gcloud project per app under a Google Account registered to @michael.barton. We should aim to move these projects to a shared RCPCH organisation.
1. Set up [Workload Identity Federation through a Service Account](https://github.com/google-github-actions/auth?tab=readme-ov-file#workload-identity-federation-through-a-service-account) to allow GitHub actions to publish the app rather than a GitHub secret with the service account JSON
a. [Use GitHub numeric IDs to avoid repo name squatting](https://github.com/google-github-actions/auth/blob/main/docs/SECURITY_CONSIDERATIONS.md#use-githubs-numeric-immutable-values)
b. Skip step 7 ("grant the Google Cloud Service Account permissions"). It seems to have permission already.
1. Update the `packageName` on the release step

## iOS

Not implemented yet ( [Automated testing releases on iOS · Issue #8 · rcpch/rcpch-livinglens](https://github.com/rcpch/rcpch-livinglens/issues/8))

<div data-theme-toc="true"> </div>