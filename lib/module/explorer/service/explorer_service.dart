import '../bloc/bloc.dart';
import '../view_model/view_model.dart';

/// 程序Service接口
abstract class ExplorerService {
  /// 初始化
  Future<ExplorerDoneState> load();

  /// 浏览
  Future<ExplorerDoneState> explorer(ExplorerView explorerView);

  /// 展开收起
  Future<ExplorerDoneState> expand(
      ExplorerView explorerView, TreeNodeView nodeView);

  /// 选中反选
  Future<ExplorerDoneState> select(
      ExplorerView explorerView, TreeNodeView nodeView);
}
