import 'package:cashop_frontend/layout/responsive_interface.dart';
import 'package:cashop_frontend/style/color_palette.dart';
import 'package:cashop_frontend/ui/components/account_header.dart';
import 'package:cashop_frontend/ui/components/charge_row_item.dart';
import 'package:cashop_frontend/ui/components/list_header.dart';
import 'package:cashop_frontend/ui/layouts/mobile_scaffold.dart';
import 'package:cashop_frontend/ui/layouts/web_scaffold.dart';
import 'package:flutter/material.dart';

import '../../data/api/charges_api.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: MobileScaffold(
        child:_buildComponent(context),
      ),
      web: WebScaffold(
        child: _buildComponent(context),
      ),
      other: MobileScaffold(
        child: _buildComponent(context),
      ),
      tablet: MobileScaffold(
        child: _buildComponent(context),
      ),
    );
  }

  Widget _buildComponent(BuildContext context) {
    return  CustomScrollView(
      
      slivers: <Widget>[
        SliverAppBar(
            expandedHeight: 180.0,
            collapsedHeight: 180,
            backgroundColor: ColorPalette.transparent,
            centerTitle: true,
            pinned: true,
            flexibleSpace: Column(
              children: [
                AccountHeader(),
                ListHeader(),
                
              ],
            ) ,
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
