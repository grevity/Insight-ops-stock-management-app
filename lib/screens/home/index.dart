import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:stock_management/screens/settings/index.dart';
import 'package:stock_management/utils/i18n.dart';

class HomeIndex extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => Settings(),
              );
            },
          )
        ],
        backgroundColor: Color(0xFF1abc9c),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(
          I18n.of(context).translate('HomeAppBarTitle'),
        ),
      ),
    );
  }
}
