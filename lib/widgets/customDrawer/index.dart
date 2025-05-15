
import 'package:flutter/material.dart';
import 'package:sicc/widgets/drawerTile/index.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _buildBodyBack() => Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 20, 69, 155),
            Color.fromARGB(255, 59, 130, 252),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );

    return Drawer(
      child: Stack(
        children: [
          _buildBodyBack(),
          ListView(
            padding: EdgeInsets.only(top: 60),
            children: [
              Image.asset(
                'assets/images/pmrr.gif',
                height: 70,
                width: 70,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Center(
                  child: Text(
                    'SICC',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Center(
                  child: Text(
                    'Sistema de Indentificação e Classificação Criminal',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Divider(),

              DrawerTile(Icons.home, 'Início', pageController, 0),
              DrawerTile(Icons.list, 'Registros', pageController, 1),
              DrawerTile(Icons.location_on, 'Detalhamentos', pageController, 2),
            ],
          )
        ],
      ),
    );
  }
}