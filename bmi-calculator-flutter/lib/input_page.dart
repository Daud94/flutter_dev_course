import 'package:bmi_calculator_flutter/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xff060814);
const bottomContainerColor = Colors.pink;
const inactiveCardColor = Color(0xFF0a0e21);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                            gender = Gender.male;
                        });
                      },
                        colour: gender == Gender.male? activeCardColor : inactiveCardColor,
                        cardChild : const IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ))),
                Expanded(
                    child: ReusableCard(
                      onPress: (){
                        gender = Gender.female;
                      },
                        colour: gender == Gender.female? activeCardColor : inactiveCardColor,
                        cardChild: const IconContent(
                            icon: FontAwesomeIcons.venus, label: 'FEMALE')))
              ],
            )),
            Expanded(child: ReusableCard(activeCardColor)),
            Expanded(
                child: Row(
              children: [
                Expanded(child: ReusableCard(activeCardColor)),
                Expanded(child: ReusableCard(activeCardColor))
              ],
            )),
            Container(
              color: bottomContainerColor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}
