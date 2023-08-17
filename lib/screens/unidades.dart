// ignore: unused_import
import 'package:flutter/material.dart';

void temas() {
  runApp( MaterialApp(
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
Widget build (BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/color1.jpg'), fit: BoxFit.cover),
            ),
    
    child: Scaffold(
  body: Stepper(
    
    currentStep: currentStep,
    onStepContinue: () {
      if (currentStep >= 3) return;
      setState((){
        currentStep++;
        });
    },
    onStepCancel: (){
      if (currentStep <= 0) return;
      setState(() {
        currentStep--;
     
   });
    },
    steps:  [
     Step(title: Text("Unit 1"), 
      content: SizedBox(
        width: 130,
        height: 300,
        child: Container(
           alignment: Alignment.centerLeft,
          child: Column(
           
            children: [
              Text('1-Classroom language'),
              Text('2-Greetings'),
              Text('3-The Alphabet'),
              Text('4-Numbers from 0'),
              Text('to 20 and phone numbers'),
        Text('5-Reading email addresses '),
        Text('6-Basic personal information'),
        Text('7-Project: Basic introductions ')
            ],
          ),
        ),
        
      )),
      Step(title: Text("Unit 2"), 
      content: SizedBox(
        width: 130,
        height: 300,
        child: Container(
           alignment: Alignment.centerLeft,
          child: Column(
           
            children: [
              Text('1-Classroom supplies'),
              Text('2-Singular and plural nouns(fixed manner)'),
              Text('3-Colors'),
              Text('4-Verb be (It is / They are)'),
              Text('5-Numbers from 21 to 100'),
        Text('6-Basic math operations'),
        Text('7-Basic personal information'),
        Text('8-Project: Basic introductions ')
            ]
          )
        )
      ),
      ),
      Step(title: Text("Unit 3"), 
      content: SizedBox(
        width: 130,
        height: 300,
        child: Container(
           alignment: Alignment.centerLeft,
          child: Column(
           
            children: [
              Text('1-Family members'),
              Text('2-Family Tree'),
              Text('3-Verb be and subject pronouns'),
              Text('4-Extended family members'),
              Text('5-Other family members'),
        Text('6-Possessive adjectives '),
            ]
          )
        )
      )
      ),
       Step(title: Text("Unit 4"), 
      content: SizedBox(
        width: 130,
        height: 320,
        child: Container(
           alignment: Alignment.centerLeft,
          child: Column(
           
            children: [
              Text('1-Rooms of a house'),
              Text('2-Furniture and appliances'),
              Text('3-Regular plural nouns'),
              Text('4-Describing rooms in a house: There is/are'),
              Text('5-There is/are + number + noun'),
        Text('6-Common prepositions and prepositional phrases of place'),
        Text('7-Questions with is there/are there'),
        Text('8-Questions with How many _____ are there?')
            ]
          )
        )
      )
      ),
       Step(title: Text("Unit 5"), 
      content: SizedBox(
        width: 130,
        height: 400,
        child: Container(
           alignment: Alignment.centerLeft,
          child: Column(
           
            children: [
              Text('1-Project: Describing my house'),
              Text('2-Fortifying my skills: Units 3-4'),
              Text('3-Daily activities'),
              Text('4-Days of the week'),
              Text('5-Simple present tense: affirmative sentences with I, you, we,they'),
        Text('6-Simple present tense: negative sentences and questions with I, you, we, they'),
        Text('7-Numbers from 1-100'),
        Text('8-Telling the time'),
        Text('9-Frequency time expressions'),
          Text('10-Connectors of sequence'),
          Text('11-Project: Describing my day')
            ]
          )
        )
      )
      ),
      Step(title: Text("Unit 6"), 
      content: SizedBox(
        width: 130,
        height: 400,
        child: Container(
           alignment: Alignment.centerLeft,
          child: Column(
           
            children: [
              Text('1-Preferences: food, fruit, music genres'),
              Text('2-Preferences: pets, hobbies.'),
              Text('3-Simple present tense (likes/dislikes)'),
              Text('4-Asking for preferences'),
              Text('5-Project: All about me'),
        Text('6-Fortifying my skills: Units 5-6'),
        Text('7-Achievement fair'),
            ]
          )
        )
      )
      )
    ])));

  
}
}
