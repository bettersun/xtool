import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtool/common/const/const.dart';

import '../bloc/bloc.dart';
import '../const/const.dart';
import '../view_model/vm.dart';

/// 代理参数面板
class ParamPanel extends StatefulWidget {
  /// 代理View
  final ProxyInfoView proxyInfoView;

  const ParamPanel({this.proxyInfoView});

  @override
  _ParamPanelState createState() {
    return _ParamPanelState();
  }
}

class _ParamPanelState extends State<ParamPanel> {
  /// 搜索Bloc
  ProxyBloc _searchBloc;

  // 目标主机
  TextEditingController _targetHostPathCtrlr;
  // 根URL
  TextEditingController _baseUrlPartCtrlr;

  @override
  void initState() {
    super.initState();

    _searchBloc = BlocProvider.of<ProxyBloc>(context);
    // 目录
    _targetHostPathCtrlr = TextEditingController();
    _targetHostPathCtrlr.text = widget.proxyInfoView.targetHost;
    // 关键字
    _baseUrlPartCtrlr = TextEditingController();
    _baseUrlPartCtrlr.text = widget.proxyInfoView.baseUrl;
  }

  @override
  Widget build(BuildContext context) {
    // 输入框宽度
    const double inputWidth = 500;

    return Container(
      color: Colors.blue[200],
//      margin: EdgeInsets.all(ThemeConst.sideWidth),
      padding: EdgeInsets.all(ThemeConst.sideWidth),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(bottom: ThemeConst.sideWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                label('目标主机'),
                SizedBox(
                  width: inputWidth,
                  child: TextField(
                    controller: _targetHostPathCtrlr,
                    onChanged: (value) {
                      if (value != widget.proxyInfoView.targetHost) {
                        _searchBloc.add(ProxyChangeValueEvent(itemKey: ProxyConst.keyTargetHost, newVal: value));
                      }
                    },
                  ),
                ),
              ],
            ),
            Container(
              width: 16,
            ),
            // 关键字
            Row(
              children: [
                label('根URL'),
                SizedBox(
                  width: inputWidth,
                  child: TextField(
                    controller: _baseUrlPartCtrlr,
                    onChanged: (value) {
                      if (value != widget.proxyInfoView.baseUrl) {
                        _searchBloc.add(ProxyChangeValueEvent(itemKey: ProxyConst.keyRootUrl, newVal: value));
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 输入框前标签
Widget label(String labelText) {
  const double labelPadding = 4.0;
  const double labelWidth = 80.0;

  return Container(
    padding: EdgeInsets.only(left: labelPadding, right: labelPadding),
    // color: Theme.of(context).dividerColor,
    width: labelWidth,
    alignment: Alignment.centerRight,
    child: Text(labelText),
  );
}
