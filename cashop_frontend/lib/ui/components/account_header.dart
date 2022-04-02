import 'package:cashop_frontend/style/color_palette.dart';
import 'package:flutter/material.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            iconSize: 50,
            onPressed: (){}, 
            icon: const Icon(Icons.help_outline_rounded, color: ColorPalette.doveGrey,), 
            color: ColorPalette.athensGrey,),
          Column(
            children: [
              Text('SALDO', style: Theme.of(context).textTheme.bodyText2,),
               const MoneyLabel(),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Próxima acreditación: ', style: Theme.of(context).textTheme.caption,),
          Text('2d y 3h', style: Theme.of(context).textTheme.caption?.copyWith(color: ColorPalette.doveGrey),)
        ],
      )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(radius: 25, backgroundColor: ColorPalette.emerald, ),
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
        Text('\$', style: Theme.of(context).textTheme.bodyText1?.copyWith(color: ColorPalette.emerald), ),
        Text('12.420', style: Theme.of(context).textTheme.headline1,),
        Text('61',style: Theme.of(context).textTheme.bodyText1?.copyWith(color: ColorPalette.emerald) ),
      ],
    );
  }
}