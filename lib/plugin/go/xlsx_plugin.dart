import 'dart:async';

import 'package:flutter/services.dart';

class XlsxPlugin {
  // go-flutter插件中的包名，两者必须一致
  static const _channel = MethodChannel('bettersun.go-flutter.plugin.xlsx');

  // go-flutter插件中的函数名，无参
  static Future<String> readCell(
      String file, String sheetName, String axis) async {
    final Map<String, dynamic> param = <String, dynamic>{};

    param['file'] = file;
    param['sheetName'] = sheetName;
    param['axis'] = axis;

    return _channel.invokeMethod('readCell', param);
  }
}
