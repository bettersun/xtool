import 'package:equatable/equatable.dart';

import 'vm.dart';

/// 代理View
class ProxyInfoView extends Equatable {
  /// 目标主机
  final String targetHost;

  /// 根Url
  final String baseUrl;

  /// 代理URL信息
  final List<ProxyUrlView> proxyUrlViews;

  const ProxyInfoView({
    this.targetHost = '',
    this.baseUrl = '',
    this.proxyUrlViews = const [],
  });

  @override
  List<Object> get props => [targetHost, baseUrl, proxyUrlViews];

  ProxyInfoView copyWith({
    String targetHost,
    String baseUrl,
    List<ProxyUrlView> proxyUrlViews,
  }) {
    return ProxyInfoView(
      targetHost: targetHost ?? this.targetHost,
      baseUrl: baseUrl ?? this.baseUrl,
      proxyUrlViews: proxyUrlViews ?? this.proxyUrlViews,
    );
  }
}
