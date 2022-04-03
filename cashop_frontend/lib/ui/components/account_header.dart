import 'package:cashop_frontend/style/color_palette.dart';
import 'package:flutter/material.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({Key? key, this.withButtons = false}) : super(key: key);

  final bool withButtons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16, right: 16, top: 12, bottom: withButtons ? 0 : 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
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
          Column(
            children: [
              Text(
                'SALDO',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const MoneyLabel(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Próxima acreditación: ',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    '2d y 3h',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: ColorPalette.doveGrey),
                  )
                ],
              ),
              if (withButtons)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Wrap(
                    spacing: 12,
                    children: <Widget>[
                      TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.resolveWith<
                                  EdgeInsetsGeometry>(
                              (states) => const EdgeInsets.only(
                                  bottom: 14, top: 12, left: 16, right: 16)),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return ColorPalette.athensGrey.withOpacity(0.3);
                            } else {
                              return ColorPalette.athensGrey;
                            }
                          }),
                        ),
                        onPressed: () {
                          // Respond to button press
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.arrow_upward_rounded,
                                size: 18,
                                color: ColorPalette.doveGrey,
                              ),
                            ),
                            Text(
                              'ENVIAR',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                      color: ColorPalette.doveGrey,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.resolveWith<
                                  EdgeInsetsGeometry>(
                              (states) => const EdgeInsets.only(
                                  bottom: 14, top: 12, left: 16, right: 16)),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return ColorPalette.athensGrey.withOpacity(0.3);
                            } else {
                              return ColorPalette.athensGrey;
                            }
                          }),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/charge');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.arrow_downward_rounded,
                                size: 18,
                                color: ColorPalette.doveGrey,
                              ),
                            ),
                            Text(
                              'RECIBIR',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                      color: ColorPalette.doveGrey,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 25,
              backgroundImage:AssetImage('avatar/agustin_tormakh_avatar.jpeg'),
            ),
          )
        ],
      ),
    );
  }
}

class MoneyLabel extends StatelessWidget {
  const MoneyLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '\$',
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: ColorPalette.emerald),
        ),
        Text(
          '12.420',
          style: Theme.of(context).textTheme.headline1,
        ),
        Text('61',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: ColorPalette.emerald)),
      ],
    );
  }
}
