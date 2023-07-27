// ignore: file_names
// ignore_for_file: unused_import, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:ingles/screens/tareas.dart';
import 'package:ingles/screens/tareasM.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../developer/consultasf.dart';
import '../developer/consultaso.dart';
import '../main.dart';


void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: ProfeOp(),
  ));
}

class ProfeOp extends StatefulWidget {

  const ProfeOp({super.key});

  

  @override
  State<ProfeOp> createState() => _ProfeOpEState();
}

class _ProfeOpEState extends State<ProfeOp> {
 
var reslt;
var cod;

  @override
  Widget build(BuildContext context) {
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

              child: Column(children: [
                const SizedBox(
                  height: 90,
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //contenedor para la opcion de tareas
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () async{
                             var name = "NAME OF ACTIVITY/TASK";

                            reslt = await addTask(name);
                            if (reslt != "noExisten") {
                              for (var i = 0; i < reslt.length; i++) {
                                var dato = reslt[i];
                                var codigo=dato["cod_act"];
                                setState(() {
                                   cod=codigo;
                                });
                              }
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  TareasP(cod: cod,) ),
                            );    
                          },
                          child: const SizedBox(
                              height: 150,
                              width: 145,
                              child: Image(image: AssetImage('assets/tareas.png'))),
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
                          onPressed: () {

                          },
                          child: const SizedBox(
                              height: 150,
                              width: 145,
                              child: Image(image: AssetImage('assets/examen.png'))),
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
                const SizedBox(height: 40,),
                 //contenedor para la opcion de tareas   
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            
                          },
                          child: const SizedBox(
                              height: 150,
                              width: 145,
                              child: Image(image: AssetImage('assets/ver notas.png'))),
                        ),
                        GradientText(
                          'Ver mis notas',
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
                
              ]),
            ))));
  }
}
