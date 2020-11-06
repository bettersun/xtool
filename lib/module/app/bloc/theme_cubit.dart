import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

// 主题Cubit
class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  // 明亮主题
  static final _lightTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
    primaryColor: Colors.blue[300],
  );

  // 黑暗主题
  static final _darkTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
    primaryColor: Colors.indigo,
  );

  /// 切换主题
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
