import 'package:flutter/material.dart';

void main() => runApp(MyCaculatorApp());
class MyCaculatorApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'My caculator',
      home: MyCaculator()
    );
  }
  }
class MyCaculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> Caculator();

}
class Caculator extends State<MyCaculator>{
  final controller_numA = TextEditingController();
  final controller_numB = TextEditingController();
  final my_form_key = GlobalKey<FormState>();
  String texttoShow ="";
  //create function sum
  void sum(){
    //validate form
    if(my_form_key.currentState.validate())
      {
        int numberA = int.parse(controller_numA.text);
        int numberB = int.parse(controller_numB.text);
        int result = numberA + numberB;
        setState(() {
          texttoShow="$numberA + $numberB = $result";
        });
      }
  }
  void minus(){
    //validate form
    if(my_form_key.currentState.validate())
    {
      int numberA = int.parse(controller_numA.text);
      int numberB = int.parse(controller_numB.text);
      int result = numberA - numberB;
      setState(() {
        texttoShow="$numberA - $numberB = $result";
      });
    }
  }
  void Multi(){
    //validate form
    if(my_form_key.currentState.validate())
    {
      int numberA = int.parse(controller_numA.text);
      int numberB = int.parse(controller_numB.text);
      int result = numberA * numberB;
      setState(() {
        texttoShow="$numberA * $numberB = $result";
      });
    }
  }
  void Devide(){
    //validate form
    if(my_form_key.currentState.validate())
    {
      int numberA = int.parse(controller_numA.text);
      int numberB = int.parse(controller_numB.text);
      double result = numberA / numberB;
      setState(() {
        texttoShow="$numberA / $numberB = $result";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // create layout

    return new Scaffold(body: Form(key:my_form_key,child:
    Column(mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      TextFormField(
        controller: controller_numA,
        validator: (value){
          if(value.isEmpty) return "Please enter number";
        },
        decoration: InputDecoration(hintText: "Enter Number"),
        keyboardType: TextInputType.number,
      ),
      TextFormField(
      controller: controller_numB,
      validator: (value){
        if(value.isEmpty) return "Please enter number";
      },
      decoration: InputDecoration(hintText: "Enter Number"),
      keyboardType: TextInputType.number,
    ),
      //create result
      Text(texttoShow,style: TextStyle(fontSize: 20.0),),
      //create 4 button
      Row(
        mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
          RaisedButton(onPressed: sum,child: Text('+'),),
        RaisedButton(onPressed: minus,child: Text('-'),),
        RaisedButton(onPressed: Multi,child: Text('*'),),
        RaisedButton(onPressed: Devide,child: Text('/'),),
      ],
      )

    ],)
    ),

    );
  }

}



