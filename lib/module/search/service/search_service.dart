import 'package:xtool/module/search/view_model/search_view.dart';

/// 程序Service接口
abstract class SearchService {
  /// 初始化
  Future<SearchView> init();

  /// 搜索
  Future<SearchView> search(SearchView searchView);
}
