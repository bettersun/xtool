import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:xtool/common/const/const.dart';
import 'package:xtool/module/explorer/explorer_page.dart';
import 'package:xtool/module/proxy/proxy_page.dart';
import 'package:xtool/module/search/search_page.dart';

import '../bloc/bloc.dart';
import '../view_model/vm.dart';

/// 程序动作
class AppAction extends StatefulWidget {
  /// 程序View
  final AppView appView;

  const AppAction(this.appView);

  @override
  State<StatefulWidget> createState() {
    return _AppActionState();
  }
}

/// 程序动作State
class _AppActionState extends State<AppAction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ThemeConst.heightInfoBar + ThemeConst.len1),
      child: GridView.extent(
        shrinkWrap: true, // 必需
        physics: AlwaysScrollableScrollPhysics(), // 可滚动
        maxCrossAxisExtent: 200,
        childAspectRatio: 5.0,
        mainAxisSpacing: ThemeConst.len2,
        crossAxisSpacing: ThemeConst.len2,
        children: actionList(),
      ),
      // ),
    );
  }

  /// 构建动作列表
  List<Widget> actionList() {
    final actions = widget.appView.actions ?? [];
    return actions.map((item) => buildAction(item)).toList();
  }

  /// 构建动作
  Widget buildAction(ActionInfo item) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          item.name,
        ),
        color: Colors.blue[200],
      ),
      onTap: () async {
        if (item.id == 1) {
          // 保存主题
          context.bloc<AppBloc>().add(AppEvent.saveSettings);
        }
        if (item.id == 2) {
          // 获取主题
          context.bloc<AppBloc>().add(AppEvent.getSettings);
        }
        if (item.id == 3) {
          // 浏览(插件)
          context.bloc<AppBloc>().add(AppEvent.explorer);
        }
        if (item.id == 4) {
          // 浏览画面
          await Navigator.of(context).push<dynamic>(
            MaterialPageRoute<dynamic>(builder: (_) {
              return ExplorerPage();
            }),
          );
        }
        if (item.id == 5) {
          // 搜索(插件)
          context.bloc<AppBloc>().add(AppEvent.search);
        }

        if (item.id == 6) {
          // 搜索画面
          await Navigator.of(context).push<dynamic>(
            MaterialPageRoute<dynamic>(builder: (_) {
              return SearchPage();
            }),
          );
        }
        if (item.id == 7) {
          // 代理画面
          await Navigator.of(context).push<dynamic>(
            MaterialPageRoute<dynamic>(builder: (_) {
              return ProxyPage();
            }),
          );
        }
      },
    );
  }
}
