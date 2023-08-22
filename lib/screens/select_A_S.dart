// ignore: file_names
// ignore_for_file: unused_import, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:ingles/screens/show_act.dart';
import 'package:ingles/screens/show_exams.dart';

import 'package:ingles/screens/tareas.dart';
import 'package:ingles/screens/tareasM.dart';
import 'package:ingles/screens/verEstuAct.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../developer/consultasf.dart';
import '../main.dart';
import 'calificar_E.dart';
import 'createExam.dart';
import 'elec_op_p.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: SelectAS(
      cod_p: '',
    ),
  ));
}

class SelectAS extends StatefulWidget {
  String cod_p;
  SelectAS({super.key, required this.cod_p});

  @override
  State<SelectAS> createState() => _SelectASState();
}

class _SelectASState extends State<SelectAS> {
  String seleccionada3 = "Calificar Tareas";
  List eleccion = ['Calificar Tareas', 'Calificar Examenes'];
  String seleccionada = 'Año';
  List anios = ['Año', '1', '2', '3'];
  String seleccionada2 = 'Seccion';
  List seccion = ['Seccion', 'A', 'E', 'K', 'G', 'D', 'O', 'L', 'M', 'N', 'F'];
  var a;

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
              leading: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfeOp(
                              cod_p: widget.cod_p,
                            )),
                  );
                },
                child: Center(child: Icon(Icons.arrow_back)),
              ),
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              title: Center(
                child: GradientText(
                  'ELECCION DE DATOS',
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
            body: Center(
              //inicio de definicion de opciones a mostrar al usuario

              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(100)),
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Seleccione un año y sección:"),
                        Padding(padding: EdgeInsets.all(20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 70,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 208, 171, 241),
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: DropdownButton(
                                  borderRadius: BorderRadius.circular(10),
                                  dropdownColor:
                                      Color.fromARGB(255, 208, 171, 241),
                                  value: seleccionada,
                                  items: GetOptionsDropDownButton(),
                                  onChanged: (value) {
                                    setState(() {
                                      seleccionada = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 208, 171, 241),
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: DropdownButton(
                                  borderRadius: BorderRadius.circular(10),
                                  dropdownColor:
                                      Color.fromARGB(255, 208, 171, 241),
                                  value: seleccionada2,
                                  items: GetOptionsDropDownButton2(),
                                  onChanged: (value) {
                                    setState(() {
                                      seleccionada2 = value.toString();
                                      if (seleccionada2 == "A") {
                                        a = "1";
                                      } else if (seleccionada2 == "E") {
                                        a = "2";
                                      } else if (seleccionada2 == "K") {
                                        a = "3";
                                      } else if (seleccionada2 == "G") {
                                        a = "4";
                                      } else if (seleccionada2 == "D") {
                                        a = "5";
                                      } else if (seleccionada2 == "O") {
                                        a = "6";
                                      } else if (seleccionada2 == "L") {
                                        a = "7";
                                      } else if (seleccionada2 == "M") {
                                        a = "8";
                                      } else if (seleccionada2 == "N") {
                                        a = "9";
                                      } else if (seleccionada2 == "F") {
                                        a = "10";
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(20)),
                        Text("Seleccione una opcion:"),
                        Padding(padding: EdgeInsets.all(20)),
                        Container(
                          width: 180,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 208, 171, 241),
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(10),
                              dropdownColor: Color.fromARGB(255, 208, 171, 241),
                              value: seleccionada3,
                              items: GetOptionsDropDownButton3(),
                              onChanged: (value) {
                                setState(() {
                                  seleccionada3 = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(40)),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            if (seleccionada == "Año" ||
                                seleccionada2 == "Seccion") {
                              final snackBar = SnackBar(
                                  backgroundColor:
                                      Color.fromARGB(255, 155, 118, 214),
                                  shape: Border.all(width: 1),
                                  showCloseIcon: true,
                                  closeIconColor:
                                      Color.fromARGB(255, 230, 230, 230),
                                  content: Text(
                                      "Es necesario seleccionar un año y una sección"));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              if(seleccionada3=="Calificar Tareas"){
                                var eleccion="CT";
                                 Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerEstuAct(
                                          cod_p: cod_profe,
                                          anio: seleccionada,
                                          seccion: a,
                                          select: eleccion,
                                        )),
                              );
                              }else{
                                if(seleccionada3=="Calificar Examenes"){
                                  var eleccion="CE";
                                   Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerEstuAct(
                                          cod_p: cod_profe,
                                          anio: seleccionada,
                                          seccion: a,
                                          select: eleccion,
                                        )),
                              );


                                }
                              }
                             
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 163, 122, 230),
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Continuar"),
                                Icon(Icons.navigate_next_rounded)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
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

  List<DropdownMenuItem<String>> GetOptionsDropDownButton() {
    List<DropdownMenuItem<String>> annios = [];
    anios.forEach((element) {
      annios.add(DropdownMenuItem(
        value: element,
        child: Text(element),
      ));
    });
    return annios;
  }

  List<DropdownMenuItem<String>> GetOptionsDropDownButton2() {
    List<DropdownMenuItem<String>> secciones = [];
    seccion.forEach((element) {
      secciones.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
    return secciones;
  }

  List<DropdownMenuItem<String>> GetOptionsDropDownButton3() {
    List<DropdownMenuItem<String>> elecciones = [];
    eleccion.forEach((element) {
      elecciones.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
    return elecciones;
  }
}
