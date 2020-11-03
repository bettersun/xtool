import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'module/app/app_page.dart';
import 'module/app/bloc/bloc.dart';
import 'module/search/search_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return MaterialApp(
            theme: theme,
            home: BlocProvider(
              // 执行子组件的初始加载方法
              create: (_) => AppBloc(),
              // child: AppPage(),
              child: SearchPage(),
            ),
          );
        },
      ),
    );
  }
}
