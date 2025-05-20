import 'package:flutter/material.dart';

class CustomRecord extends StatelessWidget {
  final String name;
  final String username;
  final String birthday;
  final String motherName;
  final String status;
  final bool confirmed;
  final String image;
  final String address;
  final String observation;

  CustomRecord(
    this.image,
    this.name,
    this.username,
    this.birthday,
    this.motherName,
    this.address,
    this.status,
    this.observation,
    this.confirmed,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Fundo suave
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            constraints: BoxConstraints(maxWidth: 420),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0), // Sem card branco
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 24),
                CircleAvatar(backgroundImage: AssetImage(image), radius: 60),
                SizedBox(height: 16),
                _buildInfoRow('Nome:', name),
                SizedBox(height: 16),
                _buildInfoRow('Apelido:', username),
                SizedBox(height: 16),
                _buildInfoRow('Data de nascimento:', birthday),
                SizedBox(height: 16),
                _buildInfoRow('Nome da mãe:', motherName),
                SizedBox(height: 16),
                _buildInfoRow('Endereço:', address),
                SizedBox(height: 16),
                _buildStatusRow('Situação:', status),
                SizedBox(height: 16),
                _buildInfoRow('Observação:', observation),
                SizedBox(height: 80),
                confirmed
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/home');
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            fixedSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Finalizar registro',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/home');
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            fixedSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Finalizar registro',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.blue[800],
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 20),
              softWrap: true,
              overflow: TextOverflow.visible,
              maxLines: null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow(String label, String value) {
    Color statusColor;
    if (value == 'Grau 1') {
      statusColor = Colors.redAccent;
    } else if (value == 'Grau 2') {
      statusColor = const Color.fromARGB(255, 251, 164, 50);
    } else {
      statusColor = const Color.fromARGB(255, 255, 231, 15);
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.blue[800],
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(width: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
