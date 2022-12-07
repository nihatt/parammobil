import 'package:coins/classes/categories.dart';
import 'package:coins/pages/money_pages/cyrpto_details.dart';
import 'package:coins/pages/money_pages/exchange_details.dart';
import 'package:coins/pages/money_pages/golden_details.dart';
import 'package:coins/pages/money_pages/market_details.dart';
import 'package:coins/pages/money_pages/stock_details.dart';

List<Category> categories = [
  Category(
      "Altın",
      "Altın Fiyatları Hakkında Bilgi",
      "https://foto.haberler.com/haber/2021/07/25/25-temmuz-ceyrek-altin-fiyati-ne-kadar-tam-altin-14286376_8210_amp.jpg",
      const GoldenDetails()),
  Category(
      "Hisse Senetleri",
      "Anlık Hisse Senetleri Takibi",
      "https://www.investaz.com.tr/uploads/img/hisse-senedi-nedir.jpg",
      const StockDetails()),
  Category(
      "Döviz",
      "Anlık Kur Takibi",
      "https://i.bigpara.com/resize/650x365/i/55big/dolar_650_4.jpg",
      const ExchangeDetails()),
  Category(
      "Kripto Paralar",
      "Kripto Para Bilgileri",
      "https://www.justetf.com/images/thumbnails/etf-investment-guide-theme-crypto.jpg",
      const CyrptoDetails()),
  Category(
      "Canlı Borsa",
      "Canlı Borsa Takibi",
      "https://www.kibrispostasi.com/imagecache/newsimage/news/e/ek/ekonomi-buyudu-646x323_1574791717.jpg",
      const MarketDetails())
];
