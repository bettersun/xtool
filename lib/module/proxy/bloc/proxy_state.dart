import 'package:equatable/equatable.dart';

import '../view_model/vm.dart';

/// 代理State
abstract class ProxyState extends Equatable {
  @override
  List<Object> get props => [props];
}

/// 初始State
class ProxyInitState extends ProxyState {}

/// 完成State
class ProxyDoneState extends ProxyState {
  /// 代理View
  final ProxyView view;

  ProxyDoneState({this.view});

  @override
  List<Object> get props => [view];

  @override
  String toString() => 'ProxyDoneState';
}
