import 'dart:async';

import 'package:flutter/services.dart';

import 'model/model.dart';

/// moist插件
class MoistPlugin {
  // go-flutter插件中的包名，两者必须一致
  static const _channel = MethodChannel('bettersun.go-flutter.plugin.moist');

  // go-flutter插件中的函数名，有参
  static Future<TreeNode> explorer(ExplorerOption option) async {
    final Map m = await _channel.invokeMethod('explorer', option.toJson());

    final TreeNode tree = TreeNode.fromJson(m);
    // print(m);
    return tree;
  }

  // 搜索
  static Future<SearchResult> search(SearchOption option) async {
    final Map m = await _channel.invokeMethod('search', option.toJson());

    final SearchResult result = SearchResult.fromJson(m);
    // print(m);
    return result;
  }
}
