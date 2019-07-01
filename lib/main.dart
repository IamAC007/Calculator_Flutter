import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = '0';

  String _output="0";
  double num1= 0.0;
  double num2=0.0;
  String operand="";

  buttonpressed(String number) {
   if (number == 'CLEAR')
    {
      _output="0";
      num1=0.0;
      num2=0.0;
      operand="";
    }
    else if (number == "+" || number == "-" || number == "X" || number == "/")
    {
      num1=double.parse(output);
      operand= number;
      _output="0";
    }
    else if (number == ".")
    {
      if (_output.contains(".")){
        print('Already Exicts');
        return;
      }
      else 
      _output =_output + number ;
     
      
    }
    else if (number == "=")
    {
      num2=double.parse(output);
      
      if (operand == "+"){
        _output = (num1 + num2).toString();
      }
      if (operand == "X"){
        _output = (num1 * num2).toString();
      }
      if (operand == "/"){
        _output = (num1 / num2).toString();
      }
      if (operand == "-"){
        _output =(num1 - num2).toString();
      }

      num1=0.0;
      num2=0.0;
      

    }
    else 
    { _output = _output + number;}
   
    print(_output);

    setState(() {
     output=double.parse(_output).toStringAsFixed(2); 
    });


  }

  Widget buildbutton(String number) {
    return new Expanded(
      child: new OutlineButton(
        padding: EdgeInsets.all(20.0),
        child: Text(
          number,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonpressed(number)        ,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            child: new Column(
          children: <Widget>[
            new Container(
                alignment: Alignment.centerRight,
                padding:
                    new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: new Text(
                  output,
                  style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                )),
            new Expanded(
              child: new Divider(),
            ),
            new Column(
              children: [
                new Row(
                  children: [
                    buildbutton('7'),
                    buildbutton('8'),
                    buildbutton('9'),
                    buildbutton('/')
                  ],
                ),
                new Row(
                  children: [
                    buildbutton('4'),
                    buildbutton('5'),
                    buildbutton('6'),
                    buildbutton('X')
                  ],
                ),
                new Row(
                  children: [
                    buildbutton('1'),
                    buildbutton('2'),
                    buildbutton('3'),
                    buildbutton('-')
                  ],
                ),
                new Row(
                  children: [
                    buildbutton('.'),
                    buildbutton('0'),
                    buildbutton('00'),
                    buildbutton('+')
                  ],
                ),
                new Row(
                  children: [
                    buildbutton('CLEAR'),
                    buildbutton('='),
                  ],
                )
              ],
            )
          ],
        )));
  }
}
