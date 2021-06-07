import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double i = 0.0;
  final TextEditingController _weight = new TextEditingController();
  double _finalRes = 0.0;
  int radioValue = 0;
  String format = "";
  final form = GlobalKey<FormState>();

  void _switch() {
    switch (radioValue) {
      case 0:
        _finalRes = calcWeight(_weight.text, 0.06);
        format = "Your Weight on Pluto ${_finalRes.toStringAsFixed(1)}";
        break;

      case 1:
        _finalRes = calcWeight(_weight.text, 0.38);
        format = "Your Weight on Mars ${_finalRes.toStringAsFixed(1)}";
        break;
      case 2:
        _finalRes = calcWeight(_weight.text, 0.91);
        format = "Your Weight on Venus ${_finalRes.toStringAsFixed(1)}";
        break;
    }
  }

  void handleRadioValueChanged(int value) {
    if (form.currentState.validate()) {
      setState(() {
        radioValue = value;

        _switch();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("walid and hala"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
          alignment: Alignment.center,
          child: ListView(
            padding: const EdgeInsets.all(2.5),
            children: <Widget>[
              Image.asset(
                'images/2.1 planet.png.png',
                width: 133,
                height: 200,
              ),
              new Container(
                margin: const EdgeInsets.all(3.0),
                alignment: Alignment.center,
                child: Form(
                  key: form,
                  child: Column(
                    children: <Widget>[
                      new Theme(
                        data: ThemeData(primaryColor: Colors.cyan),
                        child: TextFormField(
                          style: TextStyle(color: Colors.cyanAccent),
                          controller: _weight,
                          keyboardType: TextInputType.number,
                          onEditingComplete: () {
                            if (form.currentState.validate()) {
                              setState(() {
                                _switch();
                              });
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "Your Weight on Earth",
                              labelStyle: TextStyle(color: Colors.cyan),
                              hintText: "In Kelo Grams",
                              prefixIcon: new Icon(
                                Icons.person,
                                color: Colors.cyan,
                              ),
                              suffixText: "KG",
                              suffixStyle: TextStyle(color: Colors.cyan),
                              border: OutlineInputBorder(
                                gapPadding: 4,
                                borderRadius: BorderRadius.circular(4),
                              )),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter a number!";
                            } else {
                              print("done");
                            }
                          },
                        ),
                      ),
                      Padding(padding: new EdgeInsets.all(5.0)),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //radio buttons
                          new Radio<int>(
                              activeColor: Colors.yellow,
                              value: 0,
                              groupValue: radioValue,
                              onChanged: handleRadioValueChanged),
                          new Text(
                            "Pluto",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          new Radio<int>(
                              activeColor: Colors.orange,
                              value: 1,
                              groupValue: radioValue,
                              onChanged: handleRadioValueChanged),
                          new Text(
                            "Mars",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          new Radio<int>(
                              activeColor: Colors.deepOrange,
                              value: 2,
                              groupValue: radioValue,
                              onChanged: handleRadioValueChanged),
                          new Text(
                            "Venus",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "$format KG",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  double calcWeight(String weight, double m) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * m;
    } else {
      print("Wrong");
      return int.parse("180") * 0.38;
    }
  }
}
