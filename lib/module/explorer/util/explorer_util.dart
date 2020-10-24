import 'package:flutter/material.dart';
import 'package:xtool/plugin/go/plugin.dart';
import 'package:uuid/uuid.dart';

import '../view_model/view_model.dart';

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
        treeNodeView = newView.copyWith(visible: true);
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
  static void traverseTreeNode(TreeNodeView treeNodeView, String id,
      List<String> targetNodeIdList, bool isTarget) {
    //
    if (treeNodeView.id == id) {
      isTarget = true;
    }

    //
    if (isTarget) {
      targetNodeIdList.add(treeNodeView.id);
    }

    for (int i = 0; i < treeNodeView.children.length; i++) {
      //
      final TreeNodeView tmpView = treeNodeView.children[i];
      traverseTreeNode(tmpView, id, targetNodeIdList, isTarget);
    }
  }

  ///
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
  }

  /// 展开类型
  static Widget expandIconType(TreeNodeView nodeView) {
    Widget icon;

    final Color colorDir = Colors.black;
    const double size = 16.0;

    // 目录
    if (nodeView.isDir) {
      // 展开收起
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

  /// 图标类型
  static Icon iconType(TreeNodeView nodeView) {
    Icon icon;

    const Color colorDir = Colors.orangeAccent;
    const Color colorFile = Colors.brown;
    const double size = 24.0;

    // 目录
    if (nodeView.isDir) {
      // 展开收起
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
