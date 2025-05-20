import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  DrawerTile(this.icon, this.text, this.controller, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
        child: Container(
          padding: EdgeInsets.only(left: 10),
          height: 60,
          child: Row(
            children: [
              Icon(
                icon,
                size: 30,
                color: controller.page == page ?
                  const Color.fromARGB(255, 145, 178, 194) :
                  Colors.white
              ),

              SizedBox(height: 5, width: 32),

              Text(
                text,
                style: TextStyle(
                  color: controller.page == page ?
                    const Color.fromARGB(255, 145, 178, 194) :
                    Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}