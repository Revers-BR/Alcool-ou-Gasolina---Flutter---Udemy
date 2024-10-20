import 'package:flutter/material.dart';

class Home extends StatefulWidget {

 const Home({super.key});

  @override
  HomeState createState() => HomeState(); 
}

class HomeState extends State<Home> {

  final TextEditingController _alcoolController = TextEditingController();
  final TextEditingController _gasolinaController = TextEditingController();
  var _resultado = "";

  void _calcularValor(){

    var msg = "";
    
    final valorAlcool = double.tryParse(_alcoolController.text );
    final valorGasolina = double.tryParse( _gasolinaController.text);

    if(valorAlcool == null || valorGasolina == null ){
      msg = "Digite valor acima de zero com (.)";
    }else{
      
      msg = (valorAlcool / valorGasolina) >= 0.7 ?
        "Melhor abastecer com Gasolina!":
        "Melhor abastecer com Alcool";
    }
    setState(() {
      _resultado = msg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alcool ou Gasolina"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("imagens/logo.png"),
                const Padding(
                  padding: EdgeInsets.only(top:16, bottom:16),
                  child: Text("Saiba qual melhor opção para abastecimento do seu Carro",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ))
                ),
                TextField(
                  controller: _alcoolController,
                  decoration: const InputDecoration(
                    labelText:"Preço Alcool, ex: 1.50"
                  ),
                ),
                TextField(
                  controller: _gasolinaController,
                  decoration: const InputDecoration(
                    labelText:"Preço Gasolina, ex: 2.00"
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: FilledButton(
                  onPressed: () => _calcularValor(), 
                  child: const Text("Calcular")),
                ),
                Text(_resultado,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ))
            ]
        ),
      ) 
    );
  }
}
