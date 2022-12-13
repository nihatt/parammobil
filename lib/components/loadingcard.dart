// ignore_for_file: camel_case_types

import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class loadingcard extends StatelessWidget {
  const loadingcard({
    Key? key,
  }) : super(key: key);
  static const double cardHeight = 140;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CardLoading(
          height: cardHeight,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          margin: EdgeInsets.symmetric(vertical: 20),
        ),
        CardLoading(
          height: cardHeight,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          margin: EdgeInsets.only(bottom: 20),
        ),
        CardLoading(
          height: cardHeight,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          margin: EdgeInsets.only(bottom: 20),
        ),
        CardLoading(
          height: cardHeight,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          margin: EdgeInsets.only(bottom: 20),
        ),
      ],
    );
  }
}
