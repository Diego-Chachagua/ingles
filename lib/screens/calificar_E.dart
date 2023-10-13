// ignore: file_names

import 'package:flutter/material.dart';
import 'package:ingles/screens/show_requestE.dart';
import 'package:ingles/screens/verEstuAct.dart';
import '../developer/consultasf.dart';

void main() {
  runApp( MaterialApp(
    title: 'Navigation Basics',
    home: CalificarE(nie: '',
    anio: '',
    seccion: '',
    nombres: '',
    cod_profe: '',
    elec: '',),
  ));
}

class CalificarE extends StatefulWidget {
  String nombres;
  final String nie;
  String anio;
  String seccion;
  String cod_profe;
  String elec;
   CalificarE({super.key, required this.nie,required this.anio,required this.seccion, required this.nombres, required this.cod_profe, required this.elec});

  @override
  State<CalificarE> createState() => _CalificarEState();
}

class _CalificarEState extends State<CalificarE> {
  var resultado;
  bool isLoading=true;
  String info="";
  List nombre_act = [];
  List cod_act = [];
  List fecha=[];
  List date_final=[];
  List date=[];
  var n1 = 0;

  @override
  void initState() {
    super.initState();
    getActivitys();
  }
  Future<void> getActivitys() async {
    print(widget.nie);
      resultado = await showactAlum(widget.nie);
      if(resultado!="Error"){
        
    setState(() {
      isLoading=false;
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
          var codigo = dato["cod_act"];
          var nombre = dato["nombre_act"];
          var estado=dato["estado"];
          var dates_final=dato["date_final"];
          var dates=dato["date"];
          cod_act.add(codigo);
          nombre_act.add(nombre);
          if(estado!=""){
             fecha.add(estado);
          }else{
            fecha.add("estado:0");
          }
          date_final.add(dates_final);
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
    Size screenSize = MediaQuery.of(context).size; //contenedores
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth < 340? 8.00: screenWidth > 600? 28.00: 18.00; //titulos
    double textSize2 = screenWidth < 340? 10.0 : screenWidth > 600? 25.00: 15.00; //boton de guardado
        double textSize3 = screenWidth < 340? 10.0 : screenWidth > 600? 20.00: 10.00;
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondop.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Column(
              children: [
                Text("Se muestran actividades de el estudiante:\n${widget.nombres}",style: TextStyle(fontSize: textSize,fontStyle: FontStyle.italic),),
              Padding(padding: EdgeInsets.all(10)),
               SizedBox(
                  height: screenSize.height*0.03,
                ),
                Container(
                  width: screenSize.width*1,
                  color: Colors.black,
                  height: screenSize.height*0.003,
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
                  height: screenSize.height*0.02,
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
                                    builder: (context) => ShowRequestEstu(
                                      date: date[i],
                                      date_final: date_final[i],
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
                                child: Text(nombre_act[i],
                                    style: TextStyle(fontSize: textSize2,fontStyle: FontStyle.italic)),
                              ),
                              Positioned(
                                left: 260,
                                top: 20,
                                child: Column(
                                  children: [
                                    Text("Estado:",
                                    style: TextStyle(fontSize: textSize3,fontStyle: FontStyle.italic)
                                        ),
                                        Text("${fecha[i]}",
                                    style: TextStyle(fontSize: textSize3,fontStyle: FontStyle.italic)),
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