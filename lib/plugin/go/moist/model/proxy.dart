/// 代理信息
class ProxyInfo {
  /// 目标主机
  String targetHost;

  /// 根Url
  String baseUrl;

  /// 代理URL信息
  List<ProxyUrl> proxyUrls;

  ProxyInfo(
      {this.targetHost = '', this.baseUrl = '', this.proxyUrls = const []});

  ProxyInfo copyWith({
    String targetHost,
    String baseUrl,
    List<ProxyUrl> proxyUrls,
  }) {
    return ProxyInfo(
      targetHost: targetHost ?? this.targetHost,
      baseUrl: baseUrl ?? this.baseUrl,
      proxyUrls: proxyUrls ?? this.proxyUrls,
    );
  }

  ProxyInfo.fromJson(Map<dynamic, dynamic> json) {
    targetHost = json['targetHost'] as String;
    baseUrl = json['baseUrl'] as String;
    if (json['proxyUrls'] != null) {
      proxyUrls = [];
      json['proxyUrls'].forEach((v) {
        proxyUrls.add(ProxyUrl.fromJson(v as Map<dynamic, dynamic>));
      });
    }
  }
}

/// 代理URL信息
class ProxyUrl {
  /// URL
  String url;

  /// 使用代理
  bool useProxy;

  /// 响应JSON
  String responseJson;

  ProxyUrl({
    this.url = '',
    this.useProxy = false,
    this.responseJson = '',
  });

  ProxyUrl copyWith({
    String url,
    bool useProxy,
    String responseJson,
  }) {
    return ProxyUrl(
      url: url ?? this.url,
      useProxy: useProxy ?? this.useProxy,
      responseJson: responseJson ?? this.responseJson,
    );
  }

  ProxyUrl.fromJson(Map<dynamic, dynamic> json) {
    url = json['url'] as String;
    useProxy = json['useProxy'] as bool;
    responseJson = json['responseJson'] as String;
  }
}
