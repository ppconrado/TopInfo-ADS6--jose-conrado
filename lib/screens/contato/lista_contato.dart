import 'package:flutter/material.dart';
import '../../models/contato.dart';
import 'formulario_contato.dart';

const _tituloAppBar = 'Lista de Contatos';

class ListaContato extends StatefulWidget {
  final List<Contato> _contatos = [];
  ListaContato({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaContatoState();
  }
}

class ListaContatoState extends State<ListaContato> {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(_tituloAppBar),
        backgroundColor: Colors.green,
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      body: ListView.builder(
        itemCount: widget._contatos.length,
        itemBuilder: (context, indice) {
          final contato = widget._contatos[indice];
          return ItemContato(contato);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Contato?> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioContato();
              },
            ),
          );
          future.then(
            (contatoRecebida) {
              // debugPrint('chegou no then do Future');
              // debugPrint('$contatoRecebida');
              if (contatoRecebida != null) {
                setState(
                  () {
                    widget._contatos.add(contatoRecebida);
                  },
                );
              }
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class ItemContato extends StatelessWidget {
  final Contato _contato;

  const ItemContato(this._contato, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return GestureDetector(
      child: Card(
        child: ListTile(
          tileColor: Colors.white70,
          leading: Icon(Icons.person),
          title: Text(
            'nome:     ' + _contato.nome,
          ),
          subtitle:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('endereco: ' + _contato.endereco),
            Text('telefone:   ' + _contato.telefone),
            Text('e-mail:       ' + _contato.email),
            Text('cpf:            ' + _contato.cpf),
          ]),
        ),
      ),
    );
  }
}
