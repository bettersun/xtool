import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtool/common/const/const.dart';

import '../bloc/bloc.dart';
import '../view_model/vm.dart';

/// 操作面板
class OperatePanel extends StatelessWidget {
  /// 代理View
  final ProxyInfoView proxyInfoView;

  const OperatePanel({this.proxyInfoView});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue[50],
      height: 30,
      padding: EdgeInsets.all(ThemeConst.sideWidth),
      child: Row(
        // 用于左右两端表示组件
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // 启动服务
              FlatButton(
                color: Colors.blue[300],
                child: Text('启动服务'),
                onPressed: () {
                  BlocProvider.of<ProxyBloc>(context).add(ProxyRunEvent());
                },
              ),
              Container(
                width: 4,
              ),
              // 重新加载代理信息
              FlatButton(
                color: Colors.blue[300],
                child: Text('重新加载代理信息'),
                onPressed: () {
                  BlocProvider.of<ProxyBloc>(context).add(ProxyReloadEvent());
                },
              ),
              Container(
                width: 4,
              ),
              // 关闭服务
              FlatButton(
                color: Colors.blue[300],
                child: Text('关闭服务'),
                onPressed: () {
                  BlocProvider.of<ProxyBloc>(context).add(ProxyCloseEvent());
                },
              ),
            ],
          ),
          // 文件数
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 4.0),
                child: Text('运行信息'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
