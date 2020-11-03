import 'package:equatable/equatable.dart';

import 'vm.dart';

/// 浏览View
class ExplorerView extends Equatable {
  // 树节点View(原始目录树)
  final TreeNodeView origTreeView;

  // 树节点View列表
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
