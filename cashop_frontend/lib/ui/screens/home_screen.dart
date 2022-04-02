import 'package:cashop_frontend/layout/responsive_interface.dart';
import 'package:cashop_frontend/ui/layouts/mobile_scaffold.dart';
import 'package:cashop_frontend/ui/layouts/web_scaffold.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: MobileScaffold(

      ),
      web: WebScaffold(),
      other: MobileScaffold(),
      tablet: MobileScaffold(),
    );
  }
}