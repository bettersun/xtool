import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

import '../service/explorer_service.dart';
import 'bloc.dart';

class ExplorerBloc extends Bloc<ExplorerEvent, ExplorerState> {
  KiwiContainer container = KiwiContainer();

  ExplorerBloc() : super(ExplorerInitState());

  @override
  Stream<ExplorerState> mapEventToState(
    ExplorerEvent event,
  ) async* {
    final ExplorerService service = container<ExplorerService>();

    // 初始化
    if (event is ExplorerInitEvent) {
      final ExplorerDoneState resultState = await service.init();
      yield resultState;
    }
    // 浏览
    if (event is ExplorerExplorerEvent) {
      final ExplorerDoneState nowState = state as ExplorerDoneState;
      final ExplorerDoneState resultState =
          await service.explorer(nowState.view);
      yield resultState;
    }
    // 展开折叠
    if (event is ExplorerExpandEvent) {
      final ExplorerDoneState nowState = state as ExplorerDoneState;
      final ExplorerDoneState resultState =
          await service.expand(nowState.view, event.nodeView);
      yield resultState;
    }
    // 选中反选
    if (event is ExplorerSelectEvent) {
      final ExplorerDoneState nowState = state as ExplorerDoneState;
      final ExplorerDoneState resultState =
          await service.select(nowState.view, event.nodeView);
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
