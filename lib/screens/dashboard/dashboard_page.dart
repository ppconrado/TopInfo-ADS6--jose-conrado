import 'package:flutter/material.dart';

import '../../widgets/container_dashboard_widget.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bank of Franca Corporation'),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
              fontSize: 25,
          color: Colors.white70
        ),
        backgroundColor: Colors.black87,
      ),
      body: Column(

        children: const [
          // conatainer contato
          ContainerDashboardWidget(
            texto: 'Contatos',
            cor: Colors.green,
            icone: Icons.person,
            rota: '/contato',
          ),
          ContainerDashboardWidget(
            texto: 'Transferências',
            cor: Colors.orangeAccent,
            icone: Icons.monetization_on,
            rota: '/transferencia',
          ),
        ],
      ),
    );
  }
}
