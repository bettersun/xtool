/// 搜索模式(忽略模式)
class SearchConst {
//   0 ： 默认
//   1 ： 包含
//   2 ： 相等
//   3 ： 以开头
//   4 ： 以结尾
//   5 ： 正则表达式
  static const PatternDefault = '0';
  static const PatternInclude = '1';
  static const PatternEqual = '2';
  static const PatternPrefix = '3';
  static const PatternSuffix = '4';
  static const PatternRegexp = '5';
}

class SearchOption {
  List<String> rootPath;
  bool searchSubPath;
  bool matchCase;
  List<String> fileNamePart;
  List<String> fileType;
  String pattern;

  List<String> ignorePath;
  List<String> ignoreFileNamePart;
  List<String> ignoreType;
  String ignorePattern;
  // bool showDetail;

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
  // 附加信息
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
  // 最终修改时间
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
