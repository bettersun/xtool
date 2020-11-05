import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtool/common/const/const.dart';

import '../bloc/bloc.dart';
import '../const/const.dart';
import '../view_model/vm.dart';

/// Tab面板
class TabPanel extends StatelessWidget {
  /// 搜索结果View
  final SearchResultView resultView;

  /// 结果表示标志
  final String resultFlag;

  const TabPanel({this.resultView, this.resultFlag});

  @override
  Widget build(BuildContext context) {
    // 选中按钮颜色
    Color colorFileOnly = Colors.transparent;
    Color colorDetail = Colors.transparent;

    // 文件列表
    if (resultFlag == SearchConst.resultFileOnly) {
      colorFileOnly = Colors.blueGrey;
    }
    // 详细信息
    if (resultFlag == SearchConst.resultDetail) {
      colorDetail = Colors.blueGrey;
    }

    return Container(
      alignment: Alignment.center,
      color: Colors.lightBlueAccent,
      height: 30,
      padding: EdgeInsets.all(ThemeConst.sideWidth),
      child: Row(
        // 用于左右两端表示组件
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // 文件列表
              FlatButton(
                color: colorFileOnly,
                child: Text('文件列表'),
                onPressed: () {
                  BlocProvider.of<SearchBloc>(context).add(
                      SearchToggleResultEvent(
                          resultFlag: SearchConst.resultFileOnly));
                },
              ),
              // 详细信息
              FlatButton(
                color: colorDetail,
                child: Text('详细信息'),
                onPressed: () {
                  BlocProvider.of<SearchBloc>(context).add(
                      SearchToggleResultEvent(
                          resultFlag: SearchConst.resultDetail));
                },
              ),
            ],
          ),
          // 文件数
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 4.0),
                child: Text('文件数: ' + resultView.count.toString()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
