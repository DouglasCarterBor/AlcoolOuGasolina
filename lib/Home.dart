import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

void _calcular () {
  double precoAlcool = double.tryParse(_controllerAlcool.text);
  double precoGasolina = double.tryParse(_controllerGasolina.text);


  if (precoAlcool == null || precoGasolina == null) {
    setState(() {
      _textoResultado = "Número inválido, digite números maiores que 0 e utilizando (.)";
    });
  } else {
if((precoAlcool / precoGasolina) >= 0.7){
setState(() {
  _textoResultado = "Melhor abastecer com gasolina";
});
}else{
  setState(() {
    _textoResultado = "Melhor abastecer com Álcool";
  });
}
_limparCampos();
  }
}
void _limparCampos(){
  _controllerAlcool.text = "";
  _controllerGasolina.text = "";
}

  var _logo = AssetImage("images/logo3.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Text("Gasolina ou Álcool", style: TextStyle(color: Colors.black,
        fontSize: 25),),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.black,

        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Image(image: _logo,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: Text(
                  "Saiba qual a melhor opção para o abastecimento do seu carro.",
                  style: TextStyle(
                    //color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  //icon: Icon(Icons.) descobrir como colocar icone de R$
                  labelText: "   Preço Gasolina",
                  hintText: "0.00",
                  hintStyle: TextStyle(
                    color: Colors.redAccent,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.redAccent,//cor da label
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: BorderSide(
                        color: Colors.red
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  labelText: "   Preço Álcool",
                  hintText: "0.00",
                  hintStyle: TextStyle(
                    color: Colors.green,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.green,//cor da label
                  ),
                ),
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
                controller: _controllerAlcool,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side: BorderSide(color: Colors.white)),
                  color: Colors.white,
                  textColor: Colors.black,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
