import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sicc/models/pagehome/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Item> _items = [];
  List<Item> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterItems);
    _loadItems();
  }

  // PUXANDO JSON E TRANSFORMANDO
  Future<void> _loadItems() async {
    final jsonString = await rootBundle.loadString('assets/json/data.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    setState(() {
      _items = jsonResponse.map((e) => Item.fromJson(e)).toList();
      _filteredItems = _items;
    });
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems =
          _items.where((item) {
            return item.name.toLowerCase().contains(query);
          }).toList();
    });
  }

  // CRIAÇÃO E RENDERIZAÇÃO DE CARDS
  Widget _buildCards() {
    return ListView.builder(
      itemCount: _filteredItems.length,
      itemBuilder: (context, index) {
        final item = _filteredItems[index];
        return Padding(
          padding: EdgeInsets.all(10),
          child: SizedBox(
            width: 400,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 5),
                    child: Image.asset(
                      item.img,
                      width: 100, // opcional
                      height: 100, // opcional
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fundo branco
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:20, bottom: 20, left: 10, right: 10),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Buscar categorias',
                labelStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Expanded(
            child: _buildCards(),
          ),
        ],
      ),
    );
  }

}
