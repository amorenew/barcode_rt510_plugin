# barcode_plugin

A flutter plugin for Tablet RT510 to read Barcode Cards.

#### Library Pub link
https://pub.dev/packages/barcode_rt510_plugin


### Getting Started

##### In your Gradle exclude Flutter so files because libary is working in 32bit mode
##### Only use release apk because running from IDE will not exclude 64bit files
    `packagingOptions {
        exclude 'lib/arm64-v8a/libflutter.so'
        exclude 'lib/arm64-v8a/libapp.so'
         pickFirst 'lib/armeabi-v7a/libdevapi.so'//In case a library conflict with other libs
    }`

- Import the library:
   `import 'package:barcode_rt510_plugin/barcode_rt510_plugin.dart';`

- Single Scan for the barcode

    `await BarcodeRT510Plugin.scanSingle;`
    
- Continuous Scan for the barcode

   `await BarcodeRT510Plugin.scanContinuous;`

- Stop Reading

   `await BarcodeRT510Plugin.stop;`

- Clear cached data for the reader

   `await BarcodeRT510Plugin.clearData;`

- Listen to barcodes status

   `BarcodePlugin.barcodeStatusStream.receiveBroadcastStream().listen(updateBarcodes);`
   ```dart
      List<String> _data = [];
       void updateBarcodes(dynamic result) {
       setState(() {
      _data.add(result);
      });
  }
   ```

