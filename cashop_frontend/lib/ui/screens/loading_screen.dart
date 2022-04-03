import 'package:cashop_frontend/layout/responsive_interface.dart';
import 'package:cashop_frontend/style/color_palette.dart';
import 'package:cashop_frontend/ui/layouts/mobile_scaffold.dart';
import 'package:cashop_frontend/ui/layouts/web_scaffold.dart';
import 'package:flutter/material.dart';

class ProcessingPaymentScreen extends StatelessWidget {
  const ProcessingPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        web: WebScaffold(withFloating: false, child: _buildComponent(context)),
        mobile: MobileScaffold(
          withFloating: false,
          child: _buildComponent(context),
        ),
        tablet: MobileScaffold(
          withFloating: false,
          child: _buildComponent(context),
        ),
        other: MobileScaffold(
          withFloating: false,
          child: _buildComponent(context),
        ));
  }

  Widget _buildComponent(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              iconSize: 40,
              onPressed: () {
                Navigator.of(context).pushNamed("/faq");
              },
              icon: const Icon(
                Icons.help_outline_rounded,
                color: ColorPalette.doveGrey,
              ),
              color: ColorPalette.athensGrey,
            ),
          ],
        ),
      ],
    );
  }
}
