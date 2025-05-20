
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomTile extends StatelessWidget {
  final String image;
  final String name;
  final String status;

  CustomTile(this.image, this.name, this.status);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 10),
      child: SizedBox(
        width: 400,
        height: 130,
        child: Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.30,
            children: [
              SlidableAction(
                onPressed: (context) {
                  //Callback para quando concluir o registro
                },
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.check,
                label: 'Concluir',
                borderRadius: BorderRadius.circular(5),
              ),
            ],
          ),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 5, left: 10),
                  child: Image.asset(
                    image,
                    width: 70,
                    height: 70,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5, top: 10),
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 1,
                          ),
                          decoration: BoxDecoration(
                            color: status == 'Grau 1'
                                ? Colors.redAccent
                                : const Color.fromARGB(255, 255, 159, 42),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}