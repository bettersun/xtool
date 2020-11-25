import 'package:flutter/material.dart';
import 'package:xtool/plugin/go/moist/model/model.dart';

import '../view_model/vm.dart';

/// 搜索结果面板
class ResultPanel extends StatelessWidget {
  /// 搜索结果View
  final ProxyView proxyView;

  const ResultPanel({this.proxyView});

  @override
  Widget build(BuildContext context) {
    Widget result = Container();

    // 详细信息
    result = SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            child: buildDataTable(proxyView.proxyInfo.proxyUrls),
          ),
        ],
      ),
    );

    return Container(
      color: Colors.blue[100],
      width: double.infinity,
      child: result,
    );
  }

  /// 构建详细信息DataTable
  Widget buildDataTable(List<ProxyUrl> proxyUrls) {
    final List<DataRow> dateRows = [];
    for (int i = 0; i < proxyUrls.length; i++) {
      dateRows.add(DataRow(
        cells: [
          // 文件名
          DataCell(Text((i + 1).toString())),
          // 文件名
          DataCell(Text(proxyUrls[i].url ?? '')),
          // 文件类型
          DataCell(Text(proxyUrls[i].useProxy?.toString())),
          // 文件类型
          DataCell(Text(proxyUrls[i].responseJson ?? '')),
        ],
      ));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          // #
          DataColumn(label: Text('#')),
          // URL
          DataColumn(label: Text('URL')),
          // 使用代理
          DataColumn(label: Text('使用代理')),
          // 响应JSON
          DataColumn(label: Text('响应JSON')),
        ],
        rows: dateRows,
      ),
    );
  }

  /// 构建文件列表
  List<Widget> buildFileList(List<String> file) {
    final List<Widget> fileList = [];

    for (final f in file) {
      fileList.add(Text(f));
    }

    return fileList;
  }
}
