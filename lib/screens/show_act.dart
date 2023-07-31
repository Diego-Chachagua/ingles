// ignore: file_names

import 'package:flutter/material.dart';
import 'package:ingles/developer/consultad.dart';
import 'package:ingles/screens/tareasM.dart';
import 'package:ingles/screens/vertarea.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../developer/consultasf.dart';
import '../main.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: VerAct(cod: ''),
  ));
}

class VerAct extends StatefulWidget {
  final String cod;
  const VerAct({super.key, required this.cod});

  @override
  State<VerAct> createState() => _VerActEState();
}

class _VerActEState extends State<VerAct> {
  var resultado;
  List nombre_act = [];
  List cod_act = [];

  @override
  void initState() {
    super.initState();
    getActivitys();
  }

  Future<void> getActivitys() async {
    resultado = await showActivitys(widget.cod);
    if (resultado != "noExisten") {
      for (var i = 0; i < resultado.length; i++) {
        var dato = resultado[i];
        var codigo = dato["cod_act"];
        var nombre = dato["nombre_act"];
        setState(() {
          cod_act.add(codigo);
          nombre_act.add(nombre);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.cod);
    print(nombre_act);
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondof.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              title: Center(
                child: Column(
                  children: [
                    GradientText(
                      'EXAM SCORES',
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
                    GradientText(
                      '(calificaciones del examen)',
                      style: const TextStyle(
                        fontSize: 20.0,
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
                Row(
                  children: const [
                    SizedBox(
                      width: 40,
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

                for (var i = 0; i < nombre_act.length; i++)
                 MaterialButton(onPressed: (){
                  Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  VerTarea(cod_p: widget.cod, cod: cod_act[i],) ),
                            );
                 },
                 child: Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 320,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
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
                          child: Text(nombre_act[i],
                              style: TextStyle(fontSize: 15)),
                        ),
                        Positioned(
                          left: 255,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 2,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 270,
                          top: 20,
                          child: Text(cod_act[i]),
                        ),
                      ],
                    ),
                  ),)
                   //fin de definición de contenedor
              ],
            ))
            )
            );
  }
}
