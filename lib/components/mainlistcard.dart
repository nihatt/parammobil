import 'dart:ui';

import 'package:coins/pages/details_page.dart';
import 'package:coins/pages/money_pages/golden_details.dart';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String name;
  final String aciklama;
  final String picurl;
  final Widget route;
  const MainCard(
      {Key? key,
      required this.name,
      required this.aciklama,
      required this.picurl,
      required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02,
          0, MediaQuery.of(context).size.height * 0.03),
      child: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => route),
            );
          },
          splashColor: Colors.green,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(picurl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: ClipRRect(
              // make sure we apply clip it properly
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey.withOpacity(0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w500,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              color: Color.fromARGB(255, 0, 0, 255),
                            ),
                            Shadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 20.0,
                              color: Color.fromARGB(125, 0, 0, 255),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        aciklama,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              color: Color.fromARGB(255, 0, 0, 255),
                            ),
                            Shadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 20.0,
                              color: Color.fromARGB(125, 0, 0, 255),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
