import 'dart:ui';

import 'package:flutter/material.dart';

class MarketCard extends StatelessWidget {
  final String name;
  final num price;

  const MarketCard({Key? key, required this.name, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.15,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.04),
        decoration: BoxDecoration(
            color: Colors.pink,
            image: const DecorationImage(
              image: NetworkImage(
                  "https://ak.picdn.net/shutterstock/videos/23155912/thumb/1.jpg"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.65,
          child: Column(
            // data kısmı
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name.toUpperCase(),
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    backgroundColor: Colors.amber),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "FİYAT",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 25,
                        backgroundColor: Colors.amber),
                  ),
                  Text(
                    price.toDouble().toString() + " ₺",
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 25,
                        backgroundColor: Colors.amber),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
