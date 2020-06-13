
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Calculater();
  }
}

class Calculater extends State<MyApp> {
  // key to check the stats of widgets
  var _keyForm=GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  // parametar of drop down button
  var _DropDownButtonItems = ['First', 'Second', 'Third'];
  var _currentValueSelected = 'First';
  // TextEditingControllers
  TextEditingController feild1  = TextEditingController();
  TextEditingController feild2 = TextEditingController();
  TextEditingController feild3 = TextEditingController();
  var displayResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade500,
        title: Text(
          'Baisc Calculater',
        ),
      ),
      body: Form(
        key: _keyForm,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(
                15
              ),
              child: Center(
                child: Image.asset(
                  'images/dollar.png',
                  height: 200,
                  color: Colors.lightGreen.shade900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(

                validator: (String userInput){
                  if(userInput.isEmpty){

                    return 'Pleas enter a value';
                  }

                },

                controller: feild1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    hintText: 'e.g.10900',
                    labelText: 'First Value'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: feild2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'e.g.1900',
                  labelText: 'Second Value',

                ),
                validator: (String userInput){

                  if(userInput.isEmpty){

                    return 'Pleas enter a value';
                  }
                },
                keyboardType: TextInputType.number,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: feild3,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: '####',
                          labelText: 'CODE',),
                      keyboardType: TextInputType.number,
                      validator: (String userInput){

                        if(userInput.isEmpty){

                          return 'Pleas enter a value';
                        }
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, top: 8.0, right: 70),
                    child: DropdownButton<String>(
                      items:
                          // ignore: non_constant_identifier_names
                          _DropDownButtonItems.map((String DropdownStringButton) {
                        return DropdownMenuItem<String>(
                          value: DropdownStringButton,
                          child: Text(DropdownStringButton),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        execute(newValueSelected);
                      },
                      value: _currentValueSelected,
                      elevation: 8,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text(
                        'Calculate',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      color: Colors.deepPurple.shade500,
                      textColor: Colors.white,
                      onPressed: () {

                        setState(() {
                          if(_keyForm.currentState.validate()){

                          this.displayResult = _Calculate();
                        }});
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text(
                        'Reset',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        setState(() {
                          _reset();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(81.0),
              child: Center(
                  child: Text(
                displayResult,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple.shade500,
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }

  void execute(String newValueSelected) {
    return setState(
      () {
        this._currentValueSelected = newValueSelected;
      },
    );
  }

  String _Calculate() {
    double value1 = double.parse(feild1.text);
    double value2 = double.parse(feild2.text);
    int value3 = int.parse(feild3.text);
    double totalValue = value1 + value2 + value3;
    String result =
        'Your Number Is $totalValue With $_currentValueSelected Code $value3 ';
    return result;
  }

  _reset() {
    feild1.text = '';
    feild2.text = '';
    feild3.text = '';
    displayResult = '';
  }
}
