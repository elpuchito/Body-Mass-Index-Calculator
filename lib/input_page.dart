import 'package:bmi/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'results_page.dart';

const bottomContainerHeight = 80;
const activeCardColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);
const inactiveCardColor = Color(0xFF11328);
enum Gender { male, female }
var selectedGender = Gender.male;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 20;

  // var maleColor = inactiveCardColor;
  // var femaleColor = inactiveCardColor;

  // void updateColor(Gender n) {
  //   if (n == Gender.male) {
  //     if (maleColor == inactiveCardColor) {
  //       maleColor = activeCardColor;
  //       femaleColor = inactiveCardColor;
  //     } else {
  //       maleColor = inactiveCardColor;
  //     }
  //   } //female
  //   if (n == Gender.female) {
  //     if (femaleColor == inactiveCardColor) {
  //       femaleColor = activeCardColor;
  //       maleColor = inactiveCardColor;
  //     } else {
  //       femaleColor = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    CalculatorBrain calc = new CalculatorBrain(weight: weight, height: height);
    return Scaffold(
      appBar: AppBar(
        title: Text('Indice de Masa Corporal'.toUpperCase()),
      ),
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('IMC'),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
                color: Color(0xFFEB1555),
              ),
            ),
            Container(
              color: Color(0xFF0A0E21),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Acerca de mi', style: TextStyle(fontSize: 20)),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                        child: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'HOMBRE',
                        ),
                        colour: selectedGender == Gender.male
                            ? activeCardColor
                            : inactiveCardColor),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                        colour: selectedGender == Gender.female
                            ? activeCardColor
                            : inactiveCardColor,
                        child: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'MUJER ',
                        )),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            colour: activeCardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ALTURA',
                  style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
                  textAlign: TextAlign.center,
                ),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      height.toString(),
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    Text('cm',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ))
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x25EB1555),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 18),
                      thumbColor: Color(0xFFEB1555)),
                  child: Slider(
                    value: height.toDouble(),
                    onChanged: (newvalue) {
                      setState(() {
                        height = newvalue.round();
                      });
                    },
                    min: 120,
                    max: 200,
                  ),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PESO',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        weight.toString(),
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Listener(
                            onPointerDown: (details) {
                              _buttonPressed = true;
                              _decreaseWeightWhilePressed();
                            },
                            onPointerUp: (details) {
                              _buttonPressed = false;
                            },
                            child: RoundButton(
                              // onPressed: () {
                              //   setState(() {
                              //     weight--;
                              //   });
                              // },
                              icon: FontAwesomeIcons.minus,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Listener(
                            onPointerDown: (details) {
                              _buttonPressed = true;
                              _increaseWeightWhilePressed();
                            },
                            onPointerUp: (details) {
                              _buttonPressed = false;
                            },
                            child: RoundButton(
                              // onPressed: () {
                              //   setState(() {
                              //     weight++;
                              //   });
                              // },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                        colour: activeCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'EDAD',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              age.toString(),
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        ))),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              calc.calculateBmi();
              calc.getInterpretation();

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResult: calc.calculateBmi(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                color: bottomContainerColor,
              ),
              height: bottomContainerHeight.toDouble(),
              width: double.infinity,
              child: Center(
                child: Text(
                  'CALCULAR IMC',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool isPressed = false;
  bool _buttonPressed = false;
  bool _loopActive = false;

//increase while press function
  void _increaseWeightWhilePressed() async {
    // make sure that only one loop is active
    if (_loopActive) return;

    _loopActive = true;

    while (_buttonPressed) {
      // do your thing
      setState(() {
        weight++;
      });

      // wait a bit
      await Future.delayed(Duration(milliseconds: 100));
    }

    _loopActive = false;
  }

  void _decreaseWeightWhilePressed() async {
    if (_loopActive) return;

    _loopActive = true;

    while (_buttonPressed) {
      setState(() {
        weight--;
      });

      await Future.delayed(Duration(milliseconds: 100));
    }

    _loopActive = false;
  }
}

class RoundButton extends StatelessWidget {
  RoundButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 60,
        height: 60,
      ),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
