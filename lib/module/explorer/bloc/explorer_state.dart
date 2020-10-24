import 'package:equatable/equatable.dart';

import '../view_model/view_model.dart';

/// 浏览State
abstract class ExplorerState extends Equatable {
  // 继承Equatable用于比较State的变化
  @override
  List<Object> get props => [props];
}

// 初始State
class ExplorerInitState extends ExplorerState {}

// 完成State
class ExplorerDoneState extends ExplorerState {
  // 浏览View
  final ExplorerView view;

  ExplorerDoneState({this.view});

  @override
  List<Object> get props => [view];

  @override
  String toString() => 'ExplorerDoneState';
}
