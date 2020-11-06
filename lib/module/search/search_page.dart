import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtool/framework/widget/widget.dart';

import '../../common/const/const.dart';

import 'bloc/bloc.dart';
import 'widget/widget.dart';

/// 搜索画面
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() {
    return _SearchPageState();
  }
}

/// 搜索画面State
class _SearchPageState extends State<SearchPage> {
  SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();

    _searchBloc = SearchBloc();
    // 初始化
    _searchBloc.add(SearchInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    // FAB
    final fabs = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
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

    return BlocProvider(
      create: (BuildContext context) => _searchBloc,
      child: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
        // 加载完成后，渲染
        if (state is SearchDoneState) {
          // 构建组件
          return Scaffold(
            body: Container(
              padding: EdgeInsets.all(ThemeConst.sideWidth),
              color: Theme.of(context).bannerTheme.backgroundColor,
              child: Column(
                children: [
                  // 搜索选项面板
                  ConditionPanel(optionView: state.view.optionView),
                  // Tab面板
                  TabPanel(
                    resultView: state.view.resultView,
                    resultFlag: state.view.resultFlag,
                  ),
                  // 搜索结果面板
                  Expanded(
                    child: ResultPanel(
                      resultView: state.view.resultView,
                      resultFlag: state.view.resultFlag,
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: fabs,
          );
        }

        return BlankScaffold();
      }),
    );
  }
}
