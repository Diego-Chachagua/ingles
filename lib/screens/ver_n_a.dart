// ignore: file_names
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../main.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: VerNotasA(),
  ));
}

class VerNotasA extends StatefulWidget {
  const VerNotasA({super.key});

  @override
  State<VerNotasA> createState() => _VerNotasAEState();
}

class _VerNotasAEState extends State<VerNotasA> {
  final usuariob = TextEditingController();
  final contrab = TextEditingController();

  String usuariobd = "";
  String contrabd = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondo_v.jpg'), fit: BoxFit.cover),
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
                      'TASK RESULTS',
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
                      '(Resultados de tareas)',
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
                      width: 20,
                    ),
                    Text(
                      "Filtros:",
                      style: TextStyle(
                        color: Color.fromARGB(255, 87, 51, 235),
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 70,
                      height: 31,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: Text(
                        "Año",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                    Container(
                      width: 70,
                      height: 31,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: Text(
                        "Seccion",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                    Container(
                      width: 70,
                      height: 31,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Center(
                          child: Text(
                        "Unidad",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                    //espacio para edificion de boton de busqueda
                    MaterialButton(
                      onPressed: () {},
                      child: const SizedBox(
                          height: 45,
                          width: 45,
                          child: Image(image: AssetImage('assets/lupa.png'))),
                    ),
                    //fin de espacio para edición de boton de busqueda
                  ],
                ),
                //espacio para definicion de linea
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
                Container(
                  width: 320,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color: Colors.grey,
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row( 
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          const Text("Name of Activity",style: TextStyle(fontSize: 15),),
                          const SizedBox(
                            width: 110,
                          ),
                          Column(
                            children: const[
                               SizedBox(
                            height: 40,
                          ),
                              Text("U1",style: TextStyle(fontSize: 15),),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),

                          //espacio para definición de linea horizontal
                          Container(
                            width: 2,
                            height: 76,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black)
                                //fin de espacio de linea horizontal
                                ),
                          ),
                          const SizedBox(width:10),
                          const Text("0/10",style: TextStyle(fontSize: 15),),
                        ],
                      ),
                    ],
                  ),
                ),
                //fin de definición de contenedor 

              ],
            ))));
  }
}
