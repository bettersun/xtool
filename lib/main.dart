import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'app_bloc_observer.dart';
import 'kiwi.dart';

void main() {
  Bloc.observer = AppBlocObserver();

  // 注入依赖
  Kiwi.injectDependency();

  runApp(App());
}
