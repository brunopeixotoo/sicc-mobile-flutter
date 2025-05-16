import 'package:flutter/material.dart';
import 'package:sicc/widgets/customRecord/index.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomRecord(
          'assets/images/perfilimage.png',
          'João Pereira',
          'Garfo', '12/07/1990',
          'Maria Pereira Souza',
          'Rua: Armando Joaquim - Centro',
          'Grau 1',
          'O registrado começa a sua atividade de venda por volta de 23hrs. Ele também tem táticas para enganar a polícia, pois fica desfarçado de comerciante de venda de cocadas.',
          true
        ),
      ),
    );
  }
}
