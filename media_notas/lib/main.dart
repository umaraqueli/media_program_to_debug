import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController notaController = TextEditingController();
  List<double> notas = [];
  double media = 0;

  void calcularMedia() {
    String notaText = notaController.text;
    if (notaText.isNotEmpty) {
      double nota = double.parse(notaText);
      notas.add(nota);
      double soma = 0;

      for (double nota in notas) {
        soma += nota;

        media = soma / notas.length;
      }

      setState(() {
        notaController.clear();
      });
    }
  }

  void limparNotas() {
    notas.clear();
    media = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de Média'),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Digite as notas e clique em Calcular Média:',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                Text(
                  'As notas devem ser digitadas uma a uma. Digita, clica em Calcular Media, digita a próxima..',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: notaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      prefixIcon: Icon(Icons.school),
                      hintText: 'Digite uma nota. Ex: 20.52 ou 20'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: calcularMedia,
                  child: Text('Calcular Média'),
                ),
                SizedBox(height: 16),
                Text('Notas: ${notas.toString()}'),
                Text('Média: $media'),
                SizedBox(height: 16),
                if (media < 60.0)
                  Text(
                    'Aluno reprovado!',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                else
                  Text(
                    'Aluno aprovado!',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ElevatedButton(
                  onPressed: limparNotas,
                  child: Text('Limpar Notas'),
                ),
              ],
            ),
          ),
        )));
  }
}
