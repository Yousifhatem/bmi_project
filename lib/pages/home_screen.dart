import 'package:bmi_project/constants.dart';
import 'package:bmi_project/pages/result_screen.dart';
import 'package:bmi_project/utilies/bmi_brain.dart';
import 'package:bmi_project/widgets/button_widget.dart';
import 'package:bmi_project/widgets/my_card.dart';
import 'package:bmi_project/widgets/my_floating_btn.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = false;
  int height = 120;
  int weight = 60;
  int age = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATION',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyCard(
                  color: isMale ? kActiveColor : kInActiveColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.male,
                        size: 100,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Male',
                        style: kTitleTextStyle,
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                ),
                MyCard(
                  color: isMale ? kInActiveColor : kActiveColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.female,
                        size: 100,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Female',
                        style: kTitleTextStyle,
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                ),
              ],
            ),
          ),
          MyCard(
            color: kInActiveColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height',
                  style: kTitleTextStyle,
                ),
                const SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '$height',
                        style: kNumTextStyle,
                      ),
                      const TextSpan(
                          text: 'cm', style: TextStyle(fontSize: 22)),
                    ],
                  ),
                ),
                SliderTheme(
                  data: const SliderThemeData(
                    trackHeight: 1,
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xfffd0225),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayColor: Color(0x1ffd0225),
                  ),
                  child: Slider(
                      min: 0,
                      max: 220,
                      inactiveColor: Colors.grey[600],
                      value: height.toDouble(),
                      onChanged: (double val) {
                        setState(() {
                          height = val.round();
                        });
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                MyCard(
                  color: kActiveColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: kTitleTextStyle,
                      ),
                      Text(
                        '$weight',
                        style: kNumTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyFloatingBtn(
                            color: kInActiveColor,
                            icon: Icons.remove,
                            onPressed: () {
                              if (weight > 0) {
                                setState(() {
                                  weight--;
                                });
                              }
                            },
                          ),
                          MyFloatingBtn(
                            color: kInActiveColor,
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                MyCard(
                  color: kActiveColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: kTitleTextStyle,
                      ),
                      Text(
                        '$age',
                        style: kNumTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyFloatingBtn(
                            color: kInActiveColor,
                            icon: Icons.remove,
                            onPressed: () {
                              if (age > 0) {
                                setState(() {
                                  age--;
                                });
                              }
                            },
                          ),
                          MyFloatingBtn(
                            color: kInActiveColor,
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            buttonText: 'Calculate',
            onTap: () {
              BMIBrain bmi = BMIBrain(
                  height: height.toDouble(), weight: weight.toDouble());
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultBMIScreen(
                  bmiResult: bmi.calculateBMI().toStringAsFixed(1),
                  resultText: bmi.checkBMIResult(),
                  interpretation: bmi.getInterpretation(),
                );
              }));
            },
          ),
        ],
      ),
    );
  }
}
