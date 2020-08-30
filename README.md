# barcode_plugin

A flutter plugin for Tablet Alps ax6737 to read Barcode Cards.

#### Library Pub link
https://pub.dev/packages/barcode_plugin


### Getting Started

##### In your Gradle exclude Flutter so files because libary is working in 32bit mode
##### Only use release apk because running from IDE will not exclude 64bit files
    `packagingOptions {
        exclude 'lib/arm64-v8a/libflutter.so'
        exclude 'lib/arm64-v8a/libapp.so'
    }`

- Import the library:
   `import 'package:barcode_rt510_plugin/barcode_rt510_plugin.dart';`

- Open connection to the Barcode reader

    `await BarcodePlugin.connect`

- Check if is the reader connected

    `await BarcodePlugin.isConnected;`

- Start reading data

    `await BarcodePlugin.start;`
    
- Is started reading

   `await BarcodePlugin.isStarted;`

- Stop Reading

   `await BarcodePlugin.stop;`

- Close the connection

   `await BarcodePlugin.close;`

- Clear cached data for the reader

   `await BarcodePlugin.clearData;`

- Is Empty Tags

   `await BarcodePlugin.isEmptyTags;`

- Listen to connection status

   `BarcodePlugin.connectedStatusStream.receiveBroadcastStream().listen(updateIsConnected);`
   updateIsConnected should listen to bool value

- Listen to tags status

   `BarcodePlugin.tagsStatusStream.receiveBroadcastStream().listen(updateTags);`
   ```dart
      List<TagEpc> _data = [];
      void updateTags(dynamic result) {
       setState(() {
           _data = TagEpc.parseTags(result);
        });
      }
   ```
![alt text](https://github.com/amorenew/barcode_rt510_plugin/raw/master/sample1.png)

