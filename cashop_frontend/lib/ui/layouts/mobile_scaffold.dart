import 'package:cashop_frontend/style/color_palette.dart';
import 'package:cashop_frontend/ui/components/bottom_navigation.dart';
import 'package:flutter/material.dart';

class MobileScaffold extends StatelessWidget {
  const MobileScaffold({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(color: ColorPalette.emerald,child: child,),
            Positioned(child: BottomNavigation(), bottom: 0,)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: QRFloatingActionButton()
    );
  }
}