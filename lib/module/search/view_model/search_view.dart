import 'package:equatable/equatable.dart';

import '../const/const.dart';

import 'vm.dart';

/// 搜索View
class SearchView extends Equatable {
  /// 搜索选项View
  final SearchOptionView optionView;

  /// 搜索结果View
  final SearchResultView resultView;

  /// 结果表示标志
  final String resultFlag;

  const SearchView({
    this.optionView,
    this.resultView,
    this.resultFlag = SearchConst.resultFileOnly,
  });

  @override
  List<Object> get props => [
        optionView,
        resultView,
        resultFlag,
      ];

  SearchView copyWith({
    SearchOptionView optionView,
    SearchResultView resultView,
    String resultFlag,
  }) {
    return SearchView(
      optionView: optionView ?? this.optionView,
      resultView: resultView ?? this.resultView,
      resultFlag: resultFlag ?? this.resultFlag,
    );
  }
}
