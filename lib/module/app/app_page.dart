import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtool/framework/widget/widget.dart';
import 'package:xtool/module/app/widget/widget.dart';

import 'bloc/bloc.dart';
import 'widget/app_widget.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() {
    return _AppPageState();
  }
}

class _AppPageState extends State<AppPage> {
  @override
  void initState() {
    super.initState();
    context.bloc<AppBloc>().add(AppEvent.init);
  }

  @override
  Widget build(BuildContext context) {
    // 标题栏动作
    final acts = AppWidget.instance().appBarAction(context);

    // FAB
    final fabs = AppWidget.instance().appFab(context);

    return BlocBuilder<AppBloc, AppState>(builder: (_, state) {
      // 加载完成后，渲染
      if (state is AppDoneState) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state.view.title,
              textAlign: TextAlign.left,
            ),
            centerTitle: false,
            leading: IconButton(
              icon: Icon(Icons.computer),
              onPressed: () {},
            ),
            actions: acts,
          ),
          body: AppBody(state.view),
          floatingActionButton: fabs,
        );
      }

      return BlankScaffold();
    });
  }
}
