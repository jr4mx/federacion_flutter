import 'package:flutter/material.dart';

import 'pages/federacion.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Federacion',
      initialRoute: '/inicio',
      routes: {
        '/inicio': (context) => Inicio(),
        '/federacion': (context) => Federacion(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text(' Uso de Federación '),
        ),
        body: Inicio(),
      ),
    );
  }
}

class Inicio extends StatelessWidget {
  const Inicio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          child: Text('Inicia sesión'),
          onPressed: () {
            Navigator.of(context).pushNamed('/federacion');
          },
        ),
      ),
    );
  }
}
