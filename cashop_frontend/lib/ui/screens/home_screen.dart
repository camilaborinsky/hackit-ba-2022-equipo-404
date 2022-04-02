import 'package:cashop_frontend/data/api/charges_api.dart';
import 'package:cashop_frontend/layout/responsive_interface.dart';
import 'package:cashop_frontend/style/color_palette.dart';
import 'package:cashop_frontend/ui/components/account_header.dart';
import 'package:cashop_frontend/ui/components/bottom_navigation.dart';
import 'package:cashop_frontend/ui/components/charge_row_item.dart';
import 'package:cashop_frontend/ui/components/coin_row.dart';
import 'package:cashop_frontend/ui/components/list_header.dart';
import 'package:cashop_frontend/ui/layouts/mobile_scaffold.dart';
import 'package:cashop_frontend/ui/layouts/web_scaffold.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Map<BottomNavigationRoutes, Widget> homeWidgets = {
    BottomNavigationRoutes.home: const HomeView(),
    BottomNavigationRoutes.wallet: const WalletView()
  };

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late BottomNavigationRoutes currentIndex;

  @override
  void initState() {
    currentIndex = BottomNavigationRoutes.home;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: MobileScaffold(
        child: _buildComponent(context, MediaQuery.of(context).size.width),
      ),
      web: WebScaffold(
        child: _buildComponent(context, 800),
      ),
      other: MobileScaffold(
        child: _buildComponent(context, MediaQuery.of(context).size.width),
      ),
      tablet: MobileScaffold(
        child: _buildComponent(context, MediaQuery.of(context).size.width),
      ),
    );
  }

  Widget _buildComponent(BuildContext context, double width) {
    return Stack(
      children: <Widget>[
        HomeScreen.homeWidgets[currentIndex]?? Container(),
        Positioned(
          child: BottomNavigation(
            width: width,
            onNavigationTapped: (BottomNavigationRoutes route) {
              setState(() {
                currentIndex = route;
              });
            },
          ),
          bottom: 0,
        )
      ],
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 180.0,
          collapsedHeight: 180,
          backgroundColor: ColorPalette.white,
          centerTitle: true,
          pinned: true,
          flexibleSpace: Column(
            children: const <Widget>[
              AccountHeader(),
              SizedBox(height: 16,),
              ListHeader(
                title: 'Transacciones',
              ),
            ],
          ),
        ),
        SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ChargeRowItem(Charge(1,Price("ARS",1500.65),[],"CONFIRMED")),
                    childCount: 10
                    ))

      ],
    );
  }
}


class WalletView extends StatelessWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 210,
          collapsedHeight: 210,
          backgroundColor: ColorPalette.white,
          centerTitle: true,
          pinned: true,
          flexibleSpace: Column(
            children: const <Widget>[
              AccountHeader(withButtons: true,),
              ListHeader(title: 'Monedas'),
              const SizedBox(height: 16,),

            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => const CoinRow(),
                childCount: 30))
      ],
    );
  }
}