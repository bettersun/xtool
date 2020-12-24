import 'package:xtool/plugin/go/plugin.dart';

import '../view_model/vm.dart';
import 'proxy_service.dart';

/// 代理Service实现
class ProxyServiceImpl extends ProxyService {
  @override
  Future<ProxyInfoView> init() async {
    // final Map m = await ProxyPlugin.loadProxyInfo();

    // final ProxyInfo proxyInfo = ProxyInfo.fromJson(m);
    // print('await ProxyPlugin.loadProxyInfo()');
    // print(proxyInfo);

    final List<ProxyUrlView> urlViews = [];

    final ProxyUrlView urlView1 = ProxyUrlView(
      url: '/helo',
      useProxy: true,
      responseJson: '/json/hello.json',
    );
    final ProxyUrlView urlView2 = ProxyUrlView(
      url: '/goodbye',
      useProxy: false,
      responseJson: '/json/goodbye.json',
    );
    final ProxyUrlView urlView3 = ProxyUrlView(
      url: '/welcome',
      useProxy: true,
      responseJson: '/json/welcome.json',
    );

    urlViews.add(urlView1);
    urlViews.add(urlView2);
    urlViews.add(urlView3);

    const String targetHost = 'http://127.0.0.1:8002';
    const String baseUrl = '/bettersun';

    return ProxyInfoView(
      targetHost: targetHost,
      baseUrl: baseUrl,
      proxyUrlViews: urlViews,
    );
  }

  @override
  Future<ProxyInfoView> run() async {
    await ProxyPlugin.runServer();

    return ProxyInfoView();
  }

  @override
  Future<ProxyInfoView> reload() async {
    await ProxyPlugin.reload();

    return ProxyInfoView();
  }

  @override
  Future<ProxyInfoView> close() async {
    await ProxyPlugin.runServer();

    return ProxyInfoView();
  }
}
