import 'package:flutter/material.dart';
import '../../models/transferencia.dart';
import 'formulario_transferencia.dart';

const _tituloAppBar = 'Lista de Transferências';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(_tituloAppBar),
        backgroundColor: Colors.orangeAccent,
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioTransferencia();
              },
            ),
          );
          future.then(
            (transferenciaRecebida) {
              // debugPrint('chegou no then do Future');
              // debugPrint('$transferenciaRecebida');
              if (transferenciaRecebida != null) {
                setState(
                  () {
                    widget._transferencias.add(transferenciaRecebida);
                  },
                );
              }
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Card(
      child: ListTile(
        tileColor: Colors.white70,
        leading: Icon(Icons.monetization_on),
        title: Text(
          'valor: ' + _transferencia.valor.toString(),
        ),
        subtitle: Text(
          'conta: ' + _transferencia.numeroConta.toString(),
        ),
      ),
    );
  }
}
