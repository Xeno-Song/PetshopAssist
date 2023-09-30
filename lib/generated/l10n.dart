// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello World!`
  String get helloWorld {
    return Intl.message(
      'Hello World!',
      name: 'helloWorld',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Customers`
  String get customerManagement {
    return Intl.message(
      'Customers',
      name: 'customerManagement',
      desc: '',
      args: [],
    );
  }

  /// `No driven history`
  String get noHistoryData {
    return Intl.message(
      'No driven history',
      name: 'noHistoryData',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingPageTitle {
    return Intl.message(
      'Settings',
      name: 'settingPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Grooming Settings`
  String get groomingSettingPageTitle {
    return Intl.message(
      'Grooming Settings',
      name: 'groomingSettingPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Grooming Type`
  String get groomingMenu {
    return Intl.message(
      'Grooming Type',
      name: 'groomingMenu',
      desc: '',
      args: [],
    );
  }

  /// `Grooming Options`
  String get groomingOption {
    return Intl.message(
      'Grooming Options',
      name: 'groomingOption',
      desc: '',
      args: [],
    );
  }

  /// `Add grooming type`
  String get addGroomingMenu {
    return Intl.message(
      'Add grooming type',
      name: 'addGroomingMenu',
      desc: '',
      args: [],
    );
  }

  /// `Add grooming option`
  String get addGroomingOption {
    return Intl.message(
      'Add grooming option',
      name: 'addGroomingOption',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ko'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
