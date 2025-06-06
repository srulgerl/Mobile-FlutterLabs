import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/home.dart';
import 'package:shop_app/l10n/generated/app_localizations.dart';
import 'package:shop_app/provider/globalProvider.dart';
import 'package:shop_app/provider/LocaleModel.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Global_provider()),
        ChangeNotifierProvider(create: (_) => LocaleModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleModel>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      locale: localeProvider.locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('mn', 'MN'),
      ],
      home: SafeArea(child: HomePage()),
    );
  }
}
