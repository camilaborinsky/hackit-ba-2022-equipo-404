import 'package:cashop_frontend/style/color_palette.dart';
import 'package:flutter/material.dart';

import '../../data/api/wallet_api.dart';

class CoinRow extends StatelessWidget {
  Coin coin;
  CoinRow(this.coin, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("${coin.abbreviation}");
    CryptoCoin cryptoCoin = CryptoCoin.availableCoins
        .firstWhere((element) => element.abbreviation == coin.abbreviation);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: SizedBox(
        height: 70,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 70,
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundColor: ColorPalette.transparent,
                  backgroundImage: AssetImage(cryptoCoin.iconPath),
                  radius: 18,
                )),
            const SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  coin.abbreviation,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(coin.currency,
                    style: Theme.of(context).textTheme.bodyText2)
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(coin.amount.toStringAsFixed(5)),
                const SizedBox(
                  height: 4,
                ),
                // RichText(
                //     textAlign: TextAlign.end,
                //     text: TextSpan(
                //         text: '\$${coin.amount.floor()}',
                //         style: Theme.of(context).textTheme.caption,
                //         children: [
                          // TextSpan(
                          //     text: ',${((coin.amount - coin.amount.floor())*10000).toStringAsFixed(0)}',
                          //     style: Theme.of(context).textTheme.caption)
                        // ])),
              ],
            )
          ],
        ),
      ),
    );
  }
}
