/// 搜索模式(忽略模式)
class SearchOptionConst {
  /// 0 ： 默认
  static const PatternDefault = '0';

  /// 1 ： 包含
  static const PatternInclude = '1';

  /// 2 ： 相等
  static const PatternEqual = '2';

  /// 3 ： 以开头
  static const PatternPrefix = '3';

  /// 4 ： 以结尾
  static const PatternSuffix = '4';

  /// 5 ： 正则表达式
  static const PatternRegexp = '5';
}

/// 搜索选项
class SearchOption {
  /// 目标根目录
  List<String> rootPath;

  /// 搜索子目录
  bool searchSubPath;

  /// 区分大小写
  bool matchCase;

  /// 目标文件名关键字
  List<String> fileNamePart;

  /// 目标文件类型
  List<String> fileType;

  /// 搜索模式
  String pattern;

  /// 忽略目录
  List<String> ignorePath;

  /// 忽略文件名关键字
  List<String> ignoreFileNamePart;

  /// 忽略文件类型
  List<String> ignoreType;

  /// 忽略模式
  String ignorePattern;

  /// 是否显示文件详细信息标志
  bool showDetail;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rootPath'] = rootPath;
    data['searchSubPath'] = searchSubPath;
    data['matchCase'] = matchCase;
    data['fileNamePart'] = fileNamePart;
    data['fileType'] = fileType;
    data['pattern'] = pattern;

    data['ignorePath'] = ignorePath;
    data['ignoreFileNamePart'] = ignoreFileNamePart;
    data['ignoreType'] = ignoreType;
    data['ignorePattern'] = ignorePattern;

    data['showDetail'] = showDetail;

    return data;
  }
}

/// 搜索结果
class SearchResult {
  // 文件全路径
  List<String> file;
  // 文件信息
  List<FileInfo> fileInfo;
  // 文件总数
  double count;
  // 错误信息
  List<String> errInfo;
  // 其它信息
  List<String> exInfo;

  SearchResult.fromJson(Map<dynamic, dynamic> json) {
    file = (json['file'] as List)
        ?.map((dynamic e) => e == null ? null : e as String)
        ?.toList();

    if (json['fileInfo'] != null) {
      fileInfo = [];
      json['fileInfo'].forEach((v) {
        fileInfo.add(FileInfo.fromJson(v as Map<dynamic, dynamic>));
      });
    }

    count = json['count'] as double;

    errInfo = (json['errInfo'] as List)
        ?.map((dynamic e) => e == null ? null : e as String)
        ?.toList();

    exInfo = (json['exInfo'] as List)
        ?.map((dynamic e) => e == null ? null : e as String)
        ?.toList();
  }
}

/// 文件信息
class FileInfo {
  // 文件全路径
  String file;
  // 文件名
  String fileName;
  // 文件类型
  String fileType;
  // 文件大小
  double size;
  // 文件模式
  double mode;
  // 更新时间
  String modTime;

  FileInfo.fromJson(Map<dynamic, dynamic> json) {
    file = json['file'] as String;
    fileName = json['fileName'] as String;
    fileType = json['fileType'] as String;
    size = json['size'] as double;
    mode = json['mode'] as double;
    modTime = json['modTime'] as String;
  }
}
