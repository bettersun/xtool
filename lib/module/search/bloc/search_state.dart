import 'package:equatable/equatable.dart';

import '../view_model/vm.dart';

/// 搜索State
abstract class SearchState extends Equatable {
  @override
  List<Object> get props => [props];
}

/// 初始State
class SearchInitState extends SearchState {}

/// 完成State
class SearchDoneState extends SearchState {
  /// 搜索View
  final SearchView view;

  SearchDoneState({this.view});

  @override
  List<Object> get props => [view];

  @override
  String toString() => 'SearchDoneState';
}
