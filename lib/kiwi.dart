import 'package:kiwi/kiwi.dart';

import 'module/app/service/app_service.dart';
import 'module/app/service/app_service_impl.dart';
import 'module/explorer/service/explorer_service.dart';
import 'module/explorer/service/explorer_service_impl.dart';
import 'module/search/service/search_service.dart';
import 'module/search/service/search_service_impl.dart';

class Kiwi {
  // 注入依赖
  static void injectDependency() {
    final KiwiContainer container = KiwiContainer();

    // 程序
    container.registerFactory<AppService>((c) => AppServiceImpl());
    // 浏览
    container.registerFactory<ExplorerService>((c) => ExplorerServiceImpl());
    // 搜索
    container.registerFactory<SearchService>((c) => SearchServiceImpl());
  }
}
