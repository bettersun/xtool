import 'package:xtool/plugin/go/plugin.dart';

import '../view_model/vm.dart';

import 'proxy_service.dart';

/// 代理Service实现
class ProxyServiceImpl extends ProxyService {
  @override
  Future<ProxyView> init() async {
    return ProxyView(proxyInfo: ProxyInfo());
  }

  @override
  Future<ProxyView> run() async {
    await ProxyPlugin.runServer();

    return ProxyView(proxyInfo: ProxyInfo());
  }

  @override
  Future<ProxyView> reload() async {
    await ProxyPlugin.reload();

    return ProxyView(proxyInfo: ProxyInfo());
  }

  @override
  Future<ProxyView> close() async {
    await ProxyPlugin.runServer();

    return ProxyView(proxyInfo: ProxyInfo());
  }
}
