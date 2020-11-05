import 'package:equatable/equatable.dart';
import 'package:xtool/plugin/go/moist/model/model.dart';

/// 搜索选项View
class SearchOptionView extends Equatable {
  // /// 目标目录
  // final List<String> rootPath;

  /// 搜索子目录
  final bool searchSubPath;

  /// 区分大小写
  final bool matchCase;

  // /// 目标文件名关键字
  // final List<String> fileNamePart;

  // /// 目标文件类型
  // final List<String> fileType;

  /// 搜索模式
  final String pattern;

  /// 表示忽略选项
  final bool showIgnore;

  // /// 忽略目录（目录名完全相同，设置此项有助于提高搜索效率，常用忽略目录: .git, .svn）
  // final List<String> ignorePath;

  // /// 忽略文件名关键字
  // final List<String> ignoreFileNamePart;

  // /// 忽略文件类型
  // final List<String> ignoreType;

  /// 忽略模式
  final String ignorePattern;

  /// 是否显示文件详细信息标志
  final bool showDetail;

  /// 目标目录(画面项目)
  final String rootPaths;

  /// 目标文件名关键字(画面项目)
  final String fileNameParts;

  /// 目标文件类型(画面项目)
  final String fileTypes;

  /// 忽略目录(画面项目)
  final String ignorePaths;

  /// 忽略文件名关键字(画面项目)
  final String ignoreFileNameParts;

  /// 忽略文件类型(画面项目)
  final String ignoreTypes;

  const SearchOptionView({
    // this.rootPath = const [],
    this.searchSubPath = false,
    this.matchCase = false,
    // this.fileNamePart = const [],
    // this.fileType = const [],
    this.pattern = '',
    this.showIgnore = false,
    // this.ignorePath = const [],
    // this.ignoreFileNamePart = const [],
    // this.ignoreType = const [],
    this.ignorePattern = '',
    this.showDetail = false,
    this.rootPaths = '',
    this.fileNameParts = '',
    this.fileTypes = '',
    this.ignorePaths = '',
    this.ignoreFileNameParts = '',
    this.ignoreTypes = '',
  });

  @override
  List<Object> get props => [
        // rootPath,
        searchSubPath,
        matchCase,
        // fileNamePart,
        // fileType,
        pattern,
        showIgnore,
        // ignorePath,
        // ignoreFileNamePart,
        // ignoreType,
        ignorePattern,
        showDetail,
        rootPaths,
        fileNameParts,
        fileTypes,
        ignorePaths,
        ignoreFileNameParts,
        ignoreTypes,
      ];

  SearchOptionView copyWith({
    // List<String> rootPath,
    bool searchSubPath,
    bool matchCase,
    // List<String> fileNamePart,
    // List<String> fileType,
    String pattern,
    bool showIgnore,
    // List<String> ignorePath,
    // List<String> ignoreFileNamePart,
    // List<String> ignoreType,
    String ignorePattern,
    bool showDetail,
    String rootPaths,
    String fileNameParts,
    String fileTypes,
    String ignorePaths,
    String ignoreFileNameParts,
    String ignoreTypes,
  }) {
    return SearchOptionView(
      // rootPath: rootPath ?? this.rootPath,
      searchSubPath: searchSubPath ?? this.searchSubPath,
      matchCase: matchCase ?? this.matchCase,
      // fileNamePart: fileNamePart ?? this.fileNamePart,
      // fileType: fileType ?? this.fileType,
      pattern: pattern ?? this.pattern,
      showIgnore: showIgnore ?? this.showIgnore,
      // ignorePath: ignorePath ?? this.ignorePath,
      // ignoreFileNamePart: ignoreFileNamePart ?? this.ignoreFileNamePart,
      // ignoreType: ignoreType ?? this.ignoreType,
      ignorePattern: ignorePattern ?? this.ignorePattern,
      showDetail: showDetail ?? this.showDetail,
      rootPaths: rootPaths ?? this.rootPaths,
      fileNameParts: fileNameParts ?? this.fileNameParts,
      fileTypes: fileTypes ?? this.fileTypes,
      ignorePaths: ignorePaths ?? this.ignorePaths,
      ignoreFileNameParts: ignoreFileNameParts ?? this.ignoreFileNameParts,
      ignoreTypes: ignoreTypes ?? this.ignoreTypes,
    );
  }

  // Model转为ViewModel
  factory SearchOptionView.fromModel(SearchOption model) {
    String rootPaths = '';
    String fileNameParts = '';
    String fileTypes = '';
    String ignorePaths = '';
    String ignoreFileNameParts = '';
    String ignoreTypes = '';

    // 目标根目录
    if (model.rootPath != null) {
      for (final v in model.rootPath) {
        if (v.isNotEmpty) {
          rootPaths = rootPaths + v + ',';
        }
      }
    }
    // 目标文件名关键字
    if (model.fileNamePart != null) {
      for (final v in model.fileNamePart) {
        if (v.isNotEmpty) {
          fileNameParts = fileNameParts + v + ',';
        }
      }
    }
    // 目标文件类型
    if (model.fileType != null) {
      for (final v in model.fileType) {
        if (v.isNotEmpty) {
          fileTypes = fileTypes + v + ',';
        }
      }
    }
    // 忽略目录
    if (model.ignorePath != null) {
      for (final v in model.ignorePath) {
        if (v.isNotEmpty) {
          ignorePaths = ignorePaths + v + ',';
        }
      }
    }
    // 忽略文件名关键字
    if (model.ignoreFileNamePart != null) {
      for (final v in model.ignoreFileNamePart) {
        if (v.isNotEmpty) {
          ignoreFileNameParts = ignoreFileNameParts + v + ',';
        }
      }
    }
    // 忽略文件类型
    if (model.ignoreType != null) {
      for (final v in model.ignoreType) {
        if (v.isNotEmpty) {
          ignoreTypes = ignoreTypes + v + ',';
        }
      }
    }

    return SearchOptionView(
      // rootPath: model.rootPath ?? [],
      searchSubPath: model.searchSubPath,
      matchCase: model.matchCase,
      // fileNamePart: model.fileNamePart ?? [],
      // fileType: model.fileType ?? [],
      pattern: model.pattern,
      showIgnore: true,
      // ignorePath: model.ignorePath ?? [],
      // ignoreFileNamePart: model.ignoreFileNamePart ?? [],
      // ignoreType: model.ignoreType ?? [],
      ignorePattern: model.ignorePattern,
      rootPaths: rootPaths,
      fileNameParts: fileNameParts,
      fileTypes: fileTypes,
      ignorePaths: ignorePaths,
      ignoreFileNameParts: ignoreFileNameParts,
      ignoreTypes: ignoreTypes,
    );
  }
}
