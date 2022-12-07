import 'dart:ui';

import 'package:flutter/material.dart';

class ExchangeCard extends StatelessWidget {
  final String name;
  final num buying;
  final num selling;

  const ExchangeCard(
      {Key? key,
      required this.name,
      required this.buying,
      required this.selling})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.15,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.04),
      decoration: BoxDecoration(
          color: Colors.pink,
          image: const DecorationImage(
            image: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrx5-zP7h8xwlklnhZRxKwOu0pi-uIBdfEyw&usqp=CAU"),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Row(
            children: [
              Container(
                //resim kısmı
                width: MediaQuery.of(context).size.width * 0.25,
                padding: EdgeInsets.only(top: 3),
                decoration: BoxDecoration(),
                child: ClipOval(
                  child: Image.network(
                    "https://www.pngall.com/wp-content/uploads/2/Currency-PNG.png",
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Column(
                  // data kısmı
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      name.toUpperCase(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "ALIŞ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            buying.toDouble().toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "SATIŞ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            selling.toDouble().toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
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
