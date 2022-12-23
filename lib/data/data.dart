import 'package:coins/classes/categories.dart';
import 'package:coins/pages/money_pages/cyrpto_details.dart';
import 'package:coins/pages/money_pages/exchange_details.dart';
import 'package:coins/pages/money_pages/golden_details.dart';
import 'package:coins/pages/money_pages/market_details.dart';

List<Category> categories = [
  Category("Altın", "Altın Fiyatları Hakkında Bilgi", "assets/images/altin.jpg",
      const GoldenDetails()),
  Category("Döviz", "Anlık Kur Takibi", "assets/images/dolar.webp",
      const ExchangeDetails()),
  Category("Kripto Paralar", "Kripto Para Bilgileri", "assets/images/btc.jpg",
      const CyrptoDetails()),
  Category("Canlı Borsa", "Canlı Borsa Takibi", "assets/images/graf.jpg",
      const MarketDetails())
];
