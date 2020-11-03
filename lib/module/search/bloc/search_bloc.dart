import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

import '../service/search_service.dart';
import '../view_model/vm.dart';
import 'bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  KiwiContainer container = KiwiContainer();

  SearchBloc() : super(SearchInitState());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    final SearchService service = container<SearchService>();

    // 初始化
    if (event is SearchInitEvent) {
      final SearchView view = await service.init();
      yield SearchDoneState(view: view);
    }
    // 搜索
    if (event is SearchSearchEvent) {
      final SearchDoneState nowState = state as SearchDoneState;
      final SearchView view = await service.search(nowState.view);
      yield SearchDoneState(view: view);
    }
  }
}
