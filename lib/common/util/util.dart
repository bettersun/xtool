class Util {
  /// 判断字符串数组中是否存在目标字符串
  static bool isInList(List<String> l, String s) {
    bool isIn = false;

    for (int i = 0; i < l.length; i++) {
      if (s == l[i]) {
        isIn = true;
      }
    }

    return isIn;
  }
}
