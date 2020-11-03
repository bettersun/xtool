import 'package:xtool/module/search/view_model/search_view.dart';

import 'search_service.dart';

/// 浏览Service实现
class SearchServiceImpl extends SearchService {
  @override
  Future<SearchView> init() async {
    return SearchView();
  }

  @override
  Future<SearchView> search(SearchView searchView) async {
    return SearchView();
  }
}
