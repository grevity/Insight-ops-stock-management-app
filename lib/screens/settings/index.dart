import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:stock_management/repository/vmodel/locale.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int selected = 0;
  final List languages = [
    {"name": "English", "locale": Locale('en', 'US')},
    {"name": "हिन्दी", "locale": Locale('hi', 'IN')}
  ];

  @override
  Widget build(BuildContext context) {
    selected = context.read(localeStore).getIndex ?? 0;
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: CupertinoPicker.builder(
        diameterRatio: 100,
        backgroundColor: Colors.white,
        scrollController: FixedExtentScrollController(
          initialItem: context.read(localeStore).getIndex ?? 0,
        ),
        squeeze: 1,
        itemExtent: 34,
        childCount: languages.length,
        onSelectedItemChanged: (index) {
          context
              .read(localeStore)
              .setLocale(languages[index]["locale"], index);
          setState(() {
            selected = index;
          });
        },
        itemBuilder: (context, index) {
          return Center(
            child: Text(
              languages[index]["name"],
              style: TextStyle(
                color: index == selected ? Color(0xFF0ABDE3) : Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}
