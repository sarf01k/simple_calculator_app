import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {

  var input = "";
  var output = "";
  var operation = "";

  onButtonClick(value) {
    if (value == "C") {
      input = "";
    }
    else if (value == "⌫") {
      if (input.isNotEmpty) {
      input = input.substring(0, input.length - 1);
      }
    }
    else if (value == "=") {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput= input.replaceAll("x", "*");
        userInput= input.replaceAll("÷", "/");
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length -2);
        }
        input = output;
      }
    }
    else {
      input = input + value;
    }

    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            input,
            style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          SizedBox(height: 5,),
          Text(
            output,style: TextStyle(fontSize: 36, color: Colors.grey.withOpacity(0.7), fontWeight: FontWeight.bold),),
          SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.only(top: 30, right: 18, left: 18, bottom: 0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Color(0xFF222222),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    button(text: "C", buttonBgColor: Color(0xFF434242), textColor: Colors.green),
                    button(text: "%", buttonBgColor: Color(0xFF434242), textColor: Colors.green),
                    button(text: "⌫", buttonBgColor: Color(0xFF434242), textColor: Colors.green),
                    button(text: "÷", buttonBgColor: Color(0xFF434242), textColor: Colors.red)
                  ],
                ),
                Row(
                  children: [
                    button(text: "7", buttonBgColor: Color(0xFF434242),),
                    button(text: "8", buttonBgColor: Color(0xFF434242),),
                    button(text: "9", buttonBgColor: Color(0xFF434242),),
                    button(text: "x", buttonBgColor: Color(0xFF434242), textColor: Colors.red)
                  ],
                ),
                Row(
                  children: [
                    button(text: "4", buttonBgColor: Color(0xFF434242),),
                    button(text: "5", buttonBgColor: Color(0xFF434242),),
                    button(text: "6", buttonBgColor: Color(0xFF434242),),
                    button(text: "-", buttonBgColor: Color(0xFF434242), textColor: Colors.red)
                  ],
                ),
                Row(
                  children: [
                    button(text: "1", buttonBgColor: Color(0xFF434242),),
                    button(text: "2", buttonBgColor: Color(0xFF434242),),
                    button(text: "3", buttonBgColor: Color(0xFF434242),),
                    button(text: "+", buttonBgColor: Color(0xFF434242), textColor: Colors.red)
                  ],
                ),
                Row(
                  children: [
                    button(text: "⁺⁄₋", buttonBgColor: const Color(0xFF434242),),
                    button(text: "0", buttonBgColor: Color(0xFF434242),),
                    button(text: ".", buttonBgColor: const Color(0xFF434242),),
                    button(text: "=", buttonBgColor: const Color(0xFF434242), textColor: Colors.red)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

    Widget button({text, buttonBgColor = const Color(0xFF434242), textColor = Colors.white}) {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 22),
              backgroundColor: buttonBgColor
            ),
            onPressed: () => onButtonClick(text),
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 25, fontWeight: FontWeight.bold),
            )
          ),
        )
      );
    }
}