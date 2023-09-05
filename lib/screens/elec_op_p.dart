// ignore: file_names
// ignore_for_file: unused_import, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:ingles/screens/select_A_S.dart';
import 'package:ingles/screens/show_act.dart';
import 'package:ingles/screens/tareas.dart';
import 'package:ingles/screens/tareasM.dart';
import 'package:ingles/screens/ver_T_E.dart';
import 'package:intl/intl.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../developer/consultasf.dart';
import '../developer/consultaso.dart';
import '../main.dart';
import 'createExam.dart';


void main() {
  runApp( MaterialApp(
    title: 'Navigation Basics',
    home: ProfeOp(cod_p: '',),
  ));
}

class ProfeOp extends StatefulWidget {
String cod_p;
   ProfeOp({super.key, required this.cod_p});

  

  @override
  State<ProfeOp> createState() => _ProfeOpEState();
}

class _ProfeOpEState extends State<ProfeOp> {
 String formattedDate = "YYYY-MM-DD";


  

  
var reslt;
var cod;
var cod2;
var result1;


  @override
  Widget build(BuildContext context) {
    var cod_profe=widget.cod_p;
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
                            var selectDate = DateTime.now();
                            var selectTime = TimeOfDay.now();
                             formattedDate = DateFormat('yyyy-MM-dd').format(selectDate);
                               String formateTime = selectTime.format(context);
                            print(formateTime);
                            print(formattedDate);

                             var name = "NAME OF ACTIVITY/TASK";
                            try{
                               reslt = await addTask(name,widget.cod_p,formattedDate,formateTime);
                            if (reslt != "noExisten") {
                              for (var i = 0; i < reslt.length; i++) {
                                var dato = reslt[i];
                                var codigo=dato["cod_act"];
                                setState(() {
                                   cod=codigo;
                                   print(cod);
                                });
                              }
                            }
                            }catch(e){
                              _smsError(context);
                            } 
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  TareasP(cod: cod,cod_p: widget.cod_p, ),

                            )   
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
                          onPressed: () async{
                            var selectDate = DateTime.now();
                            var selectTime = TimeOfDay.now();
                             String formattedDate = DateFormat('yyyy-MM-dd').format(selectDate);
                               String formateTime = selectTime.format(context);
                            print(formateTime);
                            print(formattedDate);
                             var name = "NAME OF EXAM";
                            try{
                               result1 = await addExam(name,widget.cod_p,formattedDate,formateTime);
                            if (result1 != "noExisten") {
                              for (var i = 0; i < result1.length; i++) {
                                var dato = result1[i];
                                var codigo=dato["cod_pr"];
                                setState(() {
                                   cod2=codigo;
                                   
                                });
                              }
                            }
                            }catch(e){
                              _smsError(context);
                            }  

                             Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateExam(
                                     cod_p: widget.cod_p,
                                     cod: cod2,
                                  )),
                             );
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowElec(cod_p: cod_profe,) ),
                                ); 
                                
                              },
                              child: const SizedBox(
                                  height: 150,
                                  width: 145,
                                  child: Image(image: AssetImage('assets/historial_medico.png'))),
                            ),
                            GradientText(
                              '       Ver mis \n    actividades',
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
                              MaterialPageRoute(builder: (context) => SelectAS(cod_p: cod_profe) ),
                            ); 
                                
                              },
                              child: const SizedBox(
                                  height: 150,
                                  width: 145,
                                  child: Image(image: AssetImage('assets/calificar1.png'))),
                            ),
                            GradientText(
                              'Calificar',
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
