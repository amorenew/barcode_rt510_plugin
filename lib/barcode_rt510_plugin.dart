import 'dart:async';

import 'package:flutter/services.dart';

class BarcodeRT510Plugin {
  static const MethodChannel _channel = const MethodChannel('barcode_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static const EventChannel connectedStatusStream =
      EventChannel('ConnectedStatus');
  static const EventChannel tagsStatusStream = EventChannel('TagsStatus');

  static Future<bool> get isStarted async {
    return _channel.invokeMethod('isStarted');
  }

  static Future<bool> get start async {
    return _channel.invokeMethod('start');
  }

  static Future<bool> get stop async {
    return _channel.invokeMethod('stop');
  }

  static Future<bool> get close async {
    return _channel.invokeMethod('close');
  }

  static Future<bool> get clearData async {
    return _channel.invokeMethod('clearData');
  }

  static Future<bool> get isEmptyTags async {
    return _channel.invokeMethod('isEmptyTags');
  }

  static Future<bool> get connect async {
    return _channel.invokeMethod('connect');
  }

  static Future<bool> get isConnected async {
    return _channel.invokeMethod('isConnected');
  }

  static Future<bool> setPowerLevel(String value) async {
    return _channel
        .invokeMethod('setPowerLevel', <String, String>{'value': value});
  }

  static Future<int> setWorkArea(String value) async {
    return _channel
        .invokeMethod('setWorkArea', <String, String>{'value': value});
  }
}
