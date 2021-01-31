import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtool/common/const/const.dart';
import 'package:xtool/framework/framework.dart';

import 'bloc/bloc.dart';
import 'util/util.dart';
import 'view_model/vm.dart';

class ExplorerPage extends StatefulWidget {
  @override
  _ExplorerPageState createState() {
    return _ExplorerPageState();
  }
}

class _ExplorerPageState extends State<ExplorerPage> {
  final ExplorerBloc _explorerBloc = ExplorerBloc();

  @override
  void initState() {
    super.initState();

    // 浏览画面
    _explorerBloc.add(ExplorerInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => _explorerBloc,
        // 执行子组件的初始加载方法
        child:
            BlocBuilder<ExplorerBloc, ExplorerState>(builder: (context, state) {
          // FAB
          final fabs = Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // 浏览
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                    heroTag: 'b1',
                    child: const Icon(Icons.explore),
                    onPressed: () =>
                        context.bloc<ExplorerBloc>().add(ExplorerInitEvent())),
              ),
              // 返回
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  heroTag: 'b2',
                  child: const Icon(Icons.assignment_return),
                  onPressed: () async {
                    Navigator.maybePop(context);
                  },
                ),
              ),
            ],
          );

          // 加载完成后，渲染
          if (state is ExplorerDoneState) {
            return Scaffold(
              body: Container(
                padding: EdgeInsets.all(ThemeConst.sideWidth),
                color: Colors.cyan,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.lightBlueAccent,
                        child: ListView.builder(
                          itemCount: state.view.treeNodeViewList?.length,
                          itemBuilder: (context, i) {
                            if (state.view.treeNodeViewList != null &&
                                state.view.treeNodeViewList.isNotEmpty) {
                              print(i);
                              // 单节点View
                              final TreeNodeView nodeView =
                                  state.view.treeNodeViewList[i];
                              print(nodeView.name);
                              print(nodeView.visible);
                              // 当前节点不可见或者祖先不可见
                              if (!nodeView.visible ||
                                  !nodeView.ancestorVisible) {
                                return Container();
                              }

                              // 缩进 左边距 * 节点深度
                              final Container indent = Container(
                                  padding: EdgeInsets.only(
                                      left: ThemeConst.paddingNodeLeft *
                                          nodeView.deepth));
                              // 图标: 展开折叠
                              final Widget iconExpanded =
                                  ExplorerUtil.expandIconType(nodeView);
                              // 图标: 目录（文件夹）
                              final Icon iconType =
                                  ExplorerUtil.iconType(nodeView);
                              // 选中状态的背景色
                              final Color colorSelected = nodeView.isSelected
                                  ? Colors.blueGrey
                                  : Colors.transparent;

                              return Container(
                                height: 24,
                                margin: EdgeInsets.only(top: 1.0, bottom: 1.0),
                                child: Row(
                                  children: [
                                    indent,
                                    // 展开折叠
                                    InkWell(
                                        child: iconExpanded,
                                        onTap: () => {
                                              context.bloc<ExplorerBloc>().add(
                                                  ExplorerExpandEvent(
                                                      nodeView: nodeView))
                                            }),
                                    // 选中反选
                                    InkWell(
                                        child: Container(
                                          color: colorSelected,
                                          child: Row(children: [
                                            iconType,
                                            Container(
                                              // color: Colors.colorSelected,
                                              child: Text(
                                                nodeView.name,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ]),
                                        ),
                                        onTap: () => {
                                              context.bloc<ExplorerBloc>().add(
                                                  ExplorerSelectEvent(
                                                      nodeView: nodeView))
                                            }),
                                  ],
                                ),
                              );
                            }

                            return Container();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        padding: EdgeInsets.all(8.0),
                        color: Colors.tealAccent,
                        child: Expanded(child: Text('Content Test')),
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButton: fabs,
            );
          }

          return BlankScaffold();
        }));
  }
}
