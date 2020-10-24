import 'package:equatable/equatable.dart';

/// 程序View
class AppView extends Equatable {
  /// 标题
  final String title;

  /// 作者
  final String author;

  /// 消息
  final String info;

  const AppView({
    this.title = '',
    this.author = '',
    this.info = '',
  });

  @override
  List<Object> get props => [title, author, info];

  AppView copyWith({String title, String author, String info}) {
    return AppView(
      title: title ?? this.title,
      author: author ?? this.author,
      info: info ?? this.info,
    );
  }
}
