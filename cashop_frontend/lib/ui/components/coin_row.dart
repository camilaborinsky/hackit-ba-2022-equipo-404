import 'package:flutter/material.dart';

class CoinRow extends StatelessWidget {
  const CoinRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: const CircleAvatar(
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
                  'BTC',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text('Bitcoin', style: Theme.of(context).textTheme.bodyText2)
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('0,09372097'),
                const SizedBox(
                  height: 4,
                ),
                RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                        text: '\$508',
                        style: Theme.of(context).textTheme.caption,
                        children: [
                          TextSpan(
                              text: ',4',
                              style: Theme.of(context).textTheme.caption)
                        ])),
              ],
            )
          ],
        ),
      ),
    );
  }
}
