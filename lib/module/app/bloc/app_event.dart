/// 事件
enum AppEvent {
  // 初始加载
  load,
  // hello(调用hello插件的hello方法)
  hello,
  // message(调用hello插件的message方法)
  message,
  // 保存设定(利用shared_preferences插件)
  saveSettings,
  // 获取设定(利用shared_preferences插件)
  getSettings,
  // 打开文件
  openFiles,
  // 浏览(调用moist插件的浏览方法)
  explorer,
}
