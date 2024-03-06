import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String resultado = "";
  final alturaController = TextEditingController();
  final pesoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: GestureDetector(
        onTap:(){
          FocusScope.of(context).unfocus();
        },
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 0.0),
              width: 300.0,
              height: 300.0,
              child: Image(image: AssetImage("images/classificacao.png")),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 1, 20, 1),
              child: TextField(
                controller: alturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Digite sua altura: ",
                  prefix: Text("Metros: "),
                  labelStyle: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 1, 20, 1),
              child: TextField(
                controller: pesoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Digite seu peso: ",
                  prefix: Text("Kg: "),
                  labelStyle: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              height: 50,
              width: 200,
              child: ElevatedButton(
                child: Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  onPressed: () {
                    double altura = double.parse(alturaController.text);
                    double peso = double.parse(pesoController.text);

                    double imc = peso / (altura * altura);

                    String classificacao;

                    if (imc < 18.5) {
                      classificacao = "Você está abaixo do peso";
                    } else if (imc >= 18.5 && imc < 25) {
                      classificacao = "Peso normal! Parabéns";
                    } else if (imc >= 25 && imc < 30) {
                      classificacao = "Você está levemente acima do peso!";
                    } else if (imc >= 30 && imc < 35) {
                      classificacao = "Eita! Obesidade grau I!";
                    } else if (imc >= 35 && imc < 40) {
                      classificacao = "Xiii! Obesidade grau II (severa)!";
                    } else {
                      classificacao = "Boa sorte! Obesidade grau III (mórbida)";
                    }
                    resultado = "Seu IMC é: ${imc}\nClassificação: $classificacao";
                    setState(() {});

                  }),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Text(
                  resultado,  
                  style: TextStyle(fontSize: 15, color: Colors.lightBlueAccent),
                  ),
              )
              
            ],
         ),
       ),
      ),
    );
  }
}
