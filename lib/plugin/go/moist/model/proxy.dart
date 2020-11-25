/// 代理信息
class ProxyInfo {
  /// 目标主机
  final String targetHost;

  /// 根Url
  final String baseUrl;

  /// 代理URL信息
  final List<ProxyUrl> proxyUrls;

  const ProxyInfo({
    this.targetHost = '',
    this.baseUrl = '',
    this.proxyUrls = const [],
  });

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
}

/// 代理URL信息
class ProxyUrl {
  /// URL
  final String url;

  /// 使用代理
  final bool useProxy;

  /// 响应JSON
  final String responseJson;

  const ProxyUrl({
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
}
