import 'package:flutter/material.dart';

class GoldenCard extends StatelessWidget {
  final String name;
  final num buying;
  final num selling;
  const GoldenCard({
    Key? key,
    required this.name,
    required this.buying,
    required this.selling,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.16,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05, vertical: MediaQuery.of(context).size.height * 0.03),
      decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/images/goldback.jpg"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            //resim kısmı
            width: MediaQuery.of(context).size.width * 0.25,
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),

            decoration: const BoxDecoration(),
            child: ClipOval(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Image.asset(
                  "assets/images/goldfront.webp",
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Column(
              // data kısmı
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [const Text("ALIŞ"), Text(buying.toDouble().toString())],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [const Text("SATIŞ"), Text(selling.toDouble().toString())],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
