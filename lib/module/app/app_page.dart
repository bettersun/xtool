import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    context.bloc<AppBloc>().add(AppEvent.load);
  }

  @override
  Widget build(BuildContext context) {
    // 标题栏动作
    final acts = AppWidget.instance().appBarAction(context);

    // FAB
    final fabs = AppWidget.instance().appFab(context);

    return BlocBuilder<AppBloc, AppState>(builder: (_, state) {
      String title = '';
      String info = '';
      // 加载完成后，渲染
      if (state is AppDoneState) {
        title = state.view.title;
        info = state.view.info;
      }

      return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            textAlign: TextAlign.left,
          ),
          centerTitle: false,
          leading: IconButton(
            icon: Icon(Icons.computer),
            onPressed: () {},
          ),
          actions: acts,
        ),
        body: Center(child: Text(info)),
        floatingActionButton: fabs,
      );
    });
  }
}
