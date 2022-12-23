import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:coins/components/goldencard.dart';
import 'package:coins/components/loadingcard.dart';
import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:http/http.dart' as http;

class GoldenDetails extends StatefulWidget {
  const GoldenDetails({Key? key}) : super(key: key);

  @override
  State<GoldenDetails> createState() => _GoldenDetailsState();
}

class _GoldenDetailsState extends State<GoldenDetails> {
  final TextEditingController _filter = TextEditingController();
  String _searchText = "";
  TextEditingController textController = TextEditingController();
  List _loadedData = [];
  final List _allNames = [];
  List _filteredData = []; // names filtered by search text
  Icon _searchIcon = const Icon(Icons.search);
  Widget _appBarTitle = const Text('Altın fiyatları');
  Future<void> _fetchData() async {
    const API_URL = 'https://api.collectapi.com/economy/goldPrice';

    final response = await http.get(
      Uri.parse(API_URL),
      headers: {
        HttpHeaders.authorizationHeader:
            'apikey 4gBlWdpIoTGRQUKzdMdqsK:4UCQII08SOvRAIZqj5MVb6',
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

  ExamplePageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          _filteredData = _loadedData;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
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
        _searchIcon = const Icon(Icons.close);
        _appBarTitle = TextField(
          style: const TextStyle(
              color: Colors.white, backgroundColor: Colors.blue),
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
        _appBarTitle = const Text('Altın fiyatları');
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
                              return GoldenCard(
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
