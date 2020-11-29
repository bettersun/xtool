import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

import '../service/proxy_service.dart';
import '../view_model/vm.dart';
import 'bloc.dart';

/// 代理Bloc
class ProxyBloc extends Bloc<ProxyEvent, ProxyState> {
  KiwiContainer container = KiwiContainer();

  ProxyBloc() : super(ProxyInitState());

  @override
  Stream<ProxyState> mapEventToState(
    ProxyEvent event,
  ) async* {
    final ProxyService service = container<ProxyService>();

    // 初始化
    if (event is ProxyInitEvent) {
      final ProxyInfoView view = await service.init();
      yield ProxyDoneState(view: view);
    }

    if (event is ProxyRunEvent) {
      final ProxyInfoView view = await service.run();
      yield ProxyDoneState(view: view);
    }

    if (event is ProxyReloadEvent) {
      final ProxyInfoView view = await service.reload();
      yield ProxyDoneState(view: view);
    }
  }
}
