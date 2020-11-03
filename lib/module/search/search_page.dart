import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/const/const.dart';

import 'bloc/bloc.dart';
import 'widget/widget.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  final SearchBloc _searchBloc = SearchBloc();

  @override
  void initState() {
    super.initState();

    // 浏览画面
    _searchBloc.add(SearchInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _searchBloc,
      child: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
        // 构建组件
        return Scaffold(
          body: Container(
            padding: EdgeInsets.all(ThemeConst.sideWidth),
            color: Theme.of(context).bannerTheme.backgroundColor,
            child: Column(
              children: [
                Container(
                  color: Colors.cyan,
                  height: 300,
                  // width: double.infinity,
                  child: ConditionPanel(),
                ),
                Container(
                  color: Colors.amber,
                  height: 20,
                  // width: double.infinity,
                  child: Text('搜索Tab'),
                ),
                Expanded(
                  child: Container(
                    color: Theme.of(context).cardTheme.color,
                    height: 300,
                    // width: double.infinity,
                    child: Text('搜索结果'),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
