import '../view_model/vm.dart';

/// 搜索Event
abstract class SearchEvent {}

/// 初始化Event
class SearchInitEvent extends SearchEvent {}

/// 搜索Event
class SearchSearchEvent extends SearchEvent {
  /// 搜索选项View
  final SearchOptionView optionView;

  SearchSearchEvent({this.optionView});

  @override
  String toString() => 'SearchSearchEvent';
}

/// 改变值Event
class SearchChangeValueEvent extends SearchEvent {
  // 项目Key
  final String itemKey;
  // 项目的最新值
  final dynamic newVal;

  SearchChangeValueEvent({this.itemKey, this.newVal});

  @override
  String toString() => 'SearchChangeValueEvent';
}

/// 切换结果Event
class SearchToggleResultEvent extends SearchEvent {
  /// 结果表示标志
  final String resultFlag;

  SearchToggleResultEvent({this.resultFlag});

  @override
  String toString() => 'SearchToggleResultEvent';
}
