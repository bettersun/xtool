import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:xtool/common/const/const.dart';

import '../bloc/bloc.dart';

/// APP相关组件
class AppWidget {
  AppWidget();

  static AppWidget appWidgetUtil;

  /// 单例模式
  static AppWidget instance() {
    appWidgetUtil ??= AppWidget();
    return appWidgetUtil;
  }

  /// 标题栏的动作
  List<Widget> appBarAction(BuildContext context) {
    // 标题栏动作
    final List<Widget> acts = <Widget>[
      // hello
      InkWell(
        onTap: () {
          context.bloc<AppBloc>().add(AppEvent.hello);
        },
        child: Container(
          padding: EdgeInsets.all(ThemeConst.len1),
          child: const Icon(Icons.info),
        ),
      ),
      // message
      InkWell(
        onTap: () {
          context.bloc<AppBloc>().add(AppEvent.message);
        },
        child: Container(
          padding: EdgeInsets.all(ThemeConst.len1),
          child: const Icon(Icons.message),
        ),
      ),
      // 切换主题
      InkWell(
        onTap: () => context.bloc<ThemeCubit>().toggleTheme(),
        child: Container(
          padding: EdgeInsets.all(ThemeConst.len1),
          child: const Icon(Icons.settings_brightness),
        ),
      ),
      Container(
        width: 40,
      ),
    ];

    return acts;
  }

  /// APP的FAB
  Widget appFab(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        // 刷新
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
              heroTag: 'refresh',
              child: const Icon(Icons.refresh),
              onPressed: () {
                context.bloc<AppBloc>().add(AppEvent.init);
              }),
        ),
      ],
    );
  }
}
