import 'package:flutter/material.dart';

class ConditionPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double inputWidth = 500;

    return Container(
      color: Colors.orangeAccent,
      height: 220,
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
                    SizedBox(width: inputWidth, child: TextField()),
                  ],
                ),
                Row(
                  children: [
                    label('关键字'),
                    SizedBox(width: inputWidth, child: TextField()),
                  ],
                ),
              ],
            ),
            //
            Row(
              children: [],
            ),
            //
            Row(
              children: [
                Row(
                  children: [
                    label('文件类型'),
                    SizedBox(width: inputWidth, child: TextField()),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                ),
                DropdownButton<String>(
                  value: 'One',
                  onChanged: (String newValue) {},
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (val) {}),
                    Text('搜索子目录'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (val) {}),
                    Text('区分大小写'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (val) {}),
                    Text('忽略选项'),
                  ],
                ),
              ],
            ),

            Row(
              children: [
                Row(
                  children: [
                    label('忽略目录'),
                    SizedBox(width: inputWidth, child: TextField()),
                  ],
                ),
                Row(
                  children: [
                    label('忽略关键字'),
                    SizedBox(width: inputWidth, child: TextField()),
                  ],
                ),
              ],
            ),
            //
            Visibility(
              visible: true,
              child: Row(
                children: [
                  Row(
                    children: [
                      label('忽略类型'),
                      SizedBox(width: inputWidth, child: TextField()),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_down),
                  ),
                  DropdownButton<String>(
                    value: 'One',
                    onChanged: (String newValue) {},
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget label(String labelText) {
  const double labelPadding = 4.0;
  const double labelWidth = 80.0;

  return Container(
    padding: EdgeInsets.only(left: labelPadding, right: labelPadding),
    // color: Theme.of(context).dividerColor,
    width: labelWidth,
    alignment: Alignment.centerRight,
    child: Text(labelText),
  );
}
