import 'package:equatable/equatable.dart';
import 'package:xtool/plugin/go/moist/model/model.dart';

/// 代理View
class ProxyView extends Equatable {
  final ProxyInfo proxyInfo;

  const ProxyView({this.proxyInfo});

  @override
  List<Object> get props => [proxyInfo];

  ProxyView copyWith({
    ProxyInfo proxyInfo,
  }) {
    return ProxyView(
      proxyInfo: proxyInfo ?? this.proxyInfo,
    );
  }
}
