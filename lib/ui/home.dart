import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";

  void handleRadioValueChange(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattedText = "Your Weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText = "Your Weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText = "Your Weight on Venus is ${_finalResult.toStringAsFixed(1)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("weight on planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              'img/planet.png',
              height: 133.1,
              width: 200.1,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Your weight on earth',
                      hintText: 'in pounds',
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  //three radio buttons
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //radio buttons
                      new Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChange),
                      new Text(
                        "Pluto",
                        style: new TextStyle(color: Colors.white),
                      ),

                      new Radio<int>(
                          activeColor: Colors.redAccent,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChange),
                      new Text(
                        "Mars",
                        style: new TextStyle(color: Colors.white),
                      ),

                      new Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChange),
                      new Text(
                        "Venus",
                        style: new TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(15.6)),
                  //result Text
                  new Text(
                    _weightController.text.isEmpty ? "Please enter weight" : _formattedText + "lbs",
                    //"$_formattedText lbs",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      print("wrong");
      return int.parse("180") * 0.38;
    }
  }
}
