import 'package:flutter/material.dart';
import 'package:xtool/plugin/go/moist/model/model.dart';

import '../const/const.dart';
import '../view_model/vm.dart';

/// 搜索结果面板
class ResultPanel extends StatelessWidget {
  /// 搜索结果View
  final SearchResultView resultView;

  /// 结果表示标志
  final String resultFlag;

  const ResultPanel({this.resultView, this.resultFlag});

  @override
  Widget build(BuildContext context) {
    Widget result = Container();

    // 文件列表
    if (resultFlag == SearchConst.resultFileOnly) {
      result = ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(5.0),
        children: buildFileList(resultView.file),
      );
    }

    // 详细信息
    if (resultFlag == SearchConst.resultDetail) {
      result = SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: buildDataTable(resultView.fileInfo),
            ),
          ],
        ),
      );
    }

    return Container(
      color: Colors.grey,
      width: double.infinity,
      child: result,
    );
  }

  /// 构建详细信息DataTable
  Widget buildDataTable(List<FileInfo> fileInfo) {
    final List<DataRow> dateRows = [];
    for (int i = 0; i < fileInfo.length; i++) {
      dateRows.add(DataRow(
        cells: [
          // 文件名
          DataCell(Text(fileInfo[i].fileName ?? '')),
          // 文件类型
          DataCell(Text(fileInfo[i].fileType ?? '')),
          // 文件大小
          DataCell(Text(
              fileInfo[i].size == null ? '' : fileInfo[i].size.toString())),
          // 最新时间
          DataCell(Text(fileInfo[i].modTime ?? '')),
        ],
      ));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          // 文件名
          DataColumn(label: Text('文件名')),
          // 文件类型
          DataColumn(label: Text('类型')),
          // 文件大小
          DataColumn(label: Text('大小')),
          // 最新时间
          DataColumn(label: Text('更新时间')),
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
