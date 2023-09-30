import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petshop_assist/components/app_drawer.dart';
import 'package:petshop_assist/pages/customer_management.dart';
import 'package:petshop_assist/pages/setting.dart';
import 'package:petshop_assist/theme/WaveDecoratedFloatingActionButton.dart';
import 'package:petshop_assist/theme/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:petshop_assist/generated/l10n.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi Logger',
      theme: Themes.lightTheme,
      home: const CustomerManagementPage(),
      locale: const Locale.fromSubtags(languageCode: 'ko'), // set local language
      // Localization options
      // https://docs.flutter.dev/ui/accessibility-and-localization/internationalization
      // https://fronquarry.tistory.com/8
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ko'), // Korean
      ],
    );
  }
}
