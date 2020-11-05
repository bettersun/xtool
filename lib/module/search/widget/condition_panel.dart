import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtool/common/const/const.dart';

import '../bloc/bloc.dart';
import '../const/const.dart';
import '../view_model/vm.dart';

/// 搜索条件面板
class ConditionPanel extends StatefulWidget {
  /// 搜索选项View
  final SearchOptionView optionView;

  const ConditionPanel({this.optionView});

  @override
  _ConditionPanelState createState() {
    return _ConditionPanelState();
  }
}

class _ConditionPanelState extends State<ConditionPanel> {
  /// 搜索Bloc
  SearchBloc _searchBloc;

  // 目录
  TextEditingController _rootPathCtrlr;
  // 关键字
  TextEditingController _fileNamePartCtrlr;
  // 文件类型
  TextEditingController _fileTypeCtrlr;
  // 忽略目录
  TextEditingController _ignorePathCtrlr;
  // 忽略关键字
  TextEditingController _ignoreFileNamePartCtrlr;
  // 忽略类型
  TextEditingController _ignoreTypeCtrlr;

  @override
  void initState() {
    super.initState();

    _searchBloc = BlocProvider.of<SearchBloc>(context);
    // 目录
    _rootPathCtrlr = TextEditingController();
    _rootPathCtrlr.text = widget.optionView.rootPaths;
    // 关键字
    _fileNamePartCtrlr = TextEditingController();
    _fileNamePartCtrlr.text = widget.optionView.fileNameParts;
    // 文件类型
    _fileTypeCtrlr = TextEditingController();
    _fileTypeCtrlr.text = widget.optionView.fileTypes;
    // 忽略目录
    _ignorePathCtrlr = TextEditingController();
    _ignorePathCtrlr.text = widget.optionView.ignorePaths;
    // 忽略关键字
    _ignoreFileNamePartCtrlr = TextEditingController();
    _ignoreFileNamePartCtrlr.text = widget.optionView.ignoreFileNameParts;
    // 忽略类型
    _ignoreTypeCtrlr = TextEditingController();
    _ignoreTypeCtrlr.text = widget.optionView.ignoreTypes;
  }

  @override
  Widget build(BuildContext context) {
    // 输入框宽度
    const double inputWidth = 500;

    return Container(
      color: Colors.cyan,
      padding: EdgeInsets.all(ThemeConst.sideWidth),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 目录
            Row(
              children: [
                Row(
                  children: [
                    label('目录'),
                    SizedBox(
                      width: inputWidth,
                      child: TextField(
                        controller: _rootPathCtrlr,
                        onChanged: (value) {
                          if (value != widget.optionView.rootPaths) {
                            _searchBloc.add(SearchChangeValueEvent(
                                itemKey: SearchConst.keyRootPath,
                                newVal: value));
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
                    label('关键字'),
                    SizedBox(
                      width: inputWidth,
                      child: TextField(
                        controller: _fileNamePartCtrlr,
                        onChanged: (value) {
                          if (value != widget.optionView.rootPaths) {
                            _searchBloc.add(SearchChangeValueEvent(
                                itemKey: SearchConst.keyFileNamePart,
                                newVal: value));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // 文件类型
            Row(
              children: [
                Row(
                  children: [
                    label('文件类型'),
                    SizedBox(
                      width: inputWidth,
                      child: TextField(
                        controller: _fileTypeCtrlr,
                        onChanged: (value) {
                          if (value != widget.optionView.fileTypes) {
                            _searchBloc.add(SearchChangeValueEvent(
                                itemKey: SearchConst.keyFileType,
                                newVal: value));
                          }
                        },
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  onPressed: () {},
                ),
                // 搜索模式
                Row(
                  children: [
                    Text('搜索模式'),
                    DropdownButton<String>(
                      value: widget.optionView.pattern,
                      onChanged: (value) {
                        if (value != widget.optionView.pattern) {
                          _searchBloc.add(SearchChangeValueEvent(
                              itemKey: SearchConst.keyPattern, newVal: value));
                        }
                      },
                      items: <String>['', '1', '2', '3', '4']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                // 搜索子目录
                Row(
                  children: [
                    Checkbox(
                      value: widget.optionView.searchSubPath,
                      onChanged: (value) {
                        _searchBloc.add(SearchChangeValueEvent(
                            itemKey: SearchConst.keySearchSubPath,
                            newVal: value));
                      },
                    ),
                    Text('搜索子目录'),
                  ],
                ),
                // 区分大小写
                Row(
                  children: [
                    Checkbox(
                      value: widget.optionView.matchCase,
                      onChanged: (value) {
                        _searchBloc.add(SearchChangeValueEvent(
                            itemKey: SearchConst.keyMatchCase, newVal: value));
                      },
                    ),
                    Text('区分大小写'),
                  ],
                ),
                // 忽略选项
                Row(
                  children: [
                    Checkbox(
                      value: widget.optionView.showIgnore,
                      onChanged: (value) {
                        _searchBloc.add(SearchChangeValueEvent(
                            itemKey: SearchConst.keyShowIgnore, newVal: value));
                      },
                    ),
                    Text('忽略选项'),
                  ],
                ),
              ],
            ),
            // 忽略目录
            Row(
              children: [
                Row(
                  children: [
                    label('忽略目录'),
                    SizedBox(
                      width: inputWidth,
                      child: TextField(
                        controller: _ignorePathCtrlr,
                        onChanged: (value) {
                          if (value != widget.optionView.ignorePaths) {
                            _searchBloc.add(SearchChangeValueEvent(
                                itemKey: SearchConst.keyIgnorePath,
                                newVal: value));
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 24,
                ),
                // 忽略关键字
                Row(
                  children: [
                    label('忽略关键字'),
                    SizedBox(
                      width: inputWidth,
                      child: TextField(
                        controller: _ignoreFileNamePartCtrlr,
                        onChanged: (value) {
                          if (value != widget.optionView.ignoreFileNameParts) {
                            _searchBloc.add(SearchChangeValueEvent(
                                itemKey: SearchConst.keyIgnoreFileNamePart,
                                newVal: value));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // 忽略类型
            Visibility(
              visible: true,
              child: Row(
                children: [
                  Row(
                    children: [
                      label('忽略类型'),
                      SizedBox(
                        width: inputWidth,
                        child: TextField(
                          controller: _ignoreTypeCtrlr,
                          onChanged: (value) {
                            if (value != widget.optionView.ignoreTypes) {
                              _searchBloc.add(SearchChangeValueEvent(
                                  itemKey: SearchConst.keyIgnoreType,
                                  newVal: value));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_down),
                    onPressed: () {},
                  ),
                  // 忽略模式
                  Row(
                    children: [
                      Text('忽略模式'),
                      DropdownButton<String>(
                        value: widget.optionView.ignorePattern,
                        onChanged: (value) {
                          if (value != widget.optionView.ignorePattern) {
                            _searchBloc.add(SearchChangeValueEvent(
                                itemKey: SearchConst.keyIgnorePattern,
                                newVal: value));
                          }
                        },
                        items: <String>['', '1', '2', '3', '4']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      Container(
                        width: 200,
                      ),
                      RaisedButton(
                        child: Text('Search'),
                        onPressed: () async {
                          _searchBloc.add(
                              SearchSearchEvent(optionView: widget.optionView));
                        },
                      ),
                    ],
                  ),
                ],
              ),
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
