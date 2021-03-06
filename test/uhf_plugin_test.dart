import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:barcode_rt510_plugin/barcode_rt510_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('barcode_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await BarcodeRT510Plugin.platformVersion, '42');
  });
}
