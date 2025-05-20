import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sicc/modules/list/widgets/list.dart';
import 'package:sicc/modules/list/model/index.dart';

class ListPage extends StatefulWidget {
  final PageController pageController;
  const ListPage({required this.pageController, super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final TextEditingController _searchControllerList = TextEditingController();
  List<RegisterModel> registers = [];
  List<RegisterModel> _filteredItems = [];
  
  @override
  void initState() {
    super.initState();
    _searchControllerList.addListener(_filterItems);
    loadRegisters();
  }

  Future<void> loadRegisters() async {
    final String response = await rootBundle.loadString(
      'assets/json/register.json',
    );
    final List<dynamic> data = json.decode(response);
    setState(() {
      registers = data.map((e) => RegisterModel.fromJson(e)).toList();
      _filteredItems = registers;
    });
  }

  void _filterItems() {
    final query = _searchControllerList.text.toLowerCase();
    setState(() {
      _filteredItems = registers.where((register) {
        return register.name.toLowerCase().contains(query);
      }).toList();
    });
  }


  Widget _buildList() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: _filteredItems.length,
        itemBuilder: (context, index) {
          final reg = _filteredItems[index];
          return InkWell(
            onTap: () {
              widget.pageController.jumpToPage(2);
            },
            child: CustomTile(reg.img, reg.name, reg.status),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:20, bottom: 20, left: 10, right: 10),
            child: TextField(
              controller: _searchControllerList,
              decoration: InputDecoration(
                labelText: 'Buscar registros',
                labelStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Expanded(child: _buildList())
        ],
      ),
    );
  }
}
