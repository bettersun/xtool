import '../bloc/bloc.dart';
import '../view_model/search_view.dart';

/// 搜索Service接口
abstract class SearchService {
  /// 初始化
  Future<SearchView> init();

  /// 搜索
  Future<SearchView> search(SearchView view);

  /// 改变值
  SearchView changeValue(SearchView view, SearchChangeValueEvent event);

  /// 切换结果
  SearchView toggleResult(SearchView view, SearchToggleResultEvent event);
}
