import 'package:xtool/plugin/go/plugin.dart';

import '../bloc/bloc.dart';
import '../const/const.dart';
import '../view_model/vm.dart';

import 'search_service.dart';

/// 搜索Service实现
class SearchServiceImpl extends SearchService {
  /// 初始化
  @override
  Future<SearchView> init() async {
    return SearchView(
        optionView: SearchOptionView(), resultView: SearchResultView());
  }

  /// 搜索
  @override
  Future<SearchView> search(SearchView view) async {
    // 字符串转列表
    // 目录
    final List<String> path = [];
    view.optionView.rootPaths.split(',').forEach((v) {
      path.add(v);
    });

    // 关键字
    final List<String> namePart = [];
    view.optionView.fileNameParts.split(',').forEach((v) {
      namePart.add(v);
    });

    // 文件类型
    final List<String> fileType = [];
    view.optionView.fileTypes.split(',').forEach((v) {
      fileType.add(v);
    });

    // 忽略目录
    final List<String> ignorePath = [];
    view.optionView.ignorePaths.split(',').forEach((v) {
      ignorePath.add(v);
    });

    // 忽略关键字
    final List<String> ignoreFileNamePart = [];
    view.optionView.ignoreFileNameParts.split(',').forEach((v) {
      ignoreFileNamePart.add(v);
    });

    // 忽略类型
    final List<String> ignoreType = [];
    view.optionView.ignoreTypes.split(',').forEach((v) {
      ignoreType.add(v);
    });

    // 搜索选项
    final SearchOption option = SearchOption();
    option.rootPath = path;
    option.searchSubPath = view.optionView.searchSubPath;
    option.matchCase = view.optionView.matchCase;
    option.fileNamePart = namePart;
    option.fileType = fileType;
    option.pattern = view.optionView.pattern;

    option.ignorePath = ignorePath;
    option.ignoreFileNamePart = ignoreFileNamePart;
    option.ignoreType = ignoreType;
    option.ignorePattern = view.optionView.ignorePattern;

    // 默认获取详细信息
    option.showDetail = true;

    // 调用插件方法
    final SearchResult result = await MoistPlugin.search(option);
    // print(result.count);

    // 搜索选项View
    final optionView = SearchOptionView.fromModel(option);
    // 搜索结果View
    final resultView = SearchResultView.fromModel(result);

    final SearchView newView =
        view.copyWith(optionView: optionView, resultView: resultView);
    return newView;
  }

  /// 改变值
  @override
  SearchView changeValue(SearchView view, SearchChangeValueEvent event) {
    SearchOptionView optionView;

    // 目录
    if (event.itemKey == SearchConst.keyRootPath) {
      optionView = view.optionView.copyWith(rootPaths: event.newVal as String);
    }
    // 关键字
    if (event.itemKey == SearchConst.keyFileNamePart) {
      optionView =
          view.optionView.copyWith(fileNameParts: event.newVal as String);
    }
    // 文件类型
    if (event.itemKey == SearchConst.keyFileType) {
      optionView = view.optionView.copyWith(fileTypes: event.newVal as String);
    }
    // 搜索模式
    if (event.itemKey == SearchConst.keyPattern) {
      optionView = view.optionView.copyWith(pattern: event.newVal as String);
    }
    // 搜索子目录
    if (event.itemKey == SearchConst.keySearchSubPath) {
      optionView =
          view.optionView.copyWith(searchSubPath: event.newVal as bool);
    }
    // 区分大小写
    if (event.itemKey == SearchConst.keyMatchCase) {
      optionView = view.optionView.copyWith(matchCase: event.newVal as bool);
    }
    // 忽略选项
    if (event.itemKey == SearchConst.keyShowIgnore) {
      optionView = view.optionView.copyWith(showIgnore: event.newVal as bool);
    }
    // 忽略目录
    if (event.itemKey == SearchConst.keyIgnorePath) {
      optionView =
          view.optionView.copyWith(ignorePaths: event.newVal as String);
    }
    // 忽略关键字
    if (event.itemKey == SearchConst.keyIgnoreFileNamePart) {
      optionView =
          view.optionView.copyWith(ignoreFileNameParts: event.newVal as String);
    }
    // 忽略类型
    if (event.itemKey == SearchConst.keyIgnoreType) {
      optionView =
          view.optionView.copyWith(ignoreTypes: event.newVal as String);
    }
    // 忽略类型
    if (event.itemKey == SearchConst.keyIgnorePattern) {
      optionView =
          view.optionView.copyWith(ignorePattern: event.newVal as String);
    }

    final SearchView newView = view.copyWith(optionView: optionView);
    return newView;
  }

  /// 切换结果
  @override
  SearchView toggleResult(SearchView view, SearchToggleResultEvent event) {
    final SearchView newView = view.copyWith(resultFlag: event.resultFlag);
    return newView;
  }
}
