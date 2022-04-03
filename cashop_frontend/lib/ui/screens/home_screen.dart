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

import '../../data/api/api_response.dart';
import '../../data/api/wallet_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Map<BottomNavigationRoutes, Widget> homeWidgets = {
    BottomNavigationRoutes.home: HomeView(),
    BottomNavigationRoutes.wallet:  WalletView()
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
        HomeScreen.homeWidgets[currentIndex] ?? Container(),
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

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ChargesApi chargesApi;

  @override
  void initState() {
    chargesApi = ChargesApi("http://localhost:8000");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiResponse<List<Charge>>>(
      future: chargesApi.getCharges(),
      builder: (
        BuildContext context,
        AsyncSnapshot<ApiResponse<List<Charge>>> snapshot,
      ) {
        print(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            print("SNAPSHOT DATA====");
            print(snapshot.data);
            List<Charge> charges = [];
            ApiResponse<List<Charge>>? apiResponseCharges = snapshot.data;
            if (apiResponseCharges?.success ?? false) {
              List<Charge>? chargesData = apiResponseCharges?.data;
              if (chargesData != null) {
                charges = chargesData
                    .map((e) => Charge(e.id, e.price, e.addresses, e.state))
                    .toList();
              }
            }
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
                      SizedBox(
                        height: 16,
                      ),
                      ListHeader(
                        title: 'Transacciones',
                      ),
                    ],
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => ChargeRowItem(charges[index]
                            //Charge(1, Price("ARS", 1500.65), [], "CONFIRMED")
                            ),
                        childCount: charges.length))
              ],
            );
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }
}


class WalletView extends StatefulWidget {
  WalletView({Key? key}) : super(key: key);

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  late WalletApi walletApi;

  @override
  void initState() {
    walletApi = WalletApi("http://localhost:8000");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiResponse<List<Coin>>>(
      future: walletApi.getWallet(),
      builder: (
        BuildContext context,
        AsyncSnapshot<ApiResponse<List<Coin>>> snapshot,
      ) {
        print(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            print("SNAPSHOT DATA====");
            print(snapshot.data);
            List<Coin> coins = [];
            ApiResponse<List<Coin>>? apiResponseCoins = snapshot.data;
            if (apiResponseCoins?.success ?? false) {
              List<Coin>? coinsData = apiResponseCoins?.data;
              if (coinsData != null) {
                coins = coinsData
                    .map((e) => Coin(e.currency, e.abbreviation, e.amount))
                    .toList();
              }
            }
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
                      AccountHeader(
                        withButtons: true,
                      ),
                      ListHeader(title: 'Monedas'),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) =>  CoinRow(coins[index]),
                        childCount: coins.length))
              ],
            );
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }
}
