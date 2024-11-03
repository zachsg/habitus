# Mobn
Mobn app.

## Screeshots
<div>
  <p>
    <img src="https://github.com/user-attachments/assets/53c8efb3-0339-4f3b-bb70-34f16a041089" width="200">
    &nbsp;
    <img src="https://github.com/user-attachments/assets/b74248af-b157-4e1f-a4c0-ba1de3909d78" width="200">
    &nbsp;
    <img src="https://github.com/user-attachments/assets/78ad2221-90fe-4c8b-a531-769cfca771e9" width="200">
    &nbsp;
  </p>
  <p>
    <img src="https://github.com/user-attachments/assets/bd3d360a-6c7c-44ee-8a30-21b38c12586f" width="200">
    &nbsp;
    <img src="https://github.com/user-attachments/assets/4602fb78-e9d0-4f33-94c9-5ff2e1cb547f" width="200">
    &nbsp;
    <img src="https://github.com/user-attachments/assets/2720feff-3981-4791-af37-0655b52cc220" width="200">
    &nbsp;
  </p>
  <p>
    <img src="https://github.com/user-attachments/assets/5d4d78b9-0e48-45fb-9982-3be94c5be514" width="200">
    &nbsp;
    <img src="https://github.com/user-attachments/assets/eb77081d-a6fc-446f-ac77-2741406ce04e" width="200">
    &nbsp;
  </p>
</div>

## Building
### Production
#### Android
- Build app bundle: `flutter build appbundle`

#### iOS
- Run `flutter build ios` to re-build app from command line (and ensure version changes get pushed to Xcode)
- Open XCWorkspace file in ios/ directory in Xcode
- Set build target to "Any iOS device (arm64)"
- Product > Archive
- Go through distribution flow once built to send to Appstore Connect

### Development
To clean project: `flutter clean`
To get packages: `flutter pub get`
To build and run application: `flutter run`

## Generate models
To run code generation: `dart run build_runner watch`

## Create / Modify splash page
To create or updated splash page: `dart run flutter_native_splash:create`
You can also specify path to YAML: `dart run flutter_native_splash:create --path=path/to/my/file.yaml`

## Generate app icon
To update app icon run: `flutter pub run flutter_launcher_icons`
You can also specify path to YAML: `flutter pub run flutter_launcher_icons -f <your config file name here>`

## Upgrading libs
To update dependencies automatically, run: `flutter pub upgrade --major-versions`
