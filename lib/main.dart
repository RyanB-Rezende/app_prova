import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Determinador de Fase da Vida',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controller = TextEditingController();
  String resultado = '';
  String erro = '';

  // Função para determinar a fase da vida
  String determinarFaseDaVida(int idade) {
    if (idade < 3) {
      return "Infância";
    } else if (idade >= 3 && idade <= 12) {
      return "Pré-adolescência";
    } else if (idade >= 13 && idade <= 19) {
      return "Adolescência";
    } else if (idade >= 20 && idade <= 35) {
      return "Juventude";
    } else if (idade >= 36 && idade <= 55) {
      return "Meia-idade";
    } else {
      return "Terceira idade";
    }
  }

  void _calcularFaseDaVida() {
    setState(() {
      erro = '';
      resultado = '';
      int? idade = int.tryParse(controller.text);

      if (idade == null || idade < 0) {
        erro = 'Por favor, insira um Numero válido';
      } else {
        resultado = determinarFaseDaVida(idade);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Determinador de Fase da Vida',
          style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onSubmitted: (value) => determinarFaseDaVida,
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Digite sua idade',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcularFaseDaVida,
                child: const Text('Ver Sua Fase'),
              ),
              const SizedBox(height: 20),
              Text(
                resultado,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
