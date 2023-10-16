// ignore: file_names

import 'dart:convert';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:ingles/screens/verEstuAct.dart';
import '../developer/consultasf.dart';
import 'calificar_E.dart';
import 'img_zoom.dart';
import 'listen_audio.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: ShowRequestEstu(
      nie: '',
      anio: '',
      seccion: '',
      nombres: '',
      cod_profe: '',
      cod_act: '',
      nombre_act: '',
      elec: '',
      date_final: '',
      date: '',
    ),
  ));
}

class ShowRequestEstu extends StatefulWidget {
  String nombres;
  final String nie;
  String anio;
  String seccion;
  String cod_profe;
  String nombre_act;
  String cod_act;
  String elec;
  String date_final;
  String date;
  ShowRequestEstu(
      {super.key,
      required this.nie,
      required this.anio,
      required this.seccion,
      required this.nombres,
      required this.cod_profe,
      required this.cod_act,
      required this.nombre_act,
      required this.date_final,
      required this.date,
      required this.elec});

  @override
  State<ShowRequestEstu> createState() => _ShowRequestEstuState();
}

class _ShowRequestEstuState extends State<ShowRequestEstu> {
    GlobalKey<FormState> formdeleteask = GlobalKey<FormState>();
    final deleteask = TextEditingController();
    final nota= TextEditingController();

  var audios = AudioPlayer();
  var n1 = 0;
  void playaudio(var sonido) async {
    try {
      if (sonido != null) {
        await audios.play(UrlSource(sonido));
      }
    } catch (e) {
      print("Error [002] $e");
      _msError(context);
    }
  }

//variables para alto de cajas segun contenido de tablas
  bool isLoading=true;
  String info="";
  var resultado;
  var resultado2;
  List respuesta = [];
  List pregunta = [];
  List imagen_p = [];
  List imagen = [];
  List audio = [];
  List audio_p = [];
  List respuesta_Game = [];
  List notas = [];
  List cod_res=[];
  double duracion=0.0;
  List position=[];


  var i = 0;

  @override
  void initState() {
    super.initState();
    getActivitys();
  }

