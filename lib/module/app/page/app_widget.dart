import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtool/module/app/bloc/bloc.dart';
import 'package:xtool/module/explorer/page/page.dart';

/// APP相关组件
class AppWidget {
  AppWidget();

  static AppWidget appWidgetUtil;

  static AppWidget instance() {
    return appWidgetUtil ?? AppWidget();
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
        child: const Icon(
          Icons.info,
        ),
      ),
      // message
      InkWell(
        onTap: () {
          context.bloc<AppBloc>().add(AppEvent.message);
        },
        child: const Icon(
          Icons.message,
        ),
      ),
      // 切换主题
      InkWell(
        onTap: () => context.bloc<ThemeCubit>().toggleTheme(),
        child: const Icon(
          Icons.settings,
        ),
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
        // 保存设定
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
              heroTag: 'saveSettings',
              child: const Icon(Icons.input),
              onPressed: () =>
                  context.bloc<AppBloc>().add(AppEvent.saveSettings)),
        ),
        // 获取设定
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
              heroTag: 'getSettings',
              child: const Icon(Icons.all_out),
              onPressed: () =>
                  context.bloc<AppBloc>().add(AppEvent.getSettings)),
        ),
        // 浏览
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
              heroTag: 'explorer',
              child: const Icon(Icons.explore),
              onPressed: () => context.bloc<AppBloc>().add(AppEvent.explorer)),
        ),
        // 浏览(新页面)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            heroTag: 'explorerNew',
            child: const Icon(Icons.folder),
            onPressed: () async {
              await Navigator.of(context).push<dynamic>(
                MaterialPageRoute<dynamic>(builder: (_) {
                  return ExplorerPage();
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}
