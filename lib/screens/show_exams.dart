// ignore: file_names

import 'package:flutter/material.dart';
import 'package:ingles/developer/consultad.dart';
import 'package:ingles/screens/tareasM.dart';
import 'package:ingles/screens/ver_T_E.dart';
import 'package:ingles/screens/ver_exam.dart';
import 'package:ingles/screens/vertarea.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../developer/consultasf.dart';
import '../main.dart';
import 'elec_op_p.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: VerExams(cod: ''),
  ));
}

class VerExams extends StatefulWidget {
  final String cod;
  const VerExams({super.key, required this.cod});

  @override
  State<VerExams> createState() => _VerExamsState();
}

class _VerExamsState extends State<VerExams> {
  var resultado;
  List nombre_p = [];
  List cod_p = [];
  String seleccionada = 'Año';
  List anios = ['Año', '1', '2', '3'];
  String seleccionada2 = 'Seccion';
  List seccion = ['Seccion', 'A', 'E', 'K', 'G', 'D', 'O', 'L', 'M', 'N', 'F'];
  var n1 = 0;
  String a = "";

  @override
  void initState() {
    super.initState();
    getActivitys(seleccionada, seleccionada2, a);
  }

  Future<void> getActivitys(var grado, var seccion, var cod) async {
    if (seleccionada == "Año" && seleccionada2 == "Seccion") {
      resultado = await showExam(widget.cod);
    } else if (seleccionada != "Año" && seleccionada2 == "Seccion") {
      resultado = await showExamgrade(widget.cod, seleccionada);
    } else if (seleccionada2 != "Seccion" && seleccionada == "Año") {
      resultado = await showExamsection(widget.cod, a);
    } else if (seleccionada != "Año" && seleccionada2 != "Seccion") {
      resultado = await showExamsSG(widget.cod, a, seleccionada);
    }
    print(seleccionada);
    print(seleccionada2);
    print(a);
    setState(() {
      n1 = 0;
      cod_p.clear();
      nombre_p.clear();
      if (resultado != "noExisten") {
        var n = resultado.length;
        if (n == null) {
          n = 1;
        }

        for (var i = 0; i < n; i++) {
          var dato = resultado[i];
          var codigo = dato["cod_pr"];
          var nombre = dato["nombre_p"];

          cod_p.add(codigo);
          nombre_p.add(nombre);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondof.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            appBar: AppBar(
              leading: MaterialButton(onPressed: (){
                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowElec(
                                    cod_p: widget.cod,
                                  )),
                        );
              },
              child: Center(child:Icon(Icons.arrow_back)),),
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              title: Center(
                child: Column(
                  children: [
                    GradientText(
                      'Historial de Examenes\nCreados',
                      style: const TextStyle(
                        fontSize: 25.0,
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
              ),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Filtros:",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 70,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 208, 171, 241),
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(10),
                          dropdownColor: Color.fromARGB(255, 208, 171, 241),
                          value: seleccionada,
                          items: GetOptionsDropDownButton(),
                          onChanged: (value) {
                            setState(() {
                              seleccionada = value.toString();
                              getActivitys(seleccionada, seleccionada2, a);
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 208, 171, 241),
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(10),
                          dropdownColor: Color.fromARGB(255, 208, 171, 241),
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
                              getActivitys(seleccionada, seleccionada2, a);
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 1000,
                  color: Colors.black,
                  height: 2,
                ),
                //fin de espacio para definicion de linea
                const SizedBox(
                  height: 20,
                ),
                //espacio para definición de contenedor para mostrar historial

                for (var i = 0; i < nombre_p.length; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerExam(cod: cod_p[i],
                                cod_p: widget.cod,
                                    )),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          width: 240,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            color: Color.fromARGB(255, 249, 249, 249),
                            border: Border.all(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 30,
                                top: 20,
                                child: Text(nombre_p[i],
                                    style: TextStyle(fontSize: 15)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () async{
                        //    final snackBar = SnackBar(
                        //     backgroundColor: Color.fromARGB(255, 155, 118, 214),
                        //     shape: Border.all(width: 1),
                        //     closeIconColor: Color.fromARGB(255, 230, 230, 230),
                        //     content: Row(
                        //       children: [
                        //         Text("Desactivado por el momento"),
                        //       ],
                        //     ));
                        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          n1++;
                          if (n1 == 1) {
                            var result= await comprobarExam(cod_p[i]);
                              var dato=result;
                              if(dato=="borrar"){
                                  final snackBar = SnackBar(
                            backgroundColor: Color.fromARGB(255, 155, 118, 214),
                            shape: Border.all(width: 1),
                            closeIconColor: Color.fromARGB(255, 230, 230, 230),
                            content: Row(
                              children: [
                                Text("!Esta actividad contiene preguntas¡\nPresiona 2 veces mas para borrarla de todos modos"),
                              ],
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }else if(dato=="no borrar"){
                                final snackBar = SnackBar(
                            backgroundColor: Color.fromARGB(255, 155, 118, 214),
                            shape: Border.all(width: 1),
                            closeIconColor: Color.fromARGB(255, 230, 230, 230),
                            content: Row(
                              children: [
                                Text("No se puede borrar esta actividad\ndebido a que esta actividad ya ha sido respondida\npor estudiantes"),
                              ],
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                              else if (dato=="false"){
                                final snackBar = SnackBar(
                            backgroundColor: Color.fromARGB(255, 155, 118, 214),
                            shape: Border.all(width: 1),
                            closeIconColor: Color.fromARGB(255, 230, 230, 230),
                            content: Row(
                              children: [
                                Text("Presiona 2 Veces mas para borrar la actividad"),
                              ],
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            
                          }
                          if (n1 == 2) {

                            deleteExam(cod_p[i], widget.cod); 
                          }
                          if(n1==3){
                             getActivitys(seleccionada, seleccionada2, a);
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 209, 31, 18),
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                //fin de definición de contenedor
              ],
            ))));
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
}
