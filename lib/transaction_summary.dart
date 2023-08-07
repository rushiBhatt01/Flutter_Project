import 'package:flutter/material.dart';

import 'package:mini_project/transaction.dart';

import '../../../size_config.dart';

class TransactionSummary extends StatelessWidget {
  final Transaction transaction;
  const TransactionSummary({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            width: SizeConfig.defaultWidth * 6,
            height: SizeConfig.defaultWidth * 6,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    transaction.color.shade100,
                    transaction.color.shade200
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.2, 1]),
              shape: BoxShape.circle,
            ),
            child: Icon(
              transaction.icon,
              color: Colors.white,
              size: SizeConfig.defaultHeight * 3,
            ),
          ),
          title: Text(
            transaction.title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            transaction.category,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white70),
          ),
          trailing: Text(
            transaction.value.toStringAsFixed(2),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(SizeConfig.defaultWidth * 10,
              SizeConfig.defaultHeight, 0, SizeConfig.defaultHeight),
          child: Divider(
            color: Colors.grey[700],
            height: 1,
          ),
        )
      ],
    );
  }
}
