import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/transferencia.dart';

import 'package:money2/money2.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoNumeroConta = 'número da conta';
const _dicaCampoNumeroConta = '0000';

const _rotuloCampoValor = 'R\$ valor da transferencia';
const _dicaCampoValor = '0,00';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
        backgroundColor: Colors.orangeAccent,
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
              icone: Icons.perm_identity,
              isText: false,
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
              isText: false,
            ),
            ElevatedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () {
                _criaTransferencia(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(context) {
    // /// Brazilian Real
    // final Currency brl = Currency.create('BRL', 2,
    //     symbol: r'R$ ',
    //     invertSeparators: true,
    //     pattern: 'S0.000,00',
    //     country: 'Brazil',
    //     unit: 'Real',
    //     name: 'Brazilian Real');

    // debugPrint('clicou no confirmar');
    final int? numeroConta = int.tryParse(
      _controladorCampoNumeroConta.text,
    );

    final valor = Money.parse(_controladorCampoValor.text, code: 'BRL');
    //
    // ignore: unnecessary_null_comparison
    if (numeroConta != null && valor != null) {
      // final Future<Transferencia> future =
      final transferenciaCriada = Transferencia(
        valor,
        numeroConta,
      );
      // debugPrint('Criando transferência');
      // debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
