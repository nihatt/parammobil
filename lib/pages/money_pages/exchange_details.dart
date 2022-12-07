import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:coins/components/exchangecard.dart';
import 'package:coins/components/goldencard.dart';
import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:http/http.dart' as http;

class ExchangeDetails extends StatefulWidget {
  const ExchangeDetails({Key? key}) : super(key: key);

  @override
  State<ExchangeDetails> createState() => _ExchangeDetailsState();
}

class _ExchangeDetailsState extends State<ExchangeDetails> {
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  TextEditingController textController = TextEditingController();
  List _loadedData = [];
  List _allNames = [];
  List _filteredData = []; // names filtered by search text
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Döviz Kurları');
  Future<void> _fetchData() async {
    const API_URL = 'https://api.collectapi.com/economy/allCurrency';

    final response = await http.get(
      Uri.parse(API_URL),
      headers: {
        HttpHeaders.authorizationHeader:
            'apikey 71ymkw3IEAL4LUPDpKPb9e:0YVJZGjN78b4agycSlfkJ7',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    final data = json.decode(response.body);
    print("------Data------");

    setState(() {
      _loadedData = data['result'];
      _allNames.add(_loadedData.map((e) => e['name']));
      _filteredData = _loadedData;
      print(_loadedData);
      print(_loadedData.length);
    });
  }

  onItemChanged(String value) {
    setState(() {
      _filteredData = _loadedData
          .where((string) =>
              string.toString().toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void _searchPressed() {
    setState(() {
      if (_searchIcon.icon == Icons.search) {
        _searchIcon = Icon(Icons.close);
        _appBarTitle = TextField(
          style: TextStyle(color: Colors.white, backgroundColor: Colors.blue),
          controller: _filter,
          onChanged: onItemChanged,
          decoration: const InputDecoration(
              focusColor: Colors.blue,
              hoverColor: Colors.blue,
              prefixIcon: Icon(Icons.search),
              hintText: 'Arama...',
              fillColor: (Colors.blue)),
        );
      } else {
        _searchIcon = Icon(Icons.search);
        _appBarTitle = Text('Döviz Kurları');
        _filteredData = _loadedData;
        _filter.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loadedData.isEmpty) {
      _fetchData();
    } else {
      print("Breaked");
    }
    return Scaffold(
        appBar: AppBar(
          title: _appBarTitle,
          actions: [IconButton(onPressed: _searchPressed, icon: _searchIcon)],
        ),
        body: RefreshIndicator(
          onRefresh: _fetchData,
          child: SafeArea(
            child: _loadedData.length == 0
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                        Text("Yükleniyor",
                            style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: SizedBox(
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _filteredData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ExchangeCard(
                                  name: _filteredData[index]['name'],
                                  buying: _filteredData[index]['buying'],
                                  selling: _filteredData[index]['selling']);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
          ),
        ));
  }
}
