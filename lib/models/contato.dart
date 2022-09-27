class Contato {
  final String nome;
  final String endereco;
  final String telefone;
  final String email;
  final String cpf;

  Contato(
      this.nome,
      this.endereco,
      this.telefone,
      this.email,
      this.cpf
      );
  @override
  String toString() {
    return 'Contato{nome: $nome, endereco: $endereco, $telefone, $email, $cpf}';
  }
}