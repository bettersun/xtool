import 'package:flutter/material.dart';

class ConditionPanel extends StatelessWidget {
  const ConditionPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      height: 320,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Row(
              children: [
                Row(
                  children: [
                    label('目录'),
                    SizedBox(width: 600, child: TextField()),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (val) {}),
                    Text('搜索子目录'),
                  ],
                ),
              ],
            ),
            //
            Row(
              children: [
                Row(
                  children: [
                    label('关键字'),
                    SizedBox(width: 600, child: TextField()),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (val) {}),
                    Text('区分大小写'),
                  ],
                ),
              ],
            ),
            //
            Row(
              children: [
                Row(
                  children: [
                    label('文件类型'),
                    SizedBox(width: 600, child: TextField()),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (val) {}),
                    Text('搜索模式'),
                  ],
                ),
              ],
            ),
            //
            Row(
              children: [
                Row(
                  children: [
                    label('忽略目录'),
                    SizedBox(width: 600, child: TextField()),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
            //
            Row(
              children: [
                Row(
                  children: [
                    label('忽略关键字'),
                    SizedBox(width: 600, child: TextField()),
                  ],
                ),
              ],
            ),
            //
            Row(
              children: [
                Row(
                  children: [
                    label('忽略类型'),
                    SizedBox(width: 600, child: TextField()),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (val) {}),
                    Text('忽略模式'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget label(String labelText) {
  const labelPadding = 4.0;
  const labelWidth = 80.0;

  return Container(
    padding: EdgeInsets.only(left: labelPadding, right: labelPadding),
    // color: Theme.of(context).dividerColor,
    width: labelWidth,
    alignment: Alignment.centerRight,
    child: Text(labelText),
  );
}
