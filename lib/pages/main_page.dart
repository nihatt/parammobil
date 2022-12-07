import 'package:flutter/material.dart';
import 'package:coins/components/mainlistcard.dart';
import 'package:coins/data/data.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  _launchURL() async {
    const url = 'https://wa.me/905551592342';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    showAlertDialog() {
      // set up the buttons
      Widget cancelButton = TextButton(
        child: const Text("Tamam"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      ;

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: const Text("ParamMobil"),
        content: const Text(
            "Uygulama Hakkındaki görüş ve önerileriniz için sağ üstteki arama simgesinden bana ulaşabilirsiniz"),
        actions: [
          cancelButton,
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Param Mobil",
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            onPressed: showAlertDialog,
            icon: const Icon(Icons.question_answer),
          ),
          actions: [
            IconButton(
              onPressed: _launchURL,
              icon: const Icon(Icons.call),
            ),
          ]),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return MainCard(
                    name: categories[index].name,
                    aciklama: categories[index].aciklama,
                    picurl: categories[index].picurl,
                    route: categories[index].route,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
