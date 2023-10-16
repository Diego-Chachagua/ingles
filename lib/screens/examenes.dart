// ignore: file_names
import 'package:flutter/material.dart';
import 'package:ingles/developer/consultaso.dart';
import 'package:ingles/screens/request_ask_exam.dart';

import '../developer/consultasf.dart';
import '../main.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: Examenes(grado: '', nie: '', seccion: '',),
  ));
}

class Examenes extends StatefulWidget {
  final String grado;
  final String seccion;
  final String nie;
  const Examenes({super.key, required this.grado, required this.seccion, required this.nie});

  @override
  State<Examenes> createState() => _ExamenesState();
}

class _ExamenesState extends State<Examenes> {
var reslt;
List<String> examen= [];
List<String> cod= [];
List date=[];
bool isLoading=true;
String info="";

  @override
void initState(){
  super.initState();
  getActivitys();
}
Future<void> getActivitys()async{
 reslt = await examenes(widget.grado,widget.seccion);
    if(reslt!="Error"){
    if (reslt!="noExisten"){
      for (var i = 0; i < reslt.length; i++){
    var dato =reslt[i];
    print(dato["nombre_p"]);
    print(dato["cod_pr"]);

  // ignore: non_constant_identifier_names
          var nom_tem = dato["nombre_p"];
          // ignore: non_constant_identifier_names
          var id_tem = dato["cod_pr"];
          var dates=dato["date"];

         

setState(() {
  isLoading=false;
  // Actualizar las listas con los datos obtenidos
  examen.add(nom_tem);
  cod.add(id_tem);
  date.add(dates);


});
  }
    }
    }else{
      setState(() {
        isLoading=false;
        info="Error";
      });
    }
}


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;//contenedores
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth < 340 ? 8.00 : screenWidth >=600? 30.00 : 18.00;//titulos
    double textSize2 = screenWidth < 340 ? 10.0 : screenWidth >=600 ? 40.00 : 15.00;//subtitulos
    double textSize3 = screenWidth < 340 ? 10.0 : screenWidth >=600 ? 30.00 : 17.00;//preguntas
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/lila.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar:  PreferredSize(
    preferredSize: Size.fromHeight(130),
    child: AppBar(
      centerTitle: true,
      //MODIFICACION DEL CONTAINER DEL APPBAR
  backgroundColor: Colors.red,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50)),
    ),
    //MODIFICACION DE LA IMAGEN DEL APPBAR
  flexibleSpace: ClipRRect(
     child: Container(
    decoration: BoxDecoration(
      image: DecorationImage(
      image: AssetImage("assets/Banner_app.png"),
      fit: BoxFit.fill

      ),
     
    ),
     )
  ),
    )
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Definicion de la linea
              SizedBox(height: screenSize.height*0.005,),
              Container(
              height: screenSize.height*0.005,
              width: screenSize.width*1,
              color: const Color.fromARGB(255, 0, 0, 0),
              ),
              //Apartado del cuadro con imagen
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
                Padding(padding: EdgeInsets.all(0)),
              //Apartado del cuadro con imagen
              for (var i = 0; i < examen.length; i++)
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, right: 20),
                       height: screenSize.height*0.15,
                        width: screenSize.width*0.25,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                          image: AssetImage('assets/xam.png'),),
                          
                          ),
                        ),
                        Container(
                          //Apartado del boton
                          margin: EdgeInsets.only(top: 20),
                          height: screenSize.height*0.07,
                          width: screenSize.width*0.6,
                          color: const Color.fromARGB(255, 135, 8, 160),
                          child:  MaterialButton(onPressed: () async{
                              dynamic respuesta = await comprobarexamen(cod[i],widget.nie);//cambiar esto
                    var estado;
                    for(var n =0; n<respuesta.length;n++){
                      var dato=respuesta[n];
                      estado=dato["estado"];
                    }      
                    if(estado == "Finalizado"){
                       _mensajeUsu(context);
                    } else {
                      changeStateExam(cod[i],"en proceso",widget.nie);
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  RespoderTaskEstuExam(
                    nie: widget.nie,
                    cod_act: cod[i],
                    nombre_act: examen[i],
                    date: date[i],
                  )),
                   );
                      }
                    
                          },
                          child: Center(child: Text(examen[i], style: TextStyle(fontSize: textSize3, color: Colors.white))),

                            
                          

                          )
                          ),
        
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mensajeUsu(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("REALIZADO"),
            content: const Text(
                'Ya realizaste esta tarea'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    
                  },
                  child: const Text('Aceptar'),
                ),
              )
            ],
          );
        });
  }

  void _mensaje(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("REALIZADO"),
            content:
                const Text('Ya realizaste esta tarea'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text('Aceptar'),
                ),
              )
            ],
          );
        });
  }

  
}
