import 'package:flutter/material.dart';

class ContainerDashboardWidget extends StatelessWidget {
  const ContainerDashboardWidget({
    Key? key,
    required this.texto,
    required this.rota,
    required this.icone,
    required this.cor,
  }) : super(key: key);

  // variaveis da classe
  final String texto;
  final String rota;
  final IconData icone;
  final Color cor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(rota),
        child: Center(
          child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: cor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 50, bottom: 50),
                child: Column(
                  children: [
                    Text(texto, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Icon(icone, size: 50),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
