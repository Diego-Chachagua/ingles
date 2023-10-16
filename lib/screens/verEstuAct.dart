// ignore: file_names

import 'package:flutter/material.dart';
import 'package:ingles/screens/select_A_S.dart';
import '../developer/consultasf.dart';
import 'calificar_E.dart';
import 'calificar_exam.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: VerEstuAct(
      anio: '',
      seccion: '',
      cod_p: '',
      select: '',
    ),
  ));
}

class VerEstuAct extends StatefulWidget {
  String anio;
  String seccion;
  String cod_p;

  String select;
  VerEstuAct(
      {super.key,
      required this.anio,
      required this.seccion,
      required this.cod_p,
      required this.select});
  @override
  State<VerEstuAct> createState() => _VerEstuActState();
}

class _VerEstuActState extends State<VerEstuAct> {
  var resultado;
  bool isLoading=true;
String info="";
  var resultado2;
  List nombres = [];
  List apellidos = [];
  var secc;
  List nie = [];

  @override
  void initState() {
    super.initState();
    getActivitys();
  }

  Future<void> getActivitys() async {
    resultado = await shownieAlum(widget.anio, widget.seccion);
    if(resultado!="Error"){
      
    setState(() {
      isLoading=false;
      nie.clear();
      nombres.clear();
      if (resultado != "noExisten") {
        var n = resultado.length;
        if (n == null) {
          n = 1;
        }
        for (var i = 0; i < n; i++) {
          var dato = resultado[i];
          var codigo = dato["nie"];
          var nombre = dato["nombre_e"];
          var apellido = dato["apellido_e"];
          nie.add(codigo);
          nombres.add(nombre);
          apellidos.add(apellido);
        }
      }
    });
    }else{
        setState(() {
          isLoading=false;
        info="Error";
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.seccion == "1") {
      secc = "A";
    } else if (widget.seccion == "2") {
      secc = "E";
    } else if (widget.seccion == "3") {
      secc = "K";
    } else if (widget.seccion == "4") {
      secc = "G";
    } else if (widget.seccion == "5") {
      secc = "D";
    } else if (widget.seccion == "6") {
      secc = "O";
    } else if (widget.seccion == "7") {
      secc = "L";
    } else if (widget.seccion == "8") {
      secc = "M";
    } else if (widget.seccion == "9") {
      secc = "N";
    } else if (widget.seccion == "10") {
      secc = "F";
    }
     Size screenSize = MediaQuery.of(context).size; //contenedores
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth < 340? 8.00: screenWidth > 600? 30.00: 20.00; //titulos
    double textSize2 = screenWidth < 340? 10.0 : screenWidth > 600? 25.00: 15.00; //boton de guardado
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondop.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            appBar: AppBar(
              leading: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Center(child: Icon(Icons.arrow_back)),
              ),
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Column(
              children: [
                 Container(
                  width: screenSize.width*0.9,
                  height: screenSize.height*0.1,
                   decoration: BoxDecoration(
                      color: Color.fromARGB(255, 185, 159, 255),
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                       BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 7),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                          ),
                    ]
                  ),
                  child: Center(child: Text(
                  'Se muestran estudiantes de ${widget.anio}°  "${secc}" ',
                  style: TextStyle(fontSize: textSize, fontStyle: FontStyle.italic),
                ),)),
                 SizedBox(
                  height: screenSize.height*0.01,
                ),
                isLoading ?
                Column(
                  children: [ 
                     SizedBox(
                  height: screenSize.height * 0.3,
                ),
                             
                    const FittedBox(
                        fit: BoxFit.scaleDown,
                        child:CircularProgressIndicator(
                          color: Color.fromARGB(255, 103, 82, 197),
                        backgroundColor: Colors.white,
                      ),),
                      Text("Cargando",style: TextStyle(fontSize: textSize2,fontStyle: FontStyle.italic),)
                  ],
                )
                :
                 info =="Error"?
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                           SizedBox(
                           height: screenSize.height * 0.3,
                            ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: MaterialButton(onPressed: (){
                                       setState(() {
                                        info="";
                                        isLoading=true;
                                         getActivitys();
                                       }); 
                            },
                            child: Row(children: [
                              Text("Reintentar"),
                              Icon(Icons.error)
                            ]),),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                :
                 SizedBox(
                  height:screenSize.height*0.03,
                ),
                //espacio para definición de contenedor para mostrar historial
                for (var i = 0; i < nie.length; i++)    
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () async {
                          if (nie[i] != "0") {
                            if(widget.select=="CT"){
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CalificarE(
                                        nombres: nombres[i] +" "+ apellidos[i],
                                        nie: nie[i],
                                        anio: widget.anio,
                                        seccion: widget.seccion,
                                        cod_profe: widget.cod_p,
                                        elec: widget.select,
                                      )),
                            );
                            }else{
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CalificarExam(
                                        nombres: nombres[i] +" "+ apellidos[i],
                                        nie: nie[i],
                                        anio: widget.anio,
                                        seccion: widget.seccion,
                                        cod_profe: widget.cod_p,
                                        elec: widget.select,
                                      )),
                            );
                            }   
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          width: screenSize.width*0.9,
                          height: screenSize.height*0.08,
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
                                child: Text(nombres[i] + " " + apellidos[i],
                                    style: TextStyle(fontSize: textSize2)),
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