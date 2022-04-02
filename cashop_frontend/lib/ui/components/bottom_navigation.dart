import 'dart:math';

import 'package:cashop_frontend/style/color_palette.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key, this.width}) : super(key: key);
  final double? width;

  @override
  Widget build(BuildContext context) {
    final double finalWidth = width ??  MediaQuery.of(context).size.width;
    return Container(
        width: finalWidth,
        height: 60,
        decoration: const BoxDecoration(
          color: ColorPalette.transparent,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomAppBar(
              child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: finalWidth / 3,
                  child:
                      IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
                ),
                // Spacer(),
                SizedBox(
                  width: finalWidth / 3,
                  child:
                      IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
                ),
              ],
            ),
          )),
        ));
  }
}

class QRFloatingActionButton extends StatelessWidget {
  const QRFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: FloatingActionButton(
        child: Icon(
          Icons.qr_code_2_rounded,
          size: 35,
        ),
        onPressed: () {},
      ),
    );
  }
}
