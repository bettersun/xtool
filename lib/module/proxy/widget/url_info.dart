import 'package:flutter/material.dart';
import 'package:xtool/common/const/const.dart';
import 'package:xtool/module/proxy/view_model/vm.dart';

class UrlInfo extends StatelessWidget {
  /// 下标
  final int index;

  /// 代理URL
  final ProxyUrlView proxyUrlView;

  const UrlInfo({this.index, this.proxyUrlView});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ThemeConst.sideWidth),
      child: Container(
        padding: EdgeInsets.all(ThemeConst.sideWidth),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        color: Colors.blue[100],
                        padding: EdgeInsets.only(left: ThemeConst.sideWidth, right: ThemeConst.sideWidth),
                        child: Text('#' + index.toString()),
                      ),
                      Container(
//                        color: Colors.green[100],
                        child: Text(proxyUrlView.url),
                      )
                    ],
                  ),
                ),
                Container(
//                  color: Colors.green[200],
                  height: 20,
                  child: Row(
                    children: [
                      Text('使用代理'),
                      Switch(
                        value: true,
                        onChanged: (value) {
                          //
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
//                    color: Colors.green[300],
                    child: Text(proxyUrlView.responseJson),
                  ),
                ),
                Container(
//                  color: Colors.green[400],
                  child: InkWell(
                    child: Icon(Icons.arrow_right),
                    onTap: () {
                      //
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
