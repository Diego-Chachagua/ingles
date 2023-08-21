// ignore: file_names

import 'package:flutter/material.dart';
import 'package:ingles/screens/show_requestE.dart';
import 'package:ingles/screens/showrequestExam.dart';
import 'package:ingles/screens/verEstuAct.dart';
import '../developer/consultasf.dart';

void main() {
  runApp( MaterialApp(
    title: 'Navigation Basics',
    home: CalificarExam(nie: '',
    anio: '',
    seccion: '',
    nombres: '',
    cod_profe: '',
    elec: '',),
  ));
}

class CalificarExam extends StatefulWidget {
  String nombres;
  final String nie;
  String anio;
  String seccion;
  String cod_profe;
  String elec;
   CalificarExam({super.key, required this.nie,required this.anio,required this.seccion, required this.nombres, required this.cod_profe, required this.elec});

  @override
  State<CalificarExam> createState() => _CalificarExamState();
}

class _CalificarExamState extends State<CalificarExam> {
  var resultado;
  List nombre_act = [];
  List cod_act = [];
  List fecha=[];
  var n1 = 0;

  @override
  void initState() {
    super.initState();
    getActivitys();
  }
  Future<void> getActivitys() async {
    print(widget.nie);
      resultado = await showExamAlum(widget.nie);
    setState(() {
      n1 = 0;
      cod_act.clear();
      nombre_act.clear();
      if (resultado != "noExisten") {
        var n = resultado.length;
        if (n == null) {
          n = 1;
        }

        for (var i = 0; i < n; i++) {
          var dato = resultado[i];
          var codigo = dato["cod_pr"];
          var nombre = dato["nombre_pr"];
          var date=dato["fecha"];
          cod_act.add(codigo);
          nombre_act.add(nombre);
          if(date!=null){
             fecha.add(date);
          }else{
            fecha.add("0000/00/00-00:00");
          }
         
        }
      }
    });
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
              leading: MaterialButton(onPressed: (){
                 Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerEstuAct(
                                          cod_p: widget.cod_profe,
                                          anio: widget.anio,
                                          seccion: widget.seccion,
                                          select: widget.elec,
                                        )),
                              );
              },
              child: Center(child:Icon(Icons.arrow_back)),),
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Column(
              children: [
                Text("Se muestran Examenes de el estudiante:\n${widget.nombres}",style: TextStyle(fontSize: 17,fontStyle: FontStyle.italic),),
                const SizedBox(
                  height: 30,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          if(nombre_act[i]=="No hay ninguna actividad todavia"){

                          }else{
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  ShowRequestExam(
                                      cod_profe: widget.cod_profe,
                                      cod_act: cod_act[i],
                                      nombre_act: nombre_act[i],
                                      nie: widget.nie,
                                      anio: widget.anio,
                                      seccion: widget.seccion,
                                      nombres: widget.nombres,
                                      elec: widget.elec,
                                        )),
                              );
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          width: 320,
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
                                child: Text(nombre_act[i],
                                    style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic)),
                              ),
                              Positioned(
                                left: 240,
                                top: 15,
                                child: Column(
                                  children: [
                                    Text("creación:",
                                    style: TextStyle(fontSize: 8,fontStyle: FontStyle.italic)
                                        ),
                                        Text("${fecha[i]}",
                                    style: TextStyle(fontSize: 8,fontStyle: FontStyle.italic)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                //fin de definición de contenedor
              ],
            ))));
  }

  
}