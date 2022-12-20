import 'package:coins/components/loadingcard.dart';
import 'package:coins/components/marketcard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:easy_load_more/easy_load_more.dart';

class MarketDetails extends StatefulWidget {
  const MarketDetails({Key? key}) : super(key: key);

  @override
  State<MarketDetails> createState() => _MarketDetailsState();
}

class _MarketDetailsState extends State<MarketDetails> {
  final TextEditingController _filter = TextEditingController();
  TextEditingController textController = TextEditingController();
  late Color cyrptocolor;
  List _loadedData = [];
  final List _allNames = [];
  List _filteredData = []; // names filtered by search text
  Icon _searchIcon = const Icon(Icons.search);
  Widget _appBarTitle = const Text('Canlı Borsa');
  Future<void> _fetchData() async {
    const API_URL = 'https://api.collectapi.com/economy/liveBorsa';

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
      _filteredData = _loadedData.sublist(0, 5);
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
        _appBarTitle = const Text('Canlı Borsa');
        _filteredData = _loadedData.sublist(0, 5);
        _filter.clear();
      }
    });
  }

  Future<bool> _loadMore() async {
    await Future.delayed(
      const Duration(
        seconds: 0,
        milliseconds: 2500,
      ),
    );
    _loadItems();
    return true;
  }

  int entrance = 0;
  void _loadItems() {
    if (!mounted) return;
    setState(() {
      entrance += 5;
      _filteredData.addAll(_loadedData.sublist(entrance, entrance + 5));
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
                        Scrollbar(
                          child: EasyLoadMore(
                            loadingStatusText: "Yükleniyor...",
                            finishedStatusText: "Daha fazla veri yok...",
                            isFinished: _filteredData.length >= _loadedData.length,
                            onLoadMore: _loadMore,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _filteredData.length,
                              itemBuilder: (BuildContext context, int index) {
                                return MarketCard(
                                    name: _filteredData[index]['name'], price: _filteredData[index]['price']);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
