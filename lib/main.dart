import 'package:flutter/material.dart'; //puxando os widgets que serão usados para a construção do app

void main() {
  //sempre começar com essa função.
  runApp(new MaterialApp(
      //new não é necessário.
      title: 'Contador de Pessoas', //title é um parametro do material app.
      home: Home())); //Classe Home
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _people = 0;
  late String _infoText = "Pode Entrar!";

  void _changePeople(int x) {
    setState(() {
      _people += x;

      if (_people == 0) {
        _infoText = "Pode Entrar!";
      } else if(_people < 0) {
        _infoText = "Negativo?";
      } else if (_people < 10) {
        _infoText = "Pode Entrar!";
      } else if (_people >= 10) {
        _people = 10;
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "images/restaurant.jpg",
        fit: BoxFit.cover,
        height: 1000.0,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Pessoas: $_people",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                  child: Text("+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white)),
                  onPressed: () {
                    _changePeople(1);
                  },
                )),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                  child: Text("-1",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                      )),
                  onPressed: () {
                    _changePeople(-1);
                  },
                )),
          ]),
          Text(
            _infoText,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          )
        ],
      )
    ]);
  }
}
