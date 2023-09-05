// ignore: file_names
// ignore_for_file: unused_import, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:ingles/screens/aprender.dart';
import 'package:ingles/screens/tareas.dart';
import 'package:ingles/screens/unidades.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../developer/consultaso.dart';
import '../main.dart';
import 'elec_e_o_t.dart';
import 'examenes.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: OpAlum(
      usuario: '',
      contra: '',
    ),
  ));
}

class OpAlum extends StatefulWidget {
  final String usuario;
  final String contra;
  const OpAlum({super.key, required this.usuario, required this.contra});

  @override
  State<OpAlum> createState() => _OpAlumEState();
}

class _OpAlumEState extends State<OpAlum> {
  String usuariobd = "";
  String contrabd = "";
  List<String> contrap = [];
  List<String> nombrep = [];
  List<String> niee = [];
  var reslt;
  String grado = "";
  String seccion = "";
  String nie = "";

  @override
  void initState() {
    super.initState();
    (() async {
      reslt = await anosec(widget.usuario, widget.contra);
      if (reslt != "noExisten") {
        for (var i = 0; i < reslt.length; i++) {
          var dato = reslt[i];
          print(dato["cod_g"]);
          print(dato["cod_s"]);
          print(dato["nie"]);

          // ignore: non_constant_identifier_names
          var nom_tem = dato["cod_g"];

          // ignore: non_constant_identifier_names
          var i_tem = dato["cod_s"];

          // ignore: non_constant_identifier_names
          var id_tem = dato["nie"];

          setState(() {
            // Actualizar las listas con los datos obtenidos
            nombrep.add(nom_tem);
            contrap.add(i_tem);
            niee.add(id_tem);

            for (var i = 0; i < nombrep.length; i++) {
              grado = nombrep[i];
            }
            for (var i = 0; i < contrap.length; i++) {
              seccion = contrap[i];
            }
            for (var i = 0; i < niee.length; i++) {
              nie = niee[i];
            }
          });
        }
      }
    })();
  }

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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Tareas(
                                      grado: grado,
                                      seccion: seccion,
                                      nie: nie)),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Examenes(
                                      grado: grado,
                                      seccion: seccion,
                                      nie: nie)),
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
                Row(
                  children: [
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            print(widget.usuario);
                            print(widget.contra);
                            usuariobd = widget.usuario;
                            contrabd = widget.contra;
                            print(usuariobd);
                            print(contrabd);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ElecEOT(
                                      usu: usuariobd, contra: contrabd)),
                            );
                          },
                          child: const SizedBox(
                              height: 150,
                              width: 145,
                              child: Image(
                                  image: AssetImage('assets/ver notas.png'))),
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
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Videos()),
                            );
                          },
                          child: const SizedBox(
                              height: 150,
                              width: 145,
                              child:
                                  Image(image: AssetImage('assets/play.png'))),
                        ),
                        GradientText(
                          'Ver más',
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
                  ],
                ),
                Column(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Temas()),
                        );
                      },
                      child: const SizedBox(
                          height: 150,
                          width: 145,
                          child: Image(image: AssetImage('assets/letra-u.png'))),
                    ),
                    GradientText(
                      'Unidades',
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
