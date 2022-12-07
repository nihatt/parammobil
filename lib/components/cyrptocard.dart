import 'package:flutter/material.dart';

class CyrptoCard extends StatefulWidget {
  final String name;
  final num value;
  final num hourchange;
  final num dailychange;
  final num volume;
  final num marketcap;

  const CyrptoCard(
      {Key? key,
      required this.name,
      required this.value,
      required this.hourchange,
      required this.dailychange,
      required this.volume,
      required this.marketcap})
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
    } else
      renk1 = Colors.red;

    if (widget.dailychange > 0) {
      renk2 = Colors.green;
    } else
      renk2 = Colors.red;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: BoxConstraints(maxHeight: 500),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(widget.name, style: TextStyle(fontSize: 25)),
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Fiyat".toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text(widget.value.toString())
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color: renk1,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Saatlik Değişim".toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text(widget.hourchange.toString())
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color: renk2,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Günlük Değişim".toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text(widget.dailychange.toString())
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Hacim".toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text(widget.volume.toString())
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Piyasa Değeri".toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.w600),
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
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showSimpleModalDialog(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.03),
        width: MediaQuery.of(context).size.width * 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(widget.name), Text(widget.value.toString() + ' \$')],
        ),
      ),
    );
  }
}
