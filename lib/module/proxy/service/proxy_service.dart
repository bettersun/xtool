import '../view_model/vm.dart';

/// 代理Service接口
abstract class ProxyService {
  /// 初始化
  Future<ProxyInfoView> init();

  /// 运行服务
  Future<ProxyInfoView> run();

  /// 重新加载运行时代理信息
  Future<ProxyInfoView> reload();

  /// 关闭服务
  Future<ProxyInfoView> close();
}
