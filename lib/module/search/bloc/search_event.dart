import '../view_model/vm.dart';

/// 浏览Event
abstract class SearchEvent {}

/// 初始化Event
class SearchInitEvent extends SearchEvent {}

/// 浏览Event
class SearchSearchEvent extends SearchEvent {
  /// 浏览View
  final SearchView view;

  SearchSearchEvent({this.view});

  @override
  String toString() => 'SearchSearchEvent';
}
