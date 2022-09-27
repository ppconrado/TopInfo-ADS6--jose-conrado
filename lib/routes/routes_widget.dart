import 'package:flutter/material.dart';
import 'package:topinfoads6/screens/dashboard/dashboard_page.dart';
import 'package:topinfoads6/screens/contato/lista_contato.dart';
import 'package:topinfoads6/screens/transferencia/lista_transferencia.dart';

class RoutesWidget extends StatelessWidget {
  const RoutesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/dashboard',
      routes: {
        '/contato': (_) => ListaContato(),
        '/transferencia': (_) => ListaTransferencia(),
        '/dashboard': (_) => DashBoardPage(),
      },
    );
  }
}
