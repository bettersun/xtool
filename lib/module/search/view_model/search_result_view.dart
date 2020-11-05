import 'package:equatable/equatable.dart';
import 'package:xtool/plugin/go/moist/model/model.dart';

/// 搜索结果View
class SearchResultView extends Equatable {
  /// 文件全路径
  final List<String> file;

  /// 文件信息
  final List<FileInfo> fileInfo;

  /// 错误信息
  final List<String> errInfo;

  /// 其它信息
  final List<String> exInfo;

  /// 文件个数
  final int count;

  const SearchResultView({
    this.file = const [],
    this.fileInfo = const [],
    this.errInfo = const [],
    this.exInfo = const [],
    this.count = 0,
  });

  @override
  List<Object> get props => [
        file,
        fileInfo,
        errInfo,
        exInfo,
        count,
      ];

  // Model转为ViewModel
  factory SearchResultView.fromModel(SearchResult model) {
    // 文件数
    final double c = model.count ?? 0.0;
    final int count = c.toInt();

    return SearchResultView(
      file: model.file ?? [],
      fileInfo: model.fileInfo ?? [],
      errInfo: model.errInfo ?? [],
      exInfo: model.exInfo ?? [],
      count: count,
    );
  }
}
