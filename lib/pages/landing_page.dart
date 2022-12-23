import 'package:coins/pages/main_page.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intro_screen_onboarding_flutter/intro_app.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);

  final List<Introduction> list = [
    Introduction(
      title: 'Param Mobil',
      subTitle: 'Bütün varlık degerleriniz tek uygulama ile cebinizde',
      titleTextStyle:
          GoogleFonts.lobster(textStyle: const TextStyle(fontSize: 35)),
      subTitleTextStyle: GoogleFonts.shadowsIntoLight(
          textStyle: const TextStyle(fontSize: 24, color: Colors.white)),
      imageUrl: 'assets/images/image.png',
      imageHeight: 200,
      imageWidth: 400,
    ),
    Introduction(
      title: 'En Hızlı Değerler !',
      subTitle: 'Marketin en hızlı cüzdan takip uygulaması ',
      titleTextStyle:
          GoogleFonts.lobster(textStyle: const TextStyle(fontSize: 35)),
      subTitleTextStyle: GoogleFonts.shadowsIntoLight(
          textStyle: const TextStyle(
              fontSize: 24, color: Color.fromARGB(255, 255, 255, 255))),
      imageUrl: 'assets/images/manphone.png',
      imageHeight: 200,
      imageWidth: 400,
    ),
    Introduction(
      title: 'Daha Fazla tür !',
      subTitle: 'Şimdi altın , kripto ve borsa seçeneği ile !',
      imageUrl: 'assets/images/tipler.png',
      titleTextStyle:
          GoogleFonts.lobster(textStyle: const TextStyle(fontSize: 35)),
      subTitleTextStyle: GoogleFonts.shadowsIntoLight(
          textStyle: const TextStyle(
              fontSize: 24, color: Color.fromARGB(255, 255, 255, 255))),
      imageHeight: 300,
      imageWidth: 400,
    ),
    Introduction(
      title: 'Son olarak :)',
      subTitle:
          'Uygulamada bulduğunuz hataları sağ üstteki butondan geliştiricilere bildirmeyi unutmayınız',
      imageUrl: 'assets/images/image.png',
      titleTextStyle:
          GoogleFonts.lobster(textStyle: const TextStyle(fontSize: 35)),
      subTitleTextStyle: GoogleFonts.shadowsIntoLight(
          textStyle: const TextStyle(
              fontSize: 24, color: Color.fromARGB(255, 255, 255, 255))),
      imageHeight: 200,
      imageWidth: 400,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      text: "Hemen geç",
      skipTextStyle: const TextStyle(color: Colors.amber, fontSize: 20),
      introductionList: list,
      onTapSkipButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ), //MaterialPageRoute
        );
      },
      // foregroundColor: Colors.red,
    );
  }
}
