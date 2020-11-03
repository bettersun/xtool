import '../bloc/bloc.dart';
import '../view_model/vm.dart';

/// 程序Service接口
abstract class AppService {
  /// 初始化
  Future<AppDoneState> init();

  /// hello
  Future<AppDoneState> hello(AppView appView);

  /// message
  Future<AppDoneState> message(AppView appView);

  /// 保存设定
  Future<AppDoneState> saveSettings(AppView appView);

  /// 获取设定
  Future<AppDoneState> getSettings(AppView appView);

  /// 打开文件
  Future<AppDoneState> openFiles(AppView appView);

  /// 浏览
  Future<AppDoneState> explorer(AppView appView);
}
