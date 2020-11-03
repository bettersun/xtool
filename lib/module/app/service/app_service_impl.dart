import 'package:xtool/plugin/go/plugin.dart';
import 'package:shared_preferences_windows/shared_preferences_windows.dart';

import '../bloc/bloc.dart';
import '../view_model/vm.dart';

import 'app_service.dart';

/// 程序Service实现
class AppServiceImpl extends AppService {
  @override
  Future<AppDoneState> init() async {
    const AppView view = AppView(title: 'bettersun');

    return AppDoneState(view: view);
  }

  @override
  Future<AppDoneState> hello(AppView appView) async {
    // 调用插件方法
    String title = await HelloPlugin.hello();

    title = title ?? '';

    final AppView view = appView.copyWith(title: title);

    final String result =
        await XlsxPlugin.readCell('./hello.xlsx', 'Sheet1', 'A1');
    print('XlsxPlugin.readCell');
    print(result);

    return AppDoneState(view: view);
  }

  @override
  Future<AppDoneState> message(AppView appView) async {
    // 调用插件方法
    String title = await HelloPlugin.message('bettersun');

    title = title ?? '';

    final AppView view = appView.copyWith(title: title);

    return AppDoneState(view: view);
  }

  @override
  Future<AppDoneState> saveSettings(AppView appView) async {
    // SharedPreferencesWindows插件
    final prefs = SharedPreferencesWindows.instance;

    final bool isSet =
        await prefs.setValue(null, 'theme_mode', 'dark').then((bool success) {
      return true;
    });

    final String info = isSet ? '主题模式已保存' : '主题模式保存失败';

    final AppView view = appView.copyWith(info: info);
    return AppDoneState(view: view);
  }

  @override
  Future<AppDoneState> getSettings(AppView appView) async {
    // SharedPreferencesWindows插件
    final prefs = SharedPreferencesWindows.instance;

    String mode = '';
    mode = await prefs.getAll().then((Map<String, Object> values) {
      return (values['theme_mode'] ?? '') as String;
    });

    final String info = '主题模式: ' + mode;

    final AppView view = appView.copyWith(info: info);
    return AppDoneState(view: view);
  }

  @override
  Future<AppDoneState> openFiles(AppView appView) async {
    final AppView view = appView.copyWith();
    return AppDoneState(view: view);
  }

  @override
  Future<AppDoneState> explorer(AppView appView) async {
    final List<String> p = [];

    // TODO(bettersun): 试验用
    p.add('E:\\BS\\Mac');
    p.add('E:\\BS\\Test');

    final List<String> ip = [];
    ip.add('');

    final List<String> iFile = [];
    iFile.add('');

    final ExplorerOption option = ExplorerOption();
    option.rootPath = p;
    option.includeSubPath = false;
    option.ignorePath = ip;
    option.ignoreFile = iFile;

    // 调用插件方法
    final TreeNode tree = await MoistPlugin.explorer(option);
    print(tree.children[0].name);

    final AppView view = appView.copyWith(info: '搜索执行完成(调用moist插件的explorer方法)');
    return AppDoneState(view: view);
  }
}
