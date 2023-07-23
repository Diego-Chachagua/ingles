// ignore: file_names
// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names, avoid_function_literals_in_foreach_calls, unused_import, unused_field, prefer_final_fields, await_only_futures, avoid_print, prefer_typing_uninitialized_variables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:ingles/developer/consultad.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../main.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: VerNotasE(contra: '', usuario: '',),
  ));
}

class VerNotasE extends StatefulWidget {
  final String contra;
  final String usuario;
  const VerNotasE({super.key, required this.contra, required this.usuario});

  @override
  State<VerNotasE> createState() => _VerNotasEEState();
}

class _VerNotasEEState extends State<VerNotasE> {
  final usuariob = TextEditingController();
  final contrab = TextEditingController();

  String usuariobd = "";
  String contrabd = "";
  var resultado;
  var dato = "";
@override
void initState() {
  super.initState();
  (() async {
    usuariobd = widget.usuario;
    contrabd = widget.contra;
    resultado = await historialestu(usuariobd, contrabd);
    if (resultado != null) {
      for (dato in resultado) {
        print(dato);
      }
    } else {
      print("El resultado es nulo.");
    }



  })();
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
                      width: 20,
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
                MaterialButton(onPressed:(){

                } ,
                child: MaterialButton(
                  onPressed: ()async{
                  },
                  child: Container(
                    width: 320,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        color: Color.fromARGB(255, 249, 249, 249),
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
                              Text(dato, style: TextStyle(fontSize: 15)),
                              const SizedBox(
                              width: 90,
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
                              width: 16,
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
                            const SizedBox(width:6),
                            const Text("0/10",style: TextStyle(fontSize: 15),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                )
                //fin de definición de contenedor 

              ],
            ))));
  }

 
}
