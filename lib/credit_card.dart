import 'dart:ui';

import 'package:flutter/material.dart';

enum CardBrand { visa, mastercard }

class CreditCard {
  int id;
  String cardHolder, securityCode, number;
  CardBrand brand;
  double amount;
  List<Color> colors;

  CreditCard({
    required this.id,
    required this.cardHolder,
    required this.securityCode,
    required this.number,
    required this.brand,
    required this.amount,
    required this.colors,
  });
}

List<CreditCard> cards = [
  CreditCard(
    id: 1,
    cardHolder: "Demo_holder",
    securityCode: "4260 553",
    number: "1234 5678 9101 1123",
    brand: CardBrand.visa,
    amount: 32000,
    colors: [
      Color(0xFF0000FF),
      Color(0XFF377CFF),
    ],
  ),
  CreditCard(
    id: 2,
    cardHolder: "Demo_holder",
    securityCode: "4260 553",
    number: "1234 5678 9101 1123",
    brand: CardBrand.mastercard,
    amount: 7535.41,
    colors: [
      Color(0xFFFFA351),
      Color(0xFFF83D34),
    ],
  ),
  CreditCard(
    id: 3,
    cardHolder: "Demo_holder",
    securityCode: "4260 553",
    number: "1234 5678 9101 1123",
    brand: CardBrand.mastercard,
    amount: 12517.07,
    colors: [
      Color(0xFF990099),
      Color(0xFF660066),
    ],
  ),
];
