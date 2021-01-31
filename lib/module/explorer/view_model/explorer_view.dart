import 'package:equatable/equatable.dart';

import 'vm.dart';

/// 浏览View
class ExplorerView extends Equatable {
  // 树节点View(原始树View)
  final TreeNodeView origTreeView;

  // 树节点View列表(画面表示用)
  //  画面上使用列表和缩进来表现树
  final List<TreeNodeView> treeNodeViewList;

  @override
  List<Object> get props => [
        treeNodeViewList,
        origTreeView,
      ];

  const ExplorerView({this.treeNodeViewList, this.origTreeView});

  ExplorerView copyWith({
    TreeNodeView origTreeView,
    List<TreeNodeView> treeNodeViewList,
  }) {
    return ExplorerView(
      origTreeView: origTreeView ?? this.origTreeView,
      treeNodeViewList: treeNodeViewList ?? this.treeNodeViewList,
    );
  }
}
