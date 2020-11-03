import 'package:equatable/equatable.dart';

import '../view_model/vm.dart';

/// 程序State
abstract class AppState extends Equatable {
  // 继承Equatable用于比较State的变化
  @override
  List<Object> get props => [props];
}

// 初始State
class AppInitState extends AppState {}

// 完成State
class AppDoneState extends AppState {
  // 程序View
  final AppView view;

  AppDoneState({this.view});

  @override
  List<Object> get props => [view];

  @override
  String toString() => 'AppDoneState';
}
