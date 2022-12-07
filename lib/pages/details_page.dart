import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Details extends StatelessWidget {
  final String Detail_category;
  Details({Key? key, required this.Detail_category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData appIcon;
    if (Detail_category == "Altın") {
      appIcon = Icons.add_road;
    } else {
      appIcon = Icons.ac_unit;
    }
    return Scaffold(
      appBar: AppBar(
          title: Text(Detail_category.toString()),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.keyboard_backspace))),
      body: CarouselSlider(
        options: CarouselOptions(height: 400.0),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: Text(
                    'textss $i',
                    style: const TextStyle(fontSize: 16.0),
                  ));
            },
          );
        }).toList(),
      ),
    );
  }
}
