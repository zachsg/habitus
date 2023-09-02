# habitus
Habitus app.

## Building
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
