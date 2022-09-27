import 'package:flutter/material.dart';
import '../../components/editor.dart';
import '../../models/contato.dart';

const _tituloAppBar = 'Cadastro de Contatos';

const _rotuloCampoNome = 'nome';
const _dicaCampoNome = 'nome';

const _rotuloCampoEndereco = 'endereço';
const _dicaCampoEndereco = 'endereço';

const _rotuloCampoTelefone = '(00)00000-0000';
const _dicaCampoTelefone = '(00)00000-0000';

const _rotuloCampoEmail = 'e-mail';
const _dicaCampoEmail = 'e-mail';

const _rotuloCampoCpf = 'cpf';
const _dicaCampoCpf = 'cpf';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioContato extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioContatoState();
  }
}

class FormularioContatoState extends State<FormularioContato> {
  // Controllers
  final TextEditingController _controladorCampoNome = TextEditingController();
  final TextEditingController _controladorCampoEndereco =
      TextEditingController();
  final TextEditingController _controladorCampoTelefone =
      TextEditingController();
  final TextEditingController _controladorCampoEmail = TextEditingController();
  final TextEditingController _controladorCampoCpf = TextEditingController();
  //
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
          backgroundColor: Colors.green,
          titleTextStyle: const TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Editor(
                controlador: _controladorCampoNome,
                rotulo: _rotuloCampoNome,
                dica: _dicaCampoNome,
                icone: Icons.person,
                isText: true,
              ),
              Editor(
                controlador: _controladorCampoEndereco,
                rotulo: _rotuloCampoEndereco,
                dica: _dicaCampoEndereco,
                icone: Icons.mail,
                isText: true,
              ),
              Editor(
                controlador: _controladorCampoTelefone,
                rotulo: _rotuloCampoTelefone,
                dica: _dicaCampoTelefone,
                icone: Icons.phone,
                isText: false,
              ),
              Editor(
                controlador: _controladorCampoEmail,
                rotulo: _rotuloCampoEmail,
                dica: _dicaCampoEmail,
                icone: Icons.alternate_email,
                isText: true,
              ),
              Editor(
                controlador: _controladorCampoCpf,
                rotulo: _rotuloCampoCpf,
                dica: _dicaCampoCpf,
                icone: Icons.perm_identity,
                isText: false,
              ),
              ElevatedButton(
                child: Text(_textoBotaoConfirmar),
                onPressed: () {
                  _criaContato(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _criaContato(context) {
    // debugPrint('clicou no confirmar');
    final String? nome = _controladorCampoNome.text;
    final String? endereco = _controladorCampoEndereco.text;
    final String? telefone = _controladorCampoTelefone.text;
    final String? email = _controladorCampoEmail.text;
    final String? cpf = _controladorCampoCpf.text;
    if (nome!.isNotEmpty &&
        endereco!.isNotEmpty &&
        telefone!.isNotEmpty &&
        email!.isNotEmpty &&
        cpf!.isNotEmpty) {
      // final Future<Contato> future =
      final contatoCriada = Contato(
        nome,
        endereco,
        telefone,
        email,
        cpf,
      );
      // debugPrint('Criando contato');
      // debugPrint('$ContatoCriada');
      Navigator.pop(context, contatoCriada);
    }
  }
}
