import 'package:federacion/pages/federacion.dart';
import 'package:flutter/material.dart';

class Datos extends StatelessWidget {
  const Datos({Key? key, required this.datos}) : super(key: key);
  final String datos;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Datos obtenidos')),
      body: Column(
        children: [
          Text(datos),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Federacion(action: 'Logout')));
              },
              child: Text('Cerrar sesión')),
        ],
      ),
    );
  }
}
