import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class I18n {
  final Locale locale;
  I18n(this.locale);
  static I18n of(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  static const LocalizationsDelegate<I18n> delegate = _I18nDelegate();
  Map<String, String> _localizedStrings;
  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('i18n/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String translate(String key) {
    return _localizedStrings[key];
  }
}

class _I18nDelegate extends LocalizationsDelegate<I18n> {
  const _I18nDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'hi'].contains(locale.languageCode);
  }

  @override
  Future<I18n> load(Locale locale) async {
    I18n localizations = new I18n(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_I18nDelegate old) => false;
}
