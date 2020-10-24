import '../view_model/view_model.dart';

/// 浏览Event
abstract class ExplorerEvent {}

// 加载Event
class ExplorerLoadEvent extends ExplorerEvent {}

// 浏览Event
class ExplorerExplorerEvent extends ExplorerEvent {
  // 浏览View
  final ExplorerView view;

  ExplorerExplorerEvent({this.view});

  @override
  String toString() => 'ExplorerExplorerEvent';
}

// 展开收起Event
class ExplorerExpandEvent extends ExplorerEvent {
  // 树节点View
  final TreeNodeView nodeView;

  ExplorerExpandEvent({this.nodeView});

  @override
  String toString() => 'ExplorerExpandEvent';
}

// 选中反选Event
class ExplorerSelectEvent extends ExplorerEvent {
  // 树节点View
  final TreeNodeView nodeView;

  ExplorerSelectEvent({this.nodeView});

  @override
  String toString() => 'ExplorerSelectEvent';
}
