import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          Text(
            'Transacciones',
            style: Theme.of(context).textTheme.caption,
          ),
          Spacer(),
          Icon(Icons.access_time_rounded, size: 14,),
          Icon(Icons.arrow_downward, size: 14,)

        ],
      ),
    );
  }
}