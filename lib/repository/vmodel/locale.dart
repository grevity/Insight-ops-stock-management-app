import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

final localeStore = ChangeNotifierProvider<LocaleViewModel>((ref) {
  return LocaleViewModel();
});

class LocaleViewModel extends ChangeNotifier {
  Locale _locale = Locale('en', 'US');
  int _index;
  Locale get locale => _locale;
  int get getIndex => _index;

  setLocale(Locale locale, int index) {
    print(index);
    _locale = locale;
    _index = index;
    notifyListeners();
  }
}
