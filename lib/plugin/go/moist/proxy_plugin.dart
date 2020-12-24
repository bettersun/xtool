import 'dart:async';

import 'package:flutter/services.dart';

/// 代理插件
class ProxyPlugin {
  // go-flutter插件中的包名，两者必须一致
  static const _channel =
      MethodChannel('bettersun.go-flutter.plugin.moist.proxy');

  // 重新加载运行时代理信息
  static Future<Map> loadProxyInfo() async {
    print('loadProxyInfo');
    final Map m = await _channel.invokeMethod('loadProxyInfo');

    print(m);
    return m;
  }

  // 运行服务
  static Future<Map> runServer() async {
    print('runServer');
    final Map m = await _channel.invokeMethod('run');

    print(m);
    return m;
  }

  // 重新加载运行时代理信息
  static Future<Map> reload() async {
    print('reload');
    final Map m = await _channel.invokeMethod('reload');

    print(m);
    return m;
  }

  // 关闭服务
  static Future<Map> closeServer() async {
    print('closeServer');
    final Map m = await _channel.invokeMethod('close');

    print(m);
    return m;
  }
}
