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
      height: MediaQuery.of(context).size.height * 0.15,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05, vertical: MediaQuery.of(context).size.height * 0.04),
      decoration: BoxDecoration(
          color: Colors.pink,
          image: const DecorationImage(
            image: NetworkImage("https://ak.picdn.net/shutterstock/videos/21155113/thumb/1.jpg"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            //resim kısmı
            width: MediaQuery.of(context).size.width * 0.25,
            padding: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(),
            child: ClipOval(
              child: Image.network(
                "http://cdn.shopify.com/s/files/1/1144/7870/products/lalegold-ziynet-roter-kurplu-500x500_114ae1cf-12e9-4cce-a2b1-a9fa6edf2878_grande.png?v=1515795837",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
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
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
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
