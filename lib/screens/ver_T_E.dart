// ignore: file_names
// ignore_for_file: unused_import, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:ingles/screens/show_act.dart';
import 'package:ingles/screens/show_exams.dart';

import 'package:ingles/screens/tareas.dart';
import 'package:ingles/screens/tareasM.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../developer/consultasf.dart';
import '../developer/consultaso.dart';
import '../main.dart';
import 'createExam.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: ShowElec(
      cod_p: '',
    ),
  ));
}

class ShowElec extends StatefulWidget {
  String cod_p;
  ShowElec({super.key, required this.cod_p});

  @override
  State<ShowElec> createState() => _ShowElecState();
}

class _ShowElecState extends State<ShowElec> {
  @override
  Widget build(BuildContext context) {
    var cod_profe = widget.cod_p;

    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondop.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              title: Center(
                child: GradientText(
                  'ELIJA UNA OPCION',
                  style: const TextStyle(
                    fontSize: 30.0,
                  ),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: 3.5,
                  colors: const [
                    Color.fromARGB(255, 170, 63, 233),
                    Color.fromARGB(255, 66, 91, 233),
                    Color.fromARGB(255, 60, 135, 221),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Center(
              //inicio de definicion de opciones a mostrar al usuario
              child: Column(
                
                children: [
                const SizedBox(
                  height: 250,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //contenedor para la opcion de tareas
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerAct(
                                        cod: cod_profe,
                                      )),
                            );
                          },
                          child: const SizedBox(
                              height: 150,
                              width: 145,
                              child: Image(
                                  image: AssetImage('assets/tareas.png'))),
                        ),
                        GradientText(
                          'Tareas',
                          style: const TextStyle(
                            fontSize: 30.0,
                          ),
                          gradientType: GradientType.linear,
                          gradientDirection: GradientDirection.ttb,
                          radius: 3.5,
                          colors: const [
                            Color.fromARGB(255, 170, 63, 233),
                            Color.fromARGB(255, 66, 91, 233),
                            Color.fromARGB(255, 60, 135, 221),
                          ],
                        ),
                      ],
                    ),
                    //fin de espacio de contenedor para hacer tareas
                    //contenedor para la opcion de examenes
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => VerExams(cod: cod_profe,) ),
                            ); 
                          },
                          child: const SizedBox(
                              height: 150,
                              width: 145,
                              child: Image(
                                  image: AssetImage('assets/examen.png'))),
                        ),
                        GradientText(
                          'Examenes',
                          style: const TextStyle(
                            fontSize: 30.0,
                          ),
                          gradientType: GradientType.linear,
                          gradientDirection: GradientDirection.ttb,
                          radius: 3.5,
                          colors: const [
                            Color.fromARGB(255, 170, 63, 233),
                            Color.fromARGB(255, 66, 91, 233),
                            Color.fromARGB(255, 60, 135, 221),
                          ],
                        ),
                      ],
                    ),
                    //fin de espacio de contenedor para ver examenes
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                //contenedor para la opcion de tareas
              ]),
            ))));
  }

  void _smsError(BuildContext parentContext) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("ERROR[003]"),
            content: Container(
              height: 160,
              child: Column(
                children: [
                  Text(
                      "-Ya existe una actividad con el nombre 'NAME OF ACTIVITY/TASK'\n-Para solucionar este problema es recomendado\ncambiar el nombre a la otra actividad que contenga el mismo nombre",
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  Padding(padding: EdgeInsets.all(10)),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 180,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.arrow_back),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
