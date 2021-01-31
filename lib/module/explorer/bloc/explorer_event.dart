import '../view_model/vm.dart';

/// 浏览Event
abstract class ExplorerEvent {}

/// 初始化Event
class ExplorerInitEvent extends ExplorerEvent {}

/// 浏览Event
class ExplorerExplorerEvent extends ExplorerEvent {
  /// 浏览View
  final ExplorerView view;

  ExplorerExplorerEvent({this.view});

  @override
  String toString() => 'ExplorerExplorerEvent';
}

/// 展开折叠Event
class ExplorerExpandEvent extends ExplorerEvent {
  /// 树节点View
  final TreeNodeView nodeView;

  ExplorerExpandEvent({this.nodeView});

  @override
  String toString() => 'ExplorerExpandEvent';
}

/// 选中反选Event
class ExplorerSelectEvent extends ExplorerEvent {
  /// 树节点View
  final TreeNodeView nodeView;

  ExplorerSelectEvent({this.nodeView});

  @override
  String toString() => 'ExplorerSelectEvent';
}
