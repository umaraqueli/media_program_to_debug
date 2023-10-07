void main(List<String> arguments) {
  List<double> notas = [7.5, 8.0, 9.5, 6.0];
  double soma = 0;
  double media = 0;
  for (double nota in notas) {
    soma = nota;
  }

  media = soma / notas.length;

  print('A média é: $media');

  if (media < 6.0) {
    print('Aluno aprovado!');
  } else {
    print('Aluno reprovado!');
  }
}
