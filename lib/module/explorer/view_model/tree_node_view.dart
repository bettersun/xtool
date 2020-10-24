import 'package:equatable/equatable.dart';

/// 树节点View
class TreeNodeView extends Equatable {
  /// ID
  final String id;

  /// 父ID
  final String fatherId;

  /// Key
  final String key;

  /// 名称(文件名或目录名)
  final String name;

  /// 完整路径
  final String path;

  /// 子目录里的目录或文件
  final List<TreeNodeView> children;

  /// 深度
  final int deepth;

  /// 文件类型
  final String fileType;

  /// 图标
  final String icon;

  /// 目录标志
  final bool isDir;

  /// 展开
  final bool isExpanded;

  /// 选中
  final bool isSelected;

  /// 可见
  final bool visible;

  @override
  List<Object> get props => [
        id,
        fatherId,
        key,
        name,
        path,
        children,
        deepth,
        fileType,
        icon,
        isDir,
        isExpanded,
        isSelected,
        visible,
      ];

  const TreeNodeView({
    this.id = '',
    this.fatherId = '',
    this.key = '',
    this.name = '',
    this.path = '',
    this.children,
    this.deepth = 0,
    this.fileType = '',
    this.icon = '',
    this.isDir = false,
    this.isExpanded = false,
    this.isSelected = false,
    this.visible = false,
  });

  TreeNodeView copyWith({
    String id,
    String fatherId,
    String key,
    String name,
    String path,
    List<TreeNodeView> children,
    int deepth,
    String fileType,
    String icon,
    bool isDir,
    bool isExpanded,
    bool isSelected,
    bool visible,
  }) {
    return TreeNodeView(
      id: id ?? this.id,
      fatherId: fatherId ?? this.fatherId,
      key: key ?? this.key,
      name: name ?? this.name,
      children: children ?? this.children,
      path: path ?? this.path,
      deepth: deepth ?? this.deepth,
      fileType: fileType ?? this.fileType,
      icon: icon ?? this.icon,
      isDir: isDir ?? this.isDir,
      isExpanded: isExpanded ?? this.isExpanded,
      isSelected: isSelected ?? this.isSelected,
      visible: visible ?? this.visible,
    );
  }
}
