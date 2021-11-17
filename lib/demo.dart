import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}
class _DemoState extends State<Demo> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  ThemeData dN = ThemeData.light();
  double _result=0;

  buttonPressed(String inputText){
    if(inputText == "DARK"){
      setState(() {
        dN = ThemeData.dark();
      });
    }else{
      setState(() {
        dN = ThemeData.light();
      });
    }
  }

  Widget theButton(String inputText){
    return ElevatedButton(
      child: Text(inputText,
        style: const TextStyle(
          fontSize: 12.0,
          //fontWeight: FontWeight.bold,
          //color: Colors.black
        ),
      ),
      onPressed: () =>
          buttonPressed(inputText),
      style: ElevatedButton.styleFrom(
        //primary: Colors.black12,
          padding: const EdgeInsets.all(15.0)
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: dN,
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'height in cm',
                  icon: Icon(Icons.trending_up),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'weight in kg',
                  icon: Icon(Icons.line_weight),
                ),
              ),
              SizedBox(height: 15),
              RaisedButton(
                //color: Colors.black,
                child: Text(
                  "Calculate",
                  //style: TextStyle(color: Colors.white),
                ),
                onPressed: calculateBMI,
              ),
              SizedBox(height: 15),
              Text(
                _result == null ? "Enter Value" : "${_result.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 19.4,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    theButton("DARK"),
                    theButton("LIGHT")
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;
    _result = result;
    setState(() {});
  }
}