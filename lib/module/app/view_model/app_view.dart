import 'package:equatable/equatable.dart';

/// 程序View
class AppView extends Equatable {
  /// 标题
  final String title;

  /// 作者
  final String author;

  /// 消息
  final String info;

  /// 程序动作
  final List<ActionInfo> actions;

  const AppView({
    this.title = '',
    this.author = '',
    this.info = '',
    this.actions = const [],
  });

  @override
  List<Object> get props => [title, author, info, actions];

  AppView copyWith(
      {String title, String author, String info, List<ActionInfo> actions}) {
    return AppView(
      title: title ?? this.title,
      author: author ?? this.author,
      info: info ?? this.info,
      actions: actions ?? this.actions,
    );
  }
}

/// 动作信息
class ActionInfo {
  /// 动作ID
  final int id;

  /// 动作名
  final String name;

  const ActionInfo({this.id, this.name});
}
