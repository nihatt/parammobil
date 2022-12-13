import 'package:coins/components/cyrptocard.dart';
import 'package:coins/components/loadingcard.dart';
import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class CyrptoDetails extends StatefulWidget {
  const CyrptoDetails({Key? key}) : super(key: key);

  @override
  State<CyrptoDetails> createState() => _CyrptoDetailsState();
}

class _CyrptoDetailsState extends State<CyrptoDetails> {
  final TextEditingController _filter = TextEditingController();
  final String _searchText = "";
  TextEditingController textController = TextEditingController();
  late Color cyrptocolor;
  List _loadedData = [];
  final List _allNames = [];
  List _filteredData = []; // names filtered by search text
  Icon _searchIcon = const Icon(Icons.search);
  Widget _appBarTitle = const Text('Kripto Paralar');
  Future<void> _fetchData() async {
    const API_URL = 'https://api.collectapi.com/economy/cripto';

    final response = await http.get(
      Uri.parse(API_URL),
      headers: {
        HttpHeaders.authorizationHeader: 'apikey 71ymkw3IEAL4LUPDpKPb9e:0YVJZGjN78b4agycSlfkJ7',
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
      _filteredData =
          _loadedData.where((string) => string.toString().toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  void _searchPressed() {
    setState(() {
      if (_searchIcon.icon == Icons.search) {
        _searchIcon = const Icon(Icons.close);
        _appBarTitle = TextField(
          style: const TextStyle(color: Colors.white, backgroundColor: Colors.blue),
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
        _searchIcon = const Icon(Icons.search);
        _appBarTitle = const Text('Kripto Paralar');
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
            child: _loadedData.isEmpty
                ? const loadingcard()
                : SingleChildScrollView(
                    child: SizedBox(
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _filteredData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CyrptoCard(
                                index: index,
                                name: _filteredData[index]['name'].toString().toUpperCase(),
                                value: _filteredData[index]['price'],
                                dailychange: _filteredData[index]['changeDay'],
                                hourchange: _filteredData[index]['changeHour'],
                                marketcap: _filteredData[index]['marketCap'],
                                volume: _filteredData[index]['volume'],
                              );
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
