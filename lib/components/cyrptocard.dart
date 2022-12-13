import 'dart:ui';

import 'package:flutter/material.dart';

class CyrptoCard extends StatefulWidget {
  final String name;
  final num value;
  final num hourchange;
  final num dailychange;
  final num volume;
  final num marketcap;
  final int index;
  const CyrptoCard(
      {Key? key,
      required this.name,
      required this.value,
      required this.hourchange,
      required this.dailychange,
      required this.volume,
      required this.marketcap,
      required this.index})
      : super(key: key);

  @override
  State<CyrptoCard> createState() => _CyrptoCardState();
}

class _CyrptoCardState extends State<CyrptoCard> {
  _showSimpleModalDialog(context) {
    Color renk1;
    Color renk2;
    if (widget.hourchange > 0) {
      renk1 = Colors.green;
    } else {
      renk1 = Colors.red;
    }

    if (widget.dailychange > 0) {
      renk2 = Colors.green;
    } else {
      renk2 = Colors.red;
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
              child: Dialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            opacity: 1,
                            image: NetworkImage(
                                "https://www.captechu.edu/sites/default/files/The%20link%20between%20cryptocurrency%20coding%20and%20market%20behavior.jpg"),
                            fit: BoxFit.cover),
                      ),
                      constraints: const BoxConstraints(maxHeight: 500),
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 2),
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.grey.withOpacity(0.1),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Text(widget.name, style: const TextStyle(fontSize: 30, color: Colors.white)),
                                    Container(
                                      padding: const EdgeInsets.only(top: 40),
                                      height: MediaQuery.of(context).size.height * 0.4,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.white, borderRadius: BorderRadius.circular(5)),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    "Fiyat".toUpperCase(),
                                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                                Text(widget.value.toString())
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            decoration:
                                                BoxDecoration(color: renk1, borderRadius: BorderRadius.circular(5)),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    "Saatlik Değişim".toUpperCase(),
                                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                                Text(widget.hourchange.toString())
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            decoration:
                                                BoxDecoration(color: renk2, borderRadius: BorderRadius.circular(5)),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    "Günlük Değişim".toUpperCase(),
                                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                                Text(widget.dailychange.toString())
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.white, borderRadius: BorderRadius.circular(5)),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    "Hacim".toUpperCase(),
                                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                                Text(widget.volume.toString())
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.white, borderRadius: BorderRadius.circular(5)),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    "Piyasa Değeri".toUpperCase(),
                                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                                Text(widget.marketcap.toString())
                                              ],
                                            ),
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
                      ))));
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showSimpleModalDialog(context);
        print(widget.index);
      },
      child: Container(
        decoration: BoxDecoration(color: widget.index % 2 == 0 ? Colors.white : Colors.grey[350]),
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05, vertical: MediaQuery.of(context).size.height * 0.03),
        width: MediaQuery.of(context).size.width * 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(widget.name), Text(widget.value.toString() + ' \$')],
        ),
      ),
    );
  }
}
