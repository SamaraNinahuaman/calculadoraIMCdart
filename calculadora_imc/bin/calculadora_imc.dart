import 'package:calculadora_imc/pessoa.dart';
import 'dart:io';
import 'dart:math' as math;

void main() {
  print("CALCULADORA IMC");

  print("Digite o nome:");
  final String nome = stdin.readLineSync() as String;

  print("Digite o peso:");
  final double peso = double.tryParse(stdin.readLineSync().toString()) ?? 0;

  print("Digite a altura:");
  final double altura = double.tryParse(stdin.readLineSync().toString()) ?? 0;

  Pessoa pessoa = Pessoa(nome: nome, peso: peso, altura: altura);

  final double result = MathUtils.calcularIMC(pessoa);

  if (result < 16) {
    print("IMC:$result: Magreza Grave");
  } else if (result >= 16 && result < 17) {
    print("IMC:$result: Magreza Moderada");
  } else if (result >= 17 && result < 18.5) {
    print("IMC:$result: Magreza Leve");
  } else if (result >= 18.5 && result < 25) {
    print("IMC:$result: Saudável");
  } else if (result >= 25 && result < 30) {
    print("IMC:$result: Sobrepeso");
  } else if (result >= 30 && result < 35) {
    print("IMC:$result: Obesidade Grau I");
  } else if (result >= 35 && result < 40) {
    print("IMC:$result: Obesidade Grau II Severa");
  } else {
    print("IMC:$result: Obesidade Grau III Mórbida");
  }
}

class MathUtils {
  static double calcularIMC(Pessoa pessoa) {
    return(pessoa.peso / math.pow(pessoa.altura, 2));
  }
}
