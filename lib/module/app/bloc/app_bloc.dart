import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:xtool/plugin/go/plugin.dart';

import '../service/app_service.dart';

import 'bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  KiwiContainer container = KiwiContainer();

  AppBloc() : super(AppInitState());

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    final AppService service = container<AppService>();

    // 初始化
    if (event == AppEvent.init) {
      final AppDoneState resultState = await service.init();
      yield resultState;
    }
    // hello
    if (event == AppEvent.hello) {
      final AppDoneState nowState = state as AppDoneState;
      final AppDoneState resultState = await service.hello(nowState.view);
      yield resultState;
    }
    // message
    if (event == AppEvent.message) {
      final AppDoneState nowState = state as AppDoneState;
      final AppDoneState resultState = await service.message(nowState.view);
      yield resultState;
    }
    // 保存设定
    if (event == AppEvent.saveSettings) {
      final AppDoneState nowState = state as AppDoneState;
      final AppDoneState resultState =
          await service.saveSettings(nowState.view);
      yield resultState;
    }
    // 获取设定
    if (event == AppEvent.getSettings) {
      final AppDoneState nowState = state as AppDoneState;
      final AppDoneState resultState = await service.getSettings(nowState.view);
      yield resultState;
    }
    // 打开文件
    if (event == AppEvent.openFiles) {
      final AppDoneState nowState = state as AppDoneState;
      final AppDoneState resultState = await service.openFiles(nowState.view);
      yield resultState;
    }
    // 浏览
    if (event == AppEvent.explorer) {
      final AppDoneState nowState = state as AppDoneState;
      final AppDoneState resultState = await service.explorer(nowState.view);
      yield resultState;
    }
    // 搜索
    if (event == AppEvent.search) {
      final AppDoneState nowState = state as AppDoneState;
      final AppDoneState resultState = await service.search(nowState.view);
      yield resultState;
    }
    // 刷新
    if (event == AppEvent.refresh) {
      final AppDoneState nowState = state as AppDoneState;
      final AppDoneState resultState = await service.refresh(nowState.view);
      yield resultState;
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    print(stackTrace);

    super.onError(error, stackTrace);
  }
}
