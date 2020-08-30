import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:barcode_rt510_plugin/barcode_rt510_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await BarcodeRT510Plugin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    BarcodeRT510Plugin.barcodeStatusStream
        .receiveBroadcastStream()
        .listen(updateBarcodes);
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  List<String> _data = [];
  void updateBarcodes(dynamic result) {
    setState(() {
      _data.add(result);
    });
  }


  @override
  Widget build(BuildContext context) {
    //_data.add(TagEpc(count: 10, epc: '5SETF7656GGY5578'));
    //_data.add(TagEpc(count: 10, epc: '6757568YG76658GH'));
    // _data.add(TagEpc(count: 10, epc: 'TNB75G568YG758GH'));
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Barcode PROGAZE'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset(
                    'assets/logo.png',
                    width: double.infinity,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              /*Text('Running on: $_platformVersion'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                      child: Text('Call connect'),
                      onPressed: () async {
                        await BarcodeRT510Plugin.connect;
                      }),
                  RaisedButton(
                      child: Text('Call is Connected'),
                      onPressed: () async {
                        bool isConnected = await BarcodeRT510Plugin.isConnected;
                        setState(() {
                          this._isConnected = isConnected;
                        });
                      }),
                ],
              ),
              Text(
                'Barcode Reader isConnected:$_isConnected',
                style: TextStyle(color: Colors.blue.shade800),
              ),*/
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      color: Colors.blueAccent,
                      child: Text(
                        'Call Scan Single',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        await BarcodeRT510Plugin.scanSingle;
                      }),
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      color: Colors.blueAccent,
                      child: Text(
                        'Call Scan Continuous',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        await BarcodeRT510Plugin.scanContinuous;
                      }),
                ],
              ),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.blueAccent,
                  child: Text(
                    'Call Stop',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    await BarcodeRT510Plugin.stop;
                  }),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.blueAccent,
                  child: Text(
                    'Call Clear Data',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    await BarcodeRT510Plugin.clearData;
                    setState(() {
                      _data = [];
                    });
                  }),
              Container(
                width: double.infinity,
                height: 2,
                margin: EdgeInsets.symmetric(vertical: 8),
                color: Colors.blueAccent,
              ),
              ..._data.map((String barcode) => Card(
                    color: Colors.blue.shade50,
                    child: Container(
                      width: 330,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Barcode $barcode',
                        style: TextStyle(color: Colors.blue.shade800),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
