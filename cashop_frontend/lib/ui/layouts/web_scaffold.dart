import 'package:cashop_frontend/style/color_palette.dart';
import 'package:cashop_frontend/ui/components/bottom_navigation.dart';
import 'package:flutter/material.dart';

class WebScaffold extends StatelessWidget {
  const WebScaffold({Key? key, required this.child, this.withFloating = true}) : super(key: key);
  final Widget child;
  final bool withFloating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: ColorPalette.white,
      floatingActionButton: withFloating ? QRFloatingActionButton() : null,
      // appBar: AppBar(
      //   iconTheme: const IconThemeData(color: ColorPalette.capeCod),
      //   automaticallyImplyLeading: state.business != null,
      //   title: InkWell(
      //     child: const LogoAppbar(),
      //     onTap: () {
      //       Navigator.of(context).pushNamed("/");
      //     },
      //   ),
      //   backgroundColor: ColorPalette.white,
      // ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (MediaQuery.of(context).size.width - 800) / 2),
        child: Container(
          color: ColorPalette.white,
          child: SafeArea(child: child),
        ),
      ),
    );
  }
}
