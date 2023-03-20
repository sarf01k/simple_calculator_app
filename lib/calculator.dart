import 'package:flutter/material.dart';

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.greenAccent,
              )
            ),
            Container(
              padding: EdgeInsets.only(top: 30, right: 18, left: 18, bottom: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45)
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      button(),button(),button(),button()
                    ],
                  ),
                  Row(
                    children: [
                      button(),button(),button(),button()
                    ],
                  ),
                  Row(
                    children: [
                      button(),button(),button(),button()
                    ],
                  ),
                  Row(
                    children: [
                      button(),button(),button(),button()
                    ],
                  ),
                  Row(
                    children: [
                      button(),button(),button(),button()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

    Widget button(){
      return Expanded(
        child: Container(
          margin: EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 22),
              backgroundColor: Color(0xFF354249)
            ),
            onPressed: (){},
            child: Text(
              "1",
              style: TextStyle(fontSize: 25),
            )),
        )
      );
    }
}