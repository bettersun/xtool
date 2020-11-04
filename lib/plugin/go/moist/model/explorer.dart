/// 浏览选项
class ExplorerOption {
  /// 根路径
  List<String> rootPath;

  /// 是否包括子目录
  bool includeSubPath;

  /// 忽略的目录
  List<String> ignorePath;

  /// 忽略的文件
  List<String> ignoreFile;

  ExplorerOption(
      {this.rootPath, this.includeSubPath, this.ignorePath, this.ignoreFile});

  ExplorerOption.fromJson(Map<dynamic, dynamic> json) {
    rootPath = (json['rootPath'] as List)
        ?.map((dynamic e) => e == null ? null : e as String)
        ?.toList();
    includeSubPath = json['includeSubPath'] as bool;
    ignorePath = (json['ignorePath'] as List)
        ?.map((dynamic e) => e == null ? null : e as String)
        ?.toList();
    ignoreFile = (json['ignoreFile'] as List)
        ?.map((dynamic e) => e == null ? null : e as String)
        ?.toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rootPath'] = rootPath;
    data['includeSubPath'] = includeSubPath;
    data['ignorePath'] = ignorePath;
    data['ignoreFile'] = ignoreFile;
    return data;
  }
}

/// 树节点
class TreeNode {
  String key;
  // 名称
  String name;
  // 完整路径
  String path;
  // 子节点
  List<TreeNode> children;
  bool isDir;

  TreeNode({
    this.key,
    this.name,
    this.path,
    this.children,
    this.isDir,
  });

  TreeNode.fromJson(Map<dynamic, dynamic> json) {
    key = json['key'] as String;
    name = json['name'] as String;
    path = json['path'] as String;
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        children.add(TreeNode.fromJson(v as Map<dynamic, dynamic>));
      });
    }

    isDir = json['isDir'] as bool;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['key'] = key;
    data['name'] = name;
    data['path'] = path;
    if (children != null) {
      data['children'] = children.map((v) => v.toJson()).toList();
    }
    data['isDir'] = isDir;
    return data;
  }

  TreeNode copyWith({
    String key,
    String name,
    String path,
    List<TreeNode> children,
    bool isDir,
  }) {
    return TreeNode(
      key: key ?? this.key,
      name: name ?? this.name,
      children: children ?? this.children,
      path: path ?? this.path,
      isDir: isDir ?? this.isDir,
    );
  }
}
