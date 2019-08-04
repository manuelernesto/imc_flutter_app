import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _info = "Informe seus dados";
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  GlobalKey<FormState> _formkey =  GlobalKey();

  void _resetFields() {
    _weightController.clear();
    _heightController.clear();
    setState(() {
      _info = "Informe seus dados";
    });
  }

  void _calc() {


    double imc = double.parse(_weightController.text) /(
        double.parse(_weightController.text) *
        double.parse(_weightController.text));

    setState(() {
      _info = "O seu IMC = ${imc.toStringAsPrecision(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("IMC Flutter App"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields)
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 120,
                color: Colors.green,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso(Kg)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
                controller: _weightController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura(Cm)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
                controller: _heightController,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: _calc,
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      color: Colors.green,
                    )),
              ),
              Text(
                _info,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
              )
            ],
          ),
        ));
  }
}
