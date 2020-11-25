/// 代理Event
abstract class ProxyEvent {}

/// 初始化Event
class ProxyInitEvent extends ProxyEvent {}

/// 改变值Event
class ProxyChangeValueEvent extends ProxyEvent {
  // 项目Key
  final String itemKey;
  // 项目的最新值
  final dynamic newVal;

  ProxyChangeValueEvent({this.itemKey, this.newVal});

  @override
  String toString() => 'ProxyChangeValueEvent';
}

/// 运行服务Event
class ProxyRunEvent extends ProxyEvent {
  ProxyRunEvent();

  @override
  String toString() => 'ProxyRunEvent';
}

/// 重新加载运行时代理信息Event
class ProxyReloadEvent extends ProxyEvent {
  ProxyReloadEvent();

  @override
  String toString() => 'ProxyReloadEvent';
}

/// 关闭服务Event
class ProxyCloseEvent extends ProxyEvent {
  ProxyCloseEvent();

  @override
  String toString() => 'ProxyCloseEvent';
}
