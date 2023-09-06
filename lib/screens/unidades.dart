// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

void temas() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: Temas(),
  ));
}

class Temas extends StatefulWidget {
  @override
  _temasState createState() => _temasState();
}

class _temasState extends State<Temas> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/color1.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stepper(
                currentStep: currentStep,
                onStepContinue: () {
                  if (currentStep >= 5) return;
                  setState(() {
                    currentStep++;
                  });
                },
                onStepCancel: () {
                  if (currentStep <= 0) return;
                  setState(() {
                    currentStep--;
                  });
                },
                steps: [
                  Step(
                      title: Text("Unit 1"),
                      content: SizedBox(
                        width: 240,
                        height: 190,
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GradientText(
                                '1-Classroom language',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                                gradientType: GradientType.linear,
                                gradientDirection: GradientDirection.ttb,
                                radius: 2.5,
                                colors: [
                                  Color.fromARGB(255, 170, 63, 233),
                                  Color.fromARGB(255, 66, 91, 233),
                                  Color.fromARGB(255, 60, 135, 221),
                                ],
                              ),
                              SizedBox(height: 5),
                              GradientText(
                                '2-Greetings',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                                gradientType: GradientType.linear,
                                gradientDirection: GradientDirection.ttb,
                                radius: 2.5,
                                colors: [
                                  Color.fromARGB(255, 170, 63, 233),
                                  Color.fromARGB(255, 66, 91, 233),
                                  Color.fromARGB(255, 60, 135, 221),
                                ],
                              ),
                              SizedBox(height: 5),
                              GradientText(
                                '3-The Alphabet',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                                gradientType: GradientType.linear,
                                gradientDirection: GradientDirection.ttb,
                                radius: 2.5,
                                colors: [
                                  Color.fromARGB(255, 170, 63, 233),
                                  Color.fromARGB(255, 66, 91, 233),
                                  Color.fromARGB(255, 60, 135, 221),
                                ],
                              ),
                              SizedBox(height: 5),
                              GradientText(
                                '4-Numbers from 0',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                                gradientType: GradientType.linear,
                                gradientDirection: GradientDirection.ttb,
                                radius: 2.5,
                                colors: [
                                  Color.fromARGB(255, 170, 63, 233),
                                  Color.fromARGB(255, 66, 91, 233),
                                  Color.fromARGB(255, 60, 135, 221),
                                ],
                              ),
                              SizedBox(height: 5),
                              GradientText(
                                'to 20 and phone numbers',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                                gradientType: GradientType.linear,
                                gradientDirection: GradientDirection.ttb,
                                radius: 2.5,
                                colors: [
                                  Color.fromARGB(255, 170, 63, 233),
                                  Color.fromARGB(255, 66, 91, 233),
                                  Color.fromARGB(255, 60, 135, 221),
                                ],
                              ),
                              SizedBox(height: 5),
                              GradientText(
                                '5-Reading email addresses',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                                gradientType: GradientType.linear,
                                gradientDirection: GradientDirection.ttb,
                                radius: 2.5,
                                colors: [
                                  Color.fromARGB(255, 170, 63, 233),
                                  Color.fromARGB(255, 66, 91, 233),
                                  Color.fromARGB(255, 60, 135, 221),
                                ],
                              ),
                              SizedBox(height: 5),
                              GradientText(
                                '6-Basic personal information',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                                gradientType: GradientType.linear,
                                gradientDirection: GradientDirection.ttb,
                                radius: 2.5,
                                colors: [
                                  Color.fromARGB(255, 170, 63, 233),
                                  Color.fromARGB(255, 66, 91, 233),
                                  Color.fromARGB(255, 60, 135, 221),
                                ],
                              ),
                              SizedBox(height: 5),
                              GradientText(
                                '7-Project: Basic introductions',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                                gradientType: GradientType.linear,
                                gradientDirection: GradientDirection.ttb,
                                radius: 2.5,
                                colors: [
                                  Color.fromARGB(255, 170, 63, 233),
                                  Color.fromARGB(255, 66, 91, 233),
                                  Color.fromARGB(255, 60, 135, 221),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                  Step(
                    title: Text("Unit 2"),
                    content: SizedBox(
                        width: 240,
                        height: 200,
                        child: Container(
                            alignment: Alignment.topLeft,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GradientText(
                                    '1-Classroom supplies',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                    ),
                                    gradientType: GradientType.linear,
                                    gradientDirection: GradientDirection.ttb,
                                    radius: 2.5,
                                    colors: [
                                      Color.fromARGB(255, 170, 63, 233),
                                      Color.fromARGB(255, 66, 91, 233),
                                      Color.fromARGB(255, 60, 135, 221),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  GradientText(
                                    '2-Singular and plural nouns(fixed manner)',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                    ),
                                    gradientType: GradientType.linear,
                                    gradientDirection: GradientDirection.ttb,
                                    radius: 2.5,
                                    colors: [
                                      Color.fromARGB(255, 170, 63, 233),
                                      Color.fromARGB(255, 66, 91, 233),
                                      Color.fromARGB(255, 60, 135, 221),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  GradientText(
                                    '3-Colors',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                    ),
                                    gradientType: GradientType.linear,
                                    gradientDirection: GradientDirection.ttb,
                                    radius: 2.5,
                                    colors: [
                                      Color.fromARGB(255, 170, 63, 233),
                                      Color.fromARGB(255, 66, 91, 233),
                                      Color.fromARGB(255, 60, 135, 221),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  GradientText(
                                    '4-Verb be (It is/ They are)',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                    ),
                                    gradientType: GradientType.linear,
                                    gradientDirection: GradientDirection.ttb,
                                    radius: 2.5,
                                    colors: [
                                      Color.fromARGB(255, 170, 63, 233),
                                      Color.fromARGB(255, 66, 91, 233),
                                      Color.fromARGB(255, 60, 135, 221),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  GradientText(
                                    '5.Numbers from 21 to 100',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                    ),
                                    gradientType: GradientType.linear,
                                    gradientDirection: GradientDirection.ttb,
                                    radius: 2.5,
                                    colors: [
                                      Color.fromARGB(255, 170, 63, 233),
                                      Color.fromARGB(255, 66, 91, 233),
                                      Color.fromARGB(255, 60, 135, 221),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  GradientText(
                                    '6-Basic math operations',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                    ),
                                    gradientType: GradientType.linear,
                                    gradientDirection: GradientDirection.ttb,
                                    radius: 2.5,
                                    colors: [
                                      Color.fromARGB(255, 170, 63, 233),
                                      Color.fromARGB(255, 66, 91, 233),
                                      Color.fromARGB(255, 60, 135, 221),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  GradientText(
                                    '7-Basic personal information',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                    ),
                                    gradientType: GradientType.linear,
                                    gradientDirection: GradientDirection.ttb,
                                    radius: 2.5,
                                    colors: [
                                      Color.fromARGB(255, 170, 63, 233),
                                      Color.fromARGB(255, 66, 91, 233),
                                      Color.fromARGB(255, 60, 135, 221),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  GradientText(
                                    '8-Project: Basic introductions',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                    ),
                                    gradientType: GradientType.linear,
                                    gradientDirection: GradientDirection.ttb,
                                    radius: 2.5,
                                    colors: [
                                      Color.fromARGB(255, 170, 63, 233),
                                      Color.fromARGB(255, 66, 91, 233),
                                      Color.fromARGB(255, 60, 135, 221),
                                    ],
                                  ),
                                ]))),
                  ),
                  Step(
                      title: Text("Unit 3"),
                      content: SizedBox(
                          width: 240,
                          height: 135,
                          child: Container(
                              alignment: Alignment.topLeft,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GradientText(
                                      '1-Family members',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '2-Family Tree',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '3-Verb be and subject pronouns',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '4-Extended family members',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '5-Other family members',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '6-Possessie adjectives',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                  ])))),
                  Step(
                      title: Text("Unit 4"),
                      content: SizedBox(
                          width: 240,
                          height: 240,
                          child: Container(
                              alignment: Alignment.topLeft,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GradientText(
                                      '1-Rooms of a house',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '2-Furniture and appliances',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '3-Regular plural nouns',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '4-Describing rooms in a house: There is/are',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '5-There is/are + number + noun',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '6-Common prepositions and prepositional phrases of place',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '7-Questions with is there/are there',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '8-Questions with How many _____ are there?',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                  ])))),
                  Step(
                      title: Text("Unit 5"),
                      content: SizedBox(
                          width: 240,
                          height: 310,
                          child: Container(
                              alignment: Alignment.topLeft,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GradientText(
                                      '1-Project: Describing my house',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '2-Fortifying my skills: Units 3-4',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '3-Daily activities',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      'Days of the week',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '5-Simple present tense: affirmative sentences with I, you, we, they',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '6-Simple present tense: negative sentences and questions with I, you, we, they',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '7-Numbers from 1-100',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '8-Telling the time',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '9-Frequency time expressions',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '10-Connectors of sequence',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '11-Project:Describing my day',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                  ])))),
                  Step(
                      title: Text("Unit 6"),
                      content: SizedBox(
                          width: 240,
                          height: 200,
                          child: Container(
                              alignment: Alignment.topCenter,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GradientText(
                                      '1-Preferences: food, fruit, music genres',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '2-Preferences: pets, hobbies',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '3-Simple present tense (likes/dislikes)',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '4-Asking for preferences',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '5-Project: All about me',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '6-Fortifying my skills: Units 5-6',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    GradientText(
                                      '7-Achievement fair',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: 2.5,
                                      colors: [
                                        Color.fromARGB(255, 170, 63, 233),
                                        Color.fromARGB(255, 66, 91, 233),
                                        Color.fromARGB(255, 60, 135, 221),
                                      ],
                                    ),
                                  ]))))
                ])));
  }
}
