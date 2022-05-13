import 'dart:developer';

import 'package:federacion/main.dart';
import 'package:federacion/pages/datos.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/widgets.dart'; /*
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';
*/

class Federacion extends StatelessWidget {
  const Federacion({Key? key, this.action = 'login'}) : super(key: key);
  final String? action;
  @override
  Widget build(BuildContext context) {
    const url = 'https://sistemas3.ucol.mx/controlacceso/app';
    return Container(
      child: WebView(
        initialUrl: (action == 'login') ? url + '/login' : url + '/logout',
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: (action == 'login')
            ? <JavascriptChannel>[_loginFederacion(context)].toSet()
            : <JavascriptChannel>[_logOutFederacion(context)].toSet(),
      ),
    );
  }
}

JavascriptChannel _loginFederacion(BuildContext context) {
  return JavascriptChannel(
    name: 'Login',
    onMessageReceived: (JavascriptMessage message) {
      inspect(message.message);
      //Navigator.pushNamedAndRemoveUntil(context, '/datos', (route) => false);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Datos(datos: message.message)));
    },
  );
}

JavascriptChannel _logOutFederacion(BuildContext context) {
  return JavascriptChannel(
    name: 'Logout',
    onMessageReceived: (JavascriptMessage message) {
      //Navigator.pushNamed(context, '/');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Inicio()));
    },
  );
}
