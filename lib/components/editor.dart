import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;
  final bool isText;

  Editor({
    required this.controlador,
    required this.rotulo,
    required this.dica,
    required this.icone,
    required this.isText,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          // ignore: unnecessary_null_comparison
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType:
            isText == true ? TextInputType.text : TextInputType.number,
      ),
    );
  }
}
