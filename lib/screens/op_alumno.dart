// ignore: file_names
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../main.dart';
import 'elec_e_o_t.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: OpAlum(),
  ));
}

class OpAlum extends StatefulWidget {
  const OpAlum({super.key});

  @override
  State<OpAlum> createState() => _OpAlumEState();
}

class _OpAlumEState extends State<OpAlum> {
  final usuariob = TextEditingController();
  final contrab = TextEditingController();

  String usuariobd = "";
  String contrabd = "";

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
                          onPressed: () {

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
                             Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ElecEOT()),
                        );
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
