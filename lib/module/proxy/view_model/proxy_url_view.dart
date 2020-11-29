import 'package:equatable/equatable.dart';

/// 代理Url View
class ProxyUrlView extends Equatable {
  /// URL
  final String url;

  /// 使用代理
  final bool useProxy;

  /// 响应JSON
  final String responseJson;

  const ProxyUrlView({
    this.url = '',
    this.useProxy = false,
    this.responseJson = '',
  });

  @override
  List<Object> get props => [url, useProxy, responseJson];

  ProxyUrlView copyWith({
    String url,
    bool useProxy,
    String responseJson,
  }) {
    return ProxyUrlView(
      url: url ?? this.url,
      useProxy: useProxy ?? this.useProxy,
      responseJson: responseJson ?? this.responseJson,
    );
  }
}
