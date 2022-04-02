import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right:16),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.caption,
          ),
          const Spacer(),
          const Icon(
            Icons.access_time_rounded,
            size: 14,
          ),
          const Icon(
            Icons.arrow_downward,
            size: 14,
          )
        ],
      ),
    );
  }
}
