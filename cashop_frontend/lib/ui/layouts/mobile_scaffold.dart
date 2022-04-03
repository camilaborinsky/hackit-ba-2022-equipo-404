import 'package:cashop_frontend/style/color_palette.dart';
import 'package:cashop_frontend/ui/components/bottom_navigation.dart';
import 'package:flutter/material.dart';

class MobileScaffold extends StatelessWidget {
  const MobileScaffold({Key? key, required this.child, this.withFloating = true}) : super(key: key);
  final Widget child;
  final bool withFloating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: child),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: withFloating ? QRFloatingActionButton(): null);
  }
}
