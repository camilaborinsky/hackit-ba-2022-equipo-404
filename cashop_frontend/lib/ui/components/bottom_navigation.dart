import 'package:cashop_frontend/style/color_palette.dart';
import 'package:flutter/material.dart';

enum BottomNavigationRoutes { home, charge, wallet }

class BottomNavigation extends StatefulWidget {
  const BottomNavigation(
      {Key? key, this.width, required this.onNavigationTapped})
      : super(key: key);
  final double? width;
  final void Function(BottomNavigationRoutes) onNavigationTapped;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late BottomNavigationRoutes currentIndex;
  @override
  void initState() {
    currentIndex = BottomNavigationRoutes.home;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double finalWidth = widget.width ?? MediaQuery.of(context).size.width;
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: SizedBox(
                    width: finalWidth / 3,
                    child: 
                    // IconButton(
                    //     icon: 
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Icon(
                            Icons.home,
                            color: currentIndex == BottomNavigationRoutes.home
                                ? ColorPalette.emerald
                                : ColorPalette.doveGrey,
                          ),
                          Text('Inicio',
                              style:
                                  Theme.of(context).textTheme.caption?.copyWith(
                                    fontSize: 12,
                                        color: currentIndex ==
                                                BottomNavigationRoutes.home
                                            ? ColorPalette.emerald
                                            : ColorPalette.doveGrey,
                                      )),
                        ]),
                       
                        // ),
                  ),
                   onTap: () {
                          setState(() {
                            currentIndex = BottomNavigationRoutes.home;
                          });
                          widget.onNavigationTapped(currentIndex);
                        }
                ),
                
                // Spacer(),
                 InkWell(
                  child: SizedBox(
                    width: finalWidth / 3,
                    child: 
                    // IconButton(
                    //     icon: 
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Icon(
                            Icons.account_balance_wallet_rounded,
                            color: currentIndex == BottomNavigationRoutes.wallet
                                ? ColorPalette.emerald
                                : ColorPalette.doveGrey,
                          ),
                          Text('Monedas',
                              style:
                                  Theme.of(context).textTheme.caption?.copyWith(
                                    fontSize: 12,
                                        color: currentIndex ==
                                                BottomNavigationRoutes.wallet
                                            ? ColorPalette.emerald
                                            : ColorPalette.doveGrey,
                                      )),
                        ]),
                       
                        // ),
                  ),
                   onTap: () {
                          setState(() {
                            currentIndex = BottomNavigationRoutes.wallet;
                          });
                          widget.onNavigationTapped(currentIndex);
                        }
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
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: const Icon(
              Icons.qr_code_2_rounded,
              size: 32,
            ),
            onPressed: () {},
          ),
          const SizedBox(height: 4,),
          Text('Cobrar',
                              style:
                                  Theme.of(context).textTheme.caption?.copyWith(
                                    fontSize: 12,
                                        color: ColorPalette.doveGrey,
                                      )),
        ],
      ),
    );
  }
}
