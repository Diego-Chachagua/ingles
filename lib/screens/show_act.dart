// ignore: file_names

import 'package:flutter/material.dart';
import 'package:ingles/developer/consultad.dart';
import 'package:ingles/screens/tareasM.dart';
import 'package:ingles/screens/vertarea.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../developer/consultasf.dart';
import '../main.dart';
import 'elec_op_p.dart';

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
  var info;
  bool isLoading=true;
  var resultado;
  List nombre_act = [];
  List cod_act = [];
  List date=[];
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
      resultado = await showActivitys(widget.cod);
    } else if (seleccionada != "Año" && seleccionada2 == "Seccion") {
      resultado = await showActivitysgrade(widget.cod, seleccionada);
    } else if (seleccionada2 != "Seccion" && seleccionada == "Año") {
      resultado = await showActivityssection(widget.cod, a);
    } else if (seleccionada != "Año" && seleccionada2 != "Seccion") {
      resultado = await showActivitysSG(widget.cod, a, seleccionada);
    }
    print(resultado);
    if(resultado != "Error"){  
    setState(() {
       cod_act.clear();
        nombre_act.clear();
      isLoading =false;
      n1 = 0;
      if (resultado != "noExisten") {
        var n = resultado.length;
        if (n == null) {
          n = 1;
        }
        for (var i = 0; i < n; i++) {
          var dato = resultado[i];
          var codigo = dato["cod_act"];
          var nombre = dato["nombre_act"];
          var dates = dato["date"];
          cod_act.add(codigo);
          nombre_act.add(nombre);
          date.add(dates);
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
    print(info);
    Size screenSize = MediaQuery.of(context).size;//contenedores
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth < 340 ? 8.00 : screenWidth >=600? 30.00 : 25.00;//titulos
    double textSize2 = screenWidth < 340 ? 10.0 : screenWidth >=600 ? 40.00 : 20.00;//subtitulos
    double textSize3 = screenWidth < 340 ? 10.0 : screenWidth >=600 ? 30.00 : 17.00;//filtros
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondof.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            appBar: AppBar(
              leading: MaterialButton(onPressed: (){
                Navigator.pop(context);
              },
              child: Center(child:Icon(Icons.arrow_back)),),
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              title: Center(
                child: Column(
                  children: [
                    GradientText(
                      'Historial de Actividades\nCreadas',
                      style:  TextStyle(
                        fontSize: textSize,
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
                 SizedBox(
                  height: screenSize.height * 0.05,
                ),
                Text(
                  "Filtros:",
                  style: TextStyle(color: Colors.white, fontSize: textSize2),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: screenSize.width * 0.2,
                      height: screenSize.height * 0.07,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 208, 171, 241),
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: DropdownButton(
                          style: TextStyle(fontSize: textSize3,color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          dropdownColor: Color.fromARGB(255, 208, 171, 241),
                          value: seleccionada,
                          items: GetOptionsDropDownButton(),
                          onChanged: (value) {
                            setState(() {
                              cod_act.clear();
                              nombre_act.clear();
                              isLoading=true;
                              seleccionada = value.toString();
                              getActivitys(seleccionada, seleccionada2, a);
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: screenSize.width * 0.3,
                      height: screenSize.height * 0.07,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 208, 171, 241),
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: DropdownButton(
                          style: TextStyle(fontSize: textSize3,color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          dropdownColor: Color.fromARGB(255, 208, 171, 241),
                          value: seleccionada2,
                          items: GetOptionsDropDownButton2(),
                          onChanged: (value) {
                            setState(() {
                              cod_act.clear();
                              nombre_act.clear();
                              isLoading=true;
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
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Container(
                  width:screenSize.width * 1,
                  color: Colors.black,
                  height: screenSize.height*0.002,
                ),
                //fin de espacio para definicion de linea
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
                      Text("Cargando",style: TextStyle(fontSize: textSize3,fontStyle: FontStyle.italic),)
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
                                         getActivitys(seleccionada, seleccionada2, a);
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
                  height: screenSize.height * 0.02,
                ),
                //espacio para definición de contenedor para mostrar historial        
               Container(
                width: screenSize.width*1,
                height: screenSize.height*0.7,
                 child: ListView.builder(
                  itemCount: cod_act.length,
                  itemBuilder: (BuildContext context, int index) {
                   // Crea un botón para cada elemento en la lista de datos
                   return
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          onLongPress: (){
                            final snackBar = SnackBar(
                                            backgroundColor: Color.fromARGB(
                                                255, 155, 118, 214),
                                            shape: Border.all(width: 1),
                                            closeIconColor: Color.fromARGB(
                                                255, 230, 230, 230),
                                            content: Text(
                                                "Fecha de creación: ${date[index]}"));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                          },
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerTarea(
                                        cod_p: widget.cod,
                                        cod: cod_act[index],
                                      )),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            width: screenSize.width*0.65,
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
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(nombre_act[index],
                                        style: TextStyle(fontSize: textSize3)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () async{
                              var result= await comprobarAct(cod_act[index]);
                                var dato=result;
                                if(dato=="borrar"){
                                  //borrar pero contiene preguntas
                                  _deletetask(context,"Esta actividad contiene preguntas",cod_act[index],seleccionada,seleccionada2,a);
                                  }else if(dato=="no borrar"){
                                                                //no se puede borrar
                                 final snackBar = SnackBar(
                                    content: Text(
                                        "Esta actividad no se puede borrar por que ya contiene preguntas"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                }
                                else if (dato=="false"){
                                  //borrar
                                _deletetask(context, "",cod_act[index],seleccionada,seleccionada2,a);
                                }
                              
                            

                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            height: screenSize.height*0.07,
                            width: screenSize.width*0.15,
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
                    );
                                      }
                 ),
               )
                //fin de definición de contenedor
              ],
            ),
            )));
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

  void _deletetask(BuildContext context, var texto,var cod,var g, var s,var c) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("Estas seguro de borrar la actividad?"),
            actions: [
              Center(child: Text(texto)),
              Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [ 
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                               Navigator.pop(context);                
                             deleteTask(cod, widget.cod);
                             getActivitys(g, s, c);
                             final snackBar = SnackBar(
                                    content: Row(
                                      children: [
                                        Text(
                                            "Si no se observan cambios prueba con"),
                                        TextButton(onPressed: (){
                                            getActivitys(g, s, c);
                                        }, child: Center(child: Text("Actualizar"),))
                                      ],
                                    ));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                            });
                          },
                          child: const Text(
                            'Aceptar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}
