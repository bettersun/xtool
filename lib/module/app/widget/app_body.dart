import 'package:flutter/material.dart';

import 'package:xtool/common/const/const.dart';

import '../view_model/vm.dart';
import 'widget.dart';

/// 程序主页面
class AppBody extends StatefulWidget {
  /// 程序View
  final AppView appView;

  const AppBody(this.appView);

  @override
  State<StatefulWidget> createState() {
    return _AppBodyState();
  }
}

/// AppBodyState
class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.blue[50],
      padding: EdgeInsets.all(ThemeConst.len1),
      child: Stack(
        children: [
          AppInfoBar(widget.appView.info),
          AppAction(widget.appView),
        ],
      ),
    );
  }
}
