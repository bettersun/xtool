import 'package:equatable/equatable.dart';

import '../view_model/vm.dart';

/// 浏览State
/// 继承Equatable用于比较State的变化
abstract class ExplorerState extends Equatable {
  @override
  List<Object> get props => [props];
}

/// 初始State
class ExplorerInitState extends ExplorerState {}

/// 完成State
class ExplorerDoneState extends ExplorerState {
  /// 浏览View
  final ExplorerView view;

  ExplorerDoneState({this.view});

  @override
  List<Object> get props => [view];

  @override
  String toString() => 'ExplorerDoneState';
}