  Future<void> getActivitys() async {
    //resultado = await showactAlum(widget.nie);
    print(widget.cod_act);
    resultado2 = await showAskAlum(widget.cod_act,widget.nie);
    if(resultado2 !="Error"){
    setState(() {
      isLoading=false;
      if (resultado != "noExisten") {
        var n = resultado2.length;
        if (n == null) {
          n = 1;
        }
        pregunta.clear();
        respuesta.clear();
        imagen_p.clear();
        imagen.clear();
        audio.clear();
        audio_p.clear();
        respuesta_Game.clear();
        notas.clear();
        cod_res.clear();
        for (var i = 0; i < n; i++) {
          var dato2 = resultado2[i];
          //espacio para preguntas
          var preguntas = dato2["preguntas"];
          var audios_pre = dato2["audio"];
          var imagenes_pre = dato2["imagen"];
          var respuestas_G = dato2["respuesta_G"];
          var respuestas = dato2["respuestas"];
          var audios = dato2["audio_R"];
          var imagenes = dato2["imagen_R"];
          var nota = dato2["notas"];
          var codigo=dato2["cod_r"];
          if(codigo!=null){
            cod_res.add(codigo);
            print(cod_res);

          }else{
            cod_res.add("0");
          }
          if (nota != null) {
            notas.add(nota);
          } else {
            notas.add("0");
          }
          //espacio para preguntas
          if(respuestas_G!=null){
            respuesta_Game.add(respuestas_G);
          }else{
            respuesta_Game.add("");
          }
          pregunta.add(preguntas);
          audio_p.add(audios_pre);
          if(imagenes_pre!=null){
           Uint8List bytes = base64.decode(imagenes_pre);// preguntas
          imagen_p.add(bytes);
          }else{
          imagen_p.add("");
          }  
          respuesta.add(respuestas);
          audio.add(audios);
          if(imagenes!=null){
            Uint8List bytes = base64.decode(imagenes);// preguntas
            imagen.add(bytes);
          }else{
            imagen.add("");
          }
          // respuestas 
        }
      }
    });
    }else{
      setState(() {
        info="Error";
        isLoading=false;
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
              image: AssetImage('assets/fondop.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(children: [
                Center(
              child: Container(
              width: screenSize.width*0.9,
              height: screenSize.height*0.15,
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
              child:
              Column(
                children: [
                  Text(
                    'Se muestra la actividad: "${widget.nombre_act}"\nde el estudiante: "${widget.nombres}"',
                    style: TextStyle(fontSize: textSize, fontStyle: FontStyle.italic),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                Text("Fecha asignada: ${widget.date} ",style: TextStyle(fontSize: textSize2),),
                Text("Fecha de entrega: ${widget.date_final}",style: TextStyle(fontSize: textSize2)),
                ],
              ),
                ),
                ),
                SizedBox(
              height: screenSize.height*0.05,
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
                Container(        
              width: screenSize.width*0.9,
              height: screenSize.height*0.662,
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 137, 110, 211),
              ),
              child: Column(
                children: [
                  Text("Respuestas:",style: TextStyle(fontSize: textSize2)),
                  Padding(padding: EdgeInsets.all(1)),
                  Container(
                    width: screenSize.width*0.9,
                    height: screenSize.height*0.63,
                    child: Container(
              width: screenSize.width*1,
              height: screenSize.height*0.5,
               child: ListView.builder(
                itemCount: cod_res.length,
                itemBuilder: (BuildContext context, int index) {
                 return
                 Column(
                  children: [
                    MaterialButton(
                      onPressed: (){
                        print(cod_res[index]);
                        _addNote(context,cod_res[index]);
                      },
                      child: Container(
                        width: screenSize.width*0.8,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 149, 113, 247),
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Column(
                          children: [  
                            Text(pregunta[index],textAlign: TextAlign.center,style: TextStyle(fontSize: textSize2)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Puntuación: "+notas[index],style: TextStyle(fontSize: textSize2)),
                                Padding(padding: EdgeInsets.all(5))
                              ],
                            ),  
                            imagen_p[index]!=""?
                            MaterialButton(
                              onPressed: (){
                                 Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => Imagen(imagen: imagen_p[index],)),
                                    );
                              },
                              child: Container(
                                width: screenSize.width*0.5,
                                height: screenSize.height*0.2,
                                decoration: BoxDecoration(
                                  image: DecorationImage(fit: BoxFit.cover,
                                    image:MemoryImage(imagen_p[index])),
                                ),
                              ),
                            ):  
                            audio_p[index]!=null?
                           MaterialButton(
                            onPressed: (){
                              Navigator.push(
                                       context,
                                        MaterialPageRoute(
                                         builder: (context) => Audio(audio: audio_p[index],title: pregunta[index],)),
                                         );
                            },
                             child: Container(
                              width: screenSize.width*0.6,
                              height: screenSize.height*0.05,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 185, 159, 255),
                                border:Border.all(width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Text("Escuchar audio",style: TextStyle(fontSize: textSize2)),
                                Icon(Icons.arrow_right)
                              ],),
                             ),
                           )
                            :
                          respuesta_Game[index]!=""?
                            Container(
                               width: screenSize.width*0.5,
                              height: screenSize.height*0.05,
                              child: Text("Respuesta del juego: "+respuesta_Game[index],style: TextStyle(fontSize: textSize2)),
                            ):
                             Padding(padding: EdgeInsets.all(1)),
                             Padding(padding: EdgeInsets.all(5)),
                             Text("Respuesta:",style: TextStyle(fontSize: textSize2)),
                             respuesta[index]!=null?
                             Container(
                              padding: EdgeInsets.all(5),
                              width: screenSize.width*0.6,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 185, 159, 255),
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(child: Text(respuesta[index],style: TextStyle(fontSize: textSize2))))
                              :
                             imagen[index]!=""?
                              MaterialButton(
                            onPressed: (){
                              Navigator.push(
                                          context,
                                           MaterialPageRoute(
                                           builder: (context) => Imagen(imagen: imagen[index],)),
                                           );
                            },
                             child: Container(
                              width: screenSize.width*0.6,
                              height: screenSize.height*0.05,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 185, 159, 255),
                                border:Border.all(width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Text("Ver Imagen",style: TextStyle(fontSize: textSize2)),
                                Icon(Icons.arrow_right)
                              ],),
                             ),
                           ):
                             audio[index]!=null?
                              MaterialButton(
                            onPressed: (){
                              Navigator.push(
                                       context,
                                        MaterialPageRoute(
                                         builder: (context) => Audio(audio: audio[index],title: pregunta[index],)),
                                         );
                            },
                             child: Container(
                              width: screenSize.width*0.6,
                              height: screenSize.height*0.05,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 185, 159, 255),
                                border:Border.all(width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Text("Escuchar audio",style: TextStyle(fontSize: textSize2)),
                                Icon(Icons.arrow_right)
                              ],),
                             ),
                           ):
                             Text(""),
                          ],
                        )),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(screenSize.height*0.01))//divicion de cada contenedor generado por el list view
                  ],
                 );
                }
               )),
                  )
                ],
              ),
                ),
              ]),
            )));
  }

  void _msError(BuildContext parentContext) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("ERROR[002]"),
            content: Container(
              height: 160,
              child: Column(
                children: [
                  Text(
                      "-No se puede reproducir el audio debido a un error en la URL\n-Verifique que la URL ingresada sea valida\n-Elimine el audio y vuelva a intentarlo",
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

   void _addNote(BuildContext context, var code) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("Califica la respuesta"),
            content: Container(
              height: 70,
              child: Form(
                  key: formdeleteask,
                  child: Column(
                    children: [
                        TextFormField(
                        textAlign: TextAlign.center,
                        validator: (String? value) {
                          int valor=int.parse(value!);
                          if (value.isEmpty) {
                            return "Campo requerido";
                          }else if(valor > 10){
                            return "Ingrese un número menor/igual 10";
                          }else if(valor<0){
                            return "Ingrese un número mayor/igual a 0";
                          }
                        },
                        controller: nota,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Calificacion 0-10",
                        ),
                      ),
                    ],
                  )),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Cancelar",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.cancel_rounded)
                            ],
                          ),
                        ),
                      )),
                  MaterialButton(
                      onPressed: () {
                        if (formdeleteask.currentState!.validate()) {
                          var notas=nota.text;
                           addNotas(notas,code,widget.cod_act,widget.nie);
                           Navigator.pop(context);
                            getActivitys();  
                            nota.text="";  
                             final snackBar = SnackBar(
                                    content: Row(
                                      children: [
                                        Text(
                                            "Si no se observan cambios prueba con"),
                                        TextButton(onPressed: (){
                                            getActivitys();
                                        }, child: Center(child: Text("Actualizar"),))
                                      ],
                                    ));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                        }         
                      },
                      child: Container(
                         width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Aceptar", style: TextStyle(color: Colors.white)),
                          Icon(Icons.check_sharp)
                        ],
                      ))),
                ],
              )
            ],
          );
        });
  }
    @override
  void dispose() {
    audios.dispose();
    super.dispose();
  }
}