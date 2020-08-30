import 'dart:async';

import 'package:flutter/services.dart';

class BarcodeRT510Plugin {
  static const MethodChannel _channel = const MethodChannel('barcode_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  //static const EventChannel connectedStatusStream =
  //    EventChannel('ConnectedStatus');
  static const EventChannel barcodeStatusStream = EventChannel('BarcodeStatus');

  static Future<void> get scanSingle async {
    return _channel.invokeMethod('scanSingle');
  }

  static Future<void> get scanContinuous async {
    return _channel.invokeMethod('scanContinuous');
  }

  static Future<bool> get stop async {
    return _channel.invokeMethod('stop');
  }

  static Future<bool> get clearData async {
    return _channel.invokeMethod('clearData');
  }
}
