import 'package:money2/money2.dart';

class Transferencia {
  final Money valor;
  final int numeroConta;

  Transferencia(
    this.valor,
    this.numeroConta,
  );
  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

