import 'package:cashop_frontend/style/theme.dart';
import 'package:cashop_frontend/ui/screens/charge_screen.dart';
import 'package:flutter/material.dart';

class CashopApp extends StatelessWidget {
  const CashopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: GlobalKey<NavigatorState>(),
      title: 'Cashop',
      theme: CustomTheme.lightTheme,
      routes: {
        "charge":(context) => ChargeScreen(),
      },
      initialRoute: '/',
      home: const CashopApp(),
    );
  }
}
