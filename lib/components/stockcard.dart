import 'dart:ui';

import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  final String name;
  final String fiyat;
  final String hacim;
  const StockCard(
      {Key? key, required this.name, required this.fiyat, required this.hacim})
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
                "https://static.doviz.com/article/hisse-senedi-nedir-1525438356.jpg"),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 3),
          child: Row(
            children: [
              Container(
                //resim kısmı
                width: MediaQuery.of(context).size.width * 0.25,
                padding: EdgeInsets.only(top: 3),
                decoration: BoxDecoration(),
                child: ClipOval(
                  child: Image.network(
                    "https://www.royalborsa.com/wp-content/uploads/2021/02/shutterstock_750493204_16_9_1593509189-880x495-1-798x450.jpg",
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
                            "FİYAT",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            fiyat.toString(),
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
                            "HACİM",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            hacim.toString(),
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
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
