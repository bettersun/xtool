import 'package:xtool/common/util/util.dart';
import 'package:xtool/plugin/go/plugin.dart';

import '../bloc/bloc.dart';
import '../util/util.dart';
import '../view_model/vm.dart';

import 'explorer_service.dart';

/// 浏览Service实现
class ExplorerServiceImpl extends ExplorerService {
  @override
  Future<ExplorerDoneState> init() async {
    final List<String> p = [];
    // p.add('E:\\BS\\Mac');
    // p.add('E:\\BS\\Test');
    p.add('/Users/sunjiashu/Documents/Develop/github.com/bettersun/xtool/lib');

    final List<String> ip = [];
    ip.add('.git');

    final List<String> iFile = [];
    iFile.add('');

    final ExplorerOption option = ExplorerOption();
    option.rootPath = p;
    option.includeSubPath = true;
    option.ignorePath = ip;
    option.ignoreFile = iFile;

    // 调用插件方法
    final TreeNode tree = await MoistPlugin.explorer(option);

    // TreeNode转换成TreeNodeView
    final TreeNodeView treeNodeView = ExplorerUtil.toTreeNodeView(tree, 0, '');

    /// TreeNodeView转换成TreeNodeView列表
    final List<TreeNodeView> treeNodeViewlist = [];
    ExplorerUtil.toTreeNodeViewList(treeNodeView, treeNodeViewlist);

    final ExplorerView explorerView = ExplorerView(
        treeNodeViewList: treeNodeViewlist, origTreeView: treeNodeView);

    return ExplorerDoneState(view: explorerView);
  }

  @override
  Future<ExplorerDoneState> explorer(ExplorerView explorerView) {
    //
    throw UnimplementedError();
  }

  /// 展开折叠
  ///  explorerView: 当前View
  ///  nodeView: 选中节点的View
  @override
  Future<ExplorerDoneState> expand(
      ExplorerView explorerView, TreeNodeView nodeView) async {
    // 新的树节点View列表(画面表示用)
    final List<TreeNodeView> newTreeNodeViewlist = [];

    // 新状态为展开/折叠状态的反状态
    final bool isNewStateExpanded = !nodeView.isExpanded;

    // 目标节点ID列表
    final List<String> targetNodeIdList = [];
    ExplorerUtil.traverseTreeNode(
        explorerView.origTreeView, nodeView.id, targetNodeIdList, false);

    // 当前的树节点View列表(画面表示用)
    final List<TreeNodeView> treeNodeViewlist = explorerView.treeNodeViewList;
    for (int i = 0; i < treeNodeViewlist.length; i++) {
      final TreeNodeView tmpNodeView = treeNodeViewlist[i];

      // 循环中当前元素的节点View 为 选中的节点View
      if (tmpNodeView.id == nodeView.id) {
        // 展开折叠切换
        newTreeNodeViewlist
            .add(nodeView.copyWith(isExpanded: isNewStateExpanded));
      } else {
        // 子目录或文件
        if (Util.isInList(targetNodeIdList, tmpNodeView.id)) {
          // ！！需要原始目录树的信息！！
          // 没有子目录或文件的信息时，添加目录的子目录或文件信息
          // 有子目录或文件的信息时，设为可见

          // 展开折叠状态转为展开
          if (isNewStateExpanded) {
            // 查找父节点View
            final TreeNodeView fatherNodeView =
                ExplorerUtil.find(treeNodeViewlist, tmpNodeView.fatherId);

            // 父节点View的ID和选中节点View的ID相同，即父节点View为选中的节点View
            if (fatherNodeView.id == nodeView.id) {
              // 当前节点View的可见标志设为true、祖先可见标志也设为true
              newTreeNodeViewlist.add(
                  tmpNodeView.copyWith(visible: true, ancestorVisible: true));
            } else {
              // 父节点View的ID和选中节点View的ID不同，即父节点View不是选中的节点View

              // 父节点为展开状态时
              if (fatherNodeView.isExpanded) {
                // 当前节点View的可见标志设为true、祖先可见标志也设为true
                newTreeNodeViewlist.add(
                    tmpNodeView.copyWith(visible: true, ancestorVisible: true));
              } else {
                // 父节点为折叠状态时
                newTreeNodeViewlist.add(tmpNodeView.copyWith(visible: false));
              }
            }
          }
          // 展开状态转为折叠状态
          // 所有后代目录或文件设为不可见
          if (!isNewStateExpanded) {
            newTreeNodeViewlist
                .add(tmpNodeView.copyWith(ancestorVisible: false));
          }
        } else {
          // 非子目录或文件
          newTreeNodeViewlist.add(tmpNodeView);
        }
      }
    }

    final ExplorerView newView =
        explorerView.copyWith(treeNodeViewList: newTreeNodeViewlist);

    return ExplorerDoneState(view: newView);
  }

  @override
  Future<ExplorerDoneState> select(
      ExplorerView explorerView, TreeNodeView nodeView) async {
    final List<TreeNodeView> newTreeNodeViewlist = [];

    final List<TreeNodeView> treeNodeViewlist = explorerView.treeNodeViewList;
    for (int i = 0; i < treeNodeViewlist.length; i++) {
      final TreeNodeView tmpNodeView = treeNodeViewlist[i];
      if (tmpNodeView.id == nodeView.id) {
        // 选中
        newTreeNodeViewlist.add(nodeView.copyWith(isSelected: true));
      } else {
        // 其它反选
        newTreeNodeViewlist.add(tmpNodeView.copyWith(isSelected: false));
      }
    }

    final ExplorerView newView =
        explorerView.copyWith(treeNodeViewList: newTreeNodeViewlist);

    return ExplorerDoneState(view: newView);
  }
}
