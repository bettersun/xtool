import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtool/framework/widget/widget.dart';

import '../../common/const/const.dart';

import 'bloc/bloc.dart';
import 'widget/widget.dart';

/// 代理画面
class ProxyPage extends StatefulWidget {
  @override
  _ProxyPageState createState() {
    return _ProxyPageState();
  }
}

/// 搜索画面State
class _ProxyPageState extends State<ProxyPage> {
  ProxyBloc _proxyBloc;

  @override
  void initState() {
    super.initState();

    _proxyBloc = ProxyBloc();
    // 初始化
    _proxyBloc.add(ProxyInitEvent());
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
      create: (BuildContext context) => _proxyBloc,
      child: BlocBuilder<ProxyBloc, ProxyState>(builder: (context, state) {
        // 加载完成后，渲染
        if (state is ProxyDoneState) {
          // 构建组件
          return Scaffold(
            body: Container(
              padding: EdgeInsets.all(ThemeConst.sideWidth),
              color: Theme.of(context).bannerTheme.backgroundColor,
              child: Column(
                children: [
                  // 搜索选项面板
                  ParamPanel(proxyView: state.view),
                  // Tab面板
                  OperatePanel(proxyView: state.view),
                  // 搜索结果面板
                  Expanded(
                    child: ResultPanel(proxyView: state.view),
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
