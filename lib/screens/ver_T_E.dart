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
      Size screenSize = MediaQuery.of(context).size;//contenedores
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth < 340 ? 8.00 : screenWidth > 600? 40.00 : 20.00;//titulos
    double textSize2 = screenWidth < 340 ? 10.0 : screenWidth >600 ? 50.00 : 25.00;//subtitulos
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondop.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              title: Center(
                child: GradientText(
                  'SELECCIONE UNA OPCION',
                  style: TextStyle(
                    fontSize:textSize,
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
                 SizedBox(
                  height: screenSize.height * 0.25,
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
                          child: SizedBox(
                               height: screenSize.height * 0.15,
                              width: screenSize.width * 0.38,
                              child: Image(
                                  image: AssetImage('assets/tareas.png'))),
                        ),
                        GradientText(
                          'Tareas',
                          style:  TextStyle(
                            fontSize: textSize2,
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
                          child:SizedBox(
                               height: screenSize.height * 0.15,
                              width: screenSize.width * 0.38,
                              child: Image(
                                  image: AssetImage('assets/examen.png'))),
                        ),
                        GradientText(
                          'Examenes',
                          style:  TextStyle(
                            fontSize: textSize2,
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
                //contenedor para la opcion de tareas
              ]),
            ))));
  }
}
