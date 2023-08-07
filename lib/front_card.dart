

import 'package:flutter/material.dart';
import 'package:mini_project/credit_card.dart';

import '../../size_config.dart';

class FrontCard extends StatelessWidget {
  final CreditCard card;

  const FrontCard({Key? key, required this.card}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5 / 3,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: [
                  card.colors[0],
                  card.colors[1],
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: const [0, 0.8],
                tileMode: TileMode.clamp)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultWidth * 2,
              vertical: SizeConfig.defaultHeight * 2),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Credit Card",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Icon(
                      Icons.wifi,
                      size: SizeConfig.defaultHeight * 4,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Transform.translate(
                      offset: Offset(-SizeConfig.defaultWidth, 0),
                      child: Image.asset(
                        "assets/images/chip.png",
                        height: 120,
                        width: 80,
                      ),
                    ),
                    Spacer(),
                    Text(
                      card.number,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CARD HOLDER",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white70),
                        ),
                        Text(
                          card.cardHolder,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      card.brand == CardBrand.visa
                          ? "assets/images/visa.png"
                          : "assets/images/mastercard.png",
                      height: SizeConfig.defaultHeight * 3,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
