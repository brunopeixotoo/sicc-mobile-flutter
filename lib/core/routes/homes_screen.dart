import 'package:flutter/material.dart';
import 'package:sicc/modules/drawer/index.dart';
import 'package:sicc/modules/home/index.dart';
import 'package:sicc/modules/list/index.dart';
import 'package:sicc/modules/details/index.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 20, 69, 155),
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              'Início',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: HomePage(pageController: _pageController,),
        ),

        Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 20, 69, 155),
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              'Registros',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: Column(
            children: [
              Expanded(child: ListPage(pageController: _pageController)),
            ],
          ),
        ),

        Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 20, 69, 155),
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              'Detalhamento',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: DetailsPage(),
        ),
      ],
    );
  }
}
