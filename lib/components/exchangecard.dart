import 'dart:math';
import 'dart:ui';

import 'package:coins/data/imagedata.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class ExchangeCard extends StatelessWidget {
  final String name;
  final num buying;
  final num selling;

  ExchangeCard({Key? key, required this.name, required this.buying, required this.selling}) : super(key: key);
  List<Color?> colors = [
    Colors.blueGrey[100],
    Colors.amber[200],
    Colors.purple[100],
    Colors.teal[100],
    Colors.pink[100],
    Colors.green[100]
  ];
  @override
  Widget build(BuildContext context) {
    if (name != "") {
      return SizedBox(
        child: FlipCard(
          fill: Fill.none,
          direction: FlipDirection.HORIZONTAL, // default
          front: Container(
            width: MediaQuery.of(context).size.width * 0.16,
            height: MediaQuery.of(context).size.height * 0.16,
            margin: const EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(image: AssetImage(images[Random().nextInt(images.length)]), fit: BoxFit.cover)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Center(
                    child: Text(
                  name.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    wordSpacing: 2,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        color: Color.fromARGB(255, 12, 44, 45),
                      ),
                      Shadow(
                        offset: Offset(0.0, 0.0),
                        blurRadius: 20.0,
                        color: Color.fromARGB(123, 240, 41, 41),
                      ),
                    ],
                  ),
                )),
              ),
            ),
          ),
          back: Container(
              height: MediaQuery.of(context).size.height * 0.16,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: colors[Random().nextInt(colors.length)],
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "ALIŞ",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        selling.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("SATIŞ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                      Text(
                        buying.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      )
                    ],
                  )
                ],
              )),
        ),
      );
    } else {
      return const SizedBox(width: 20);
    }
  }
}
