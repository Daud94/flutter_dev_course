import 'package:bmi_calculator_flutter/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';

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
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            gender = Gender.male;
                          });
                        },
                        colour: gender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: const IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ))),
                Expanded(
                    child: ReusableCard(
                        onPress: () {
                          gender = Gender.female;
                        },
                        colour: gender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: const IconContent(
                            icon: FontAwesomeIcons.venus, label: 'FEMALE')))
              ],
            )),
            Expanded(
                child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('$height', style: kNumberTextStyle),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xff8de98),
                        thumbColor: Color(0xFFeb1555),
                        overlayColor: Color(0x29eb1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 120.0,
                      max: 220.0,
                    ),
                  )
                ],
              ),
              onPress: () {},
            )),
            Expanded(
                child: Row(
              children: [
                // WEIGHT CONTAINER
                Expanded(
                    child: ReusableCard(
                  onPress: () {},
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIcon(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          RoundIcon(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                weight--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )
                ),
                // AGE CONTAINER
                Expanded(
                    child: ReusableCard(
                  onPress: () {},
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIcon(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          RoundIcon(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                age--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ))
              ],
            )),
            Container(
              alignment: Alignment.center,
              child: Text('CALCULATE YOUR BMI', style: kLabelTextStyle,),
              color: kBottomContainerColor,
              margin: const EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        ));
  }
}

class RoundIcon extends StatelessWidget {
  const RoundIcon({super.key, required this.icon, required this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: RawMaterialButton(
        onPressed: () {
          onPress();
        },
        child: Icon(
          icon,
          color: Colors.white,
        ),
        elevation: 0.0,
        constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
        shape: CircleBorder(),
        fillColor: Color(0xff4c455e),
      ),
    );
  }
}
