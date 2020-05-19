import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'l10n/messages_all.dart';
// flutter pub get
// flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/localizations/l10n lib/localizations/*_localizations.dart
// flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/localizations/l10n --no-use-deferred-loading lib/localizations/*_localizations.dart lib/localizations/l10n/intl_*.arb


class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name = locale.countryCode?.isEmpty ?? false ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static String get hello => Intl.message('Hello', name: 'hello',);
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'jp'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
