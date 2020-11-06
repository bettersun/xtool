import 'package:flutter/material.dart';

import 'package:xtool/common/const/const.dart';

/// App信息Bar
class AppInfoBar extends StatelessWidget {
  /// 信息
  final String info;

  const AppInfoBar(this.info);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: ThemeConst.heightInfoBar,
      color: Colors.blue[100],
      padding: EdgeInsets.all(ThemeConst.len1),
      child: Text(info),
    );
  }
}
