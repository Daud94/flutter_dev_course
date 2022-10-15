import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Column(
          children: [
            Expanded(child: Row(
              children: [
                Expanded(child: ReusableCard(Color(0xFF0a0e21))),
                Expanded(child: ReusableCard(Color(0xFF0a0e21)))
              ],
            )),
            Expanded(child: ReusableCard(Color(0xFF0a0e21))),
            Expanded(child: Row(
                children: [
                  Expanded(child: ReusableCard(Color(0xFF0a0e21))),
                  Expanded(child: ReusableCard(Color(0xFF0a0e21)))
                ],
            ))
          ],
        )
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color colour;

  ReusableCard(this.colour, {super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
    );
  }
}
