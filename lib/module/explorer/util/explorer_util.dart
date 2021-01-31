import 'package:flutter/material.dart';
import 'package:xtool/plugin/go/plugin.dart';
import 'package:uuid/uuid.dart';

import '../view_model/vm.dart';

/// 浏览工具类
class ExplorerUtil {
  /// 递归遍历TreeNode，转换为TreeNodeView
  /// 递归调用之外的调用deepth需要设置为0
  static TreeNodeView toTreeNodeView(
      TreeNode node, int deepth, String fatherId) {
    // 列表存放子TreeNode的View
    final List<TreeNodeView> childrenView = [];

    final String id = Uuid().v1();

    if (node.children != null) {
      // 深度 + 1
      final int d = deepth + 1;
      for (int i = 0; i < node.children.length; i++) {
        final TreeNode child = node.children[i];
        final TreeNodeView childView = toTreeNodeView(child, d, id);
        childrenView.add(childView);
      }
    }

    // 节点View
    final TreeNodeView view = TreeNodeView(
      id: id,
      fatherId: fatherId,
      key: node.key ?? '',
      name: node.name ?? '',
      path: node.path ?? '',
      isDir: node.isDir,
      deepth: deepth,
      children: childrenView,
      ancestorVisible: true,
    );

    return view;
  }

  /// 递归TreeNodeView
  /// 转换成TreeNodeView列表
  static void toTreeNodeViewList(
      TreeNodeView view, List<TreeNodeView> treeNodeViewlist) {
    // 当前节点
    final TreeNodeView newView = view.copyWith(children: []);
    if (newView.deepth > 0) {
      TreeNodeView treeNodeView = newView;

      if (newView.deepth == 1) {
        treeNodeView = newView.copyWith(visible: true, ancestorVisible: true);
      }

      treeNodeViewlist.add(treeNodeView);
    }

    // 子节点
    if (view.children != null) {
      for (int i = 0; i < view.children.length; i++) {
        final TreeNodeView subView = view.children[i];
        toTreeNodeViewList(subView, treeNodeViewlist);
      }
    }
  }

  /// 复制树节点
  static void copyTreeNodeView(
    TreeNodeView origTreeNodeView,
    TreeNodeView targetNodeView,
    TreeNodeView newTreeNodeView,
  ) {}

  /// 遍历树节点
  ///   treeNodeView: 原始树View(所有的节点View)
  ///   id: 节点ID
  ///   targetNodeIdList: 目标节点ID列表
  ///   isTarget: 目标节点标志
  static void traverseTreeNode(TreeNodeView treeNodeView, String id,
      List<String> targetNodeIdList, bool isTarget) {
    // 节点View的ID和id相等的情况，目标节点标志设为true。
    if (treeNodeView.id == id) {
      isTarget = true;
    }

    // 如果是目标节点，则把节点View的id添加到目标节点ID列表
    if (isTarget) {
      targetNodeIdList.add(treeNodeView.id);
    }

    // 原始树View的所有子节点View
    for (int i = 0; i < treeNodeView.children.length; i++) {
      // 递归找出所有目标节点ID
      final TreeNodeView tmpView = treeNodeView.children[i];
      traverseTreeNode(tmpView, id, targetNodeIdList, isTarget);
    }
  }

  /// 根据 ID 查找节点 View
  static TreeNodeView find(List<TreeNodeView> treeNodeViewlist, String id) {
    for (int i = 0; i < treeNodeViewlist.length; i++) {
      final TreeNodeView treeNodeView = treeNodeViewlist[i];
      if (treeNodeView.id == id) {
        return treeNodeView;
      }
    }

    return null;
  }

  /// 反向遍历，未完成
  /// TODO 查找所有祖先节点
  static void traverseBack(List<TreeNodeView> treeNodeViewList,
      TreeNodeView treeNodeView, bool isAllExpanded) {
    //
    for (int i = 0; i < treeNodeViewList.length; i++) {
      //
      final TreeNodeView tmpView = treeNodeViewList[i];
      //
      if (tmpView.id == treeNodeView.fatherId) {
        //
        if (!tmpView.isExpanded) {
          traverseBack(treeNodeViewList, tmpView, isAllExpanded);
        } else {
          isAllExpanded = true;
        }
      }
    }

    return null;
  }

  /// 图标: 展开折叠
  static Widget expandIconType(TreeNodeView nodeView) {
    Widget icon;

    final Color colorDir = Colors.black;
    const double size = 16.0;

    // 目录
    if (nodeView.isDir) {
      // 展开折叠
      if (nodeView.isExpanded) {
        icon = Icon(Icons.arrow_drop_down, size: size, color: colorDir);
      } else {
        icon = Icon(Icons.arrow_right, size: size, color: colorDir);
      }
    } else {
      // 文件
      icon = Container(
        alignment: Alignment.center,
        width: size,
        child: Text(' '),
      );
    }

    return icon;
  }

  /// 图标: 目录（文件夹）
  static Icon iconType(TreeNodeView nodeView) {
    Icon icon;

    const Color colorDir = Colors.orangeAccent;
    const Color colorFile = Colors.brown;
    const double size = 24.0;

    // 目录
    if (nodeView.isDir) {
      // 展开折叠
      if (nodeView.isExpanded) {
        icon = Icon(Icons.folder_open, size: size, color: colorDir);
      } else {
        icon = Icon(Icons.folder, size: size, color: colorDir);
      }
    } else {
      // 文件
      icon = Icon(Icons.description, size: size, color: colorFile);
    }

    return icon;
  }
}
