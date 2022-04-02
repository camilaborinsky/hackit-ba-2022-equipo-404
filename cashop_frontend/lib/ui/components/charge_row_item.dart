import 'package:cashop_frontend/style/color_palette.dart';
import 'package:flutter/material.dart';

import '../../data/api/charges_api.dart';

class ChargeRowItem extends StatelessWidget {
  final Charge charge;
  const ChargeRowItem(this.charge, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: SizedBox(
        height: 50,
        child: Row(
          children: <Widget>[
            const Icon(
              Icons.circle,
              color: ColorPalette.silver,
              size: 16,
            ),
            SizedBox(
              width: 16,
            ),
            RichText(
                text: TextSpan(
                    text: "\$${charge.price.amount.floor()}",
                    style: Theme.of(context).textTheme.bodyText1,
                    children: [
                  TextSpan(
                      text: ',${((charge.price.amount -charge.price.amount.floor())*100).toInt()}', style: Theme.of(context).textTheme.bodyText2)
                ])),
            Spacer(),
            Text(
              'Hoy',
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(color: ColorPalette.silver),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              '14:23',
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(
              width: 8,
            ),
            const Icon(
              Icons.check,
              color: ColorPalette.algaeGreen,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
