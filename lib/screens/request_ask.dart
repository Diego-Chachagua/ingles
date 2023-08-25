// ignore: file_names

import 'dart:convert';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:ingles/screens/verEstuAct.dart';
import '../developer/consultasf.dart';
import 'calificar_E.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: RespoderTaskEstu(
      nie: '',
      cod_act: '',
      nombre_act: '',
    ),
  ));
}

class RespoderTaskEstu extends StatefulWidget {
  
  final String nie;
  String nombre_act;
  String cod_act;
  RespoderTaskEstu(
      {super.key,
      required this.nie,

      required this.cod_act,
      required this.nombre_act});

  @override
  State<RespoderTaskEstu> createState() => _RespoderTaskEstuState();
}

class _RespoderTaskEstuState extends State<RespoderTaskEstu> {
    GlobalKey<FormState> formdeleteask = GlobalKey<FormState>();
    var codigo;
    var codigo2;
    var respuestaGame;
    final deleteask = TextEditingController();
    final respuestaG= TextEditingController();

  var audios = AudioPlayer();
  
 
 

  void playaudio(var sonido) async {
    try {
      if (sonido != null) {
        await audios.play(UrlSource(sonido)) as List;
        await Future.delayed(Duration(seconds: 120));
      }
    } catch (e) {
      _msError(context);
    }
  }

//variables para alto de cajas segun contenido de tablas
var contador=0;
  var n1;
  bool valor=false;
  bool valor2=false;
  bool valor3=false;
  bool valor4=false;
  var n3;
  var resultado;
  var resultado2;
  var respuestaunica;
  List respuesta = [];
  List pregunta = [];
  List imagen_p = [];
  List imagen = [];
  List audio = [];
  List audio_p = [];
  List respuesta_Game = [];
  List notas = [];
  List cod_res=[];



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
    setState(() {
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
          respuesta_Game.add(respuestas_G);
          pregunta.add(preguntas);
                     audio_p.add(audios_pre);
          
          if(imagenes_pre!=null){
            Uint8List bytes = base64.decode(imagenes_pre);// preguntas
          imagen_p.add(bytes);
          }else{
            imagen_p.add("");
          }
           if(respuestas_G!=null){
            respuestaunica=respuestas_G;
           }
          respuesta.add(respuestas);
          audio.add(audios);
          print(audio);

          imagen.add(imagenes);// respuestas
          
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
              leading: MaterialButton(
                onPressed: () {
                  
                },
                child: Center(child: Icon(Icons.arrow_back)),
              ),
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Column(children: [
              Container(
                width: 350,
                height: 70,
                child: Center(
                  child: Text(
                    'Se muestra la actividad: "${widget.nombre_act}"\nde el estudiante: ""',
                    style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
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
              for (i = 0; i < pregunta.length; i++)
                Column(
                  children: [
                    imagen_p[i] == "" &&
                            audio_p[i] == null &&
                            respuesta_Game[i] == null
                        ? 
                        //definicion de subrespuestas segun si imagen y audio estan vacios mostrar 
                        //para preguntas normales
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            
                              MaterialButton(
                                padding: EdgeInsets.all(10),
                                onPressed: () {
                                  _opAdk(context,codigo2);
                                },
                                child: Container(
                                  width: 320,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 199, 157, 236),
                                      border: Border.all(width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 220,
                                            child: TextField(
                                              enabled: false,
                                              maxLines: 3,
                                              decoration:
                                                  InputDecoration.collapsed(
                                                      hintText:
                                                          "${i} - ${pregunta[i]}"),
                                            ),
                                          ),
                                         
                                        ],
                                      ),
                                      Text("${codigo2 = cod_res[i]}",style: TextStyle(color: Colors.transparent),),
                                      Container(width: 280,height: 2,color: Colors.black,),
                                      Padding(padding: EdgeInsets.all(5)),
                                      //inicio de evaluacion de respuesta
                                      respuesta[i] == null &&  imagen[i] == null &&  audio[i] == null
                                          ? Container(
                                            width: 260,
                                            child: TextField(
                                          enabled: false,
                                          maxLines: 4,
                                          decoration:
                                              InputDecoration(
                                                border: OutlineInputBorder(),
                                                  hintText:
                                                     "codigo: ${cod_res[i]}\nRespuesta: vacia " ),
                                            ),
                                          )
                                          : imagen[i] == null  && audio[i]==null?
                                          Container(
                                            width: 260,
                                            child: TextField(
                                          enabled: false,
                                          maxLines: 4,
                                          decoration:
                                              InputDecoration(
                                                border: OutlineInputBorder(),
                                                  hintText:
                                                     "codigo: ${cod_res[i]}\nRespuesta: ${respuesta[i]} " ),
                                            ),
                                          ): audio[i]==null && respuesta[i]==null?       
                                                      Container(
                                                        width: 350,
                                                        height: 400,
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 20,
                                                                vertical: 5),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              width: 3),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          image: DecorationImage(
                                                              image:
                                                                  MemoryImage(
                                                                      imagen[i]),
                                                              fit:BoxFit.cover),
                                                        ),
                                                      ): imagen[i]==null && respuesta[i]==null?
                                                        Container(
                                                          height: 100,
                                                          decoration: BoxDecoration(border: Border.all(width: 2),borderRadius: BorderRadius.circular(10)),
                                                          child: Column(
                                                            
                                                            children: [
                                                              Text("Codigo: ${cod_res[i]}\nAudio de el estudiante:",style: TextStyle(fontStyle: FontStyle.italic),),
                                                              Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                ElevatedButton(
                                                                  style: ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStateProperty
                                                                            .resolveWith<
                                                                                Color?>(
                                                                      (Set<MaterialState>
                                                                          states) {
                                                                        if (states.contains(
                                                                            MaterialState
                                                                                .pressed)) {
                                                                          return Color
                                                                              .fromARGB(
                                                                                  255,
                                                                                  78,
                                                                                  76,
                                                                                  187); // Color cuando se presiona el botón
                                                                        }
                                                                        return Color.fromARGB(255,152,116,219); // Color predeterminado
                                                                      },
                                                                    ),
                                                                  ),
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      var n = audio.length;
                                                                      for (var a = 0; a < n;a++) {
                                                                        if (audio[a] =="no existe") {
                                                                        } else {
                                                                          playaudio(
                                                                              audio[a]);
                                                                        }
                                                                      }
                                                                    });
                                                                  },
                                                                  child: Container(
                                                                    child: Icon(Icons
                                                                        .play_arrow),
                                                                  ),
                                                                ),
                                                                ElevatedButton(
                                                                  style: ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStateProperty
                                                                            .resolveWith<
                                                                                Color?>(
                                                                      (Set<MaterialState>
                                                                          states) {
                                                                        if (states.contains(
                                                                            MaterialState
                                                                                .pressed)) {
                                                                          return Color
                                                                              .fromARGB(
                                                                                  255,
                                                                                  78,
                                                                                  76,
                                                                                  187); // Color cuando se presiona el botón
                                                                        }
                                                                        return Color
                                                                            .fromARGB(
                                                                                255,
                                                                                152,
                                                                                116,
                                                                                219); // Color predeterminado
                                                                      },
                                                                    ),
                                                                  ),
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      audios.stop();
                                                                    });
                                                                  },
                                                                  child: Container(
                                                                    child: Icon(
                                                                        Icons.stop),
                                                                  ),
                                                                ),
                                                              ],
                                                                                                              ),
                                                            ],
                                                          ),
                                                        ):
                                                      Padding(padding: EdgeInsets.all(1))     
                                                      //fin de deficion de respuesta y sus posibilidades     
                                    ],
                                  ),
                                ),
                                //si audio es nulo
                              )    
                            ]
                          )
                          //juego

                          //apartado para evaluar game
                        : imagen_p[i] == "" &&
                                audio_p[i] == null &&
                                respuesta_Game[i] != null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  
                                  Container(
                                    width: 320,
                                    decoration: BoxDecoration(
                                         color: Color.fromARGB(255, 199, 157, 236),
                                        border: Border.all(width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                             Container(
                                          width: 240,
                                          child: TextField(
                                            enabled: false,
                                            maxLines: 3,
                                            decoration:
                                                InputDecoration.collapsed(
                                                    hintText:
                                                        "${i} - ${pregunta[i]} "),
                                          ),
                                        ),
                                          ],
                                        ),
                                        Text("${codigo2 = cod_res[i]}",style: TextStyle(color: Colors.transparent),),
                                        Padding(padding: EdgeInsets.all(5)),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 150,
                                              child: 
                                              TextField(controller: respuestaG ,
                                              enabled: respuesta[i]!=null?
                                              false: true,
                                              decoration: InputDecoration(
                                                hintText: "Respuesta",
                                                border:OutlineInputBorder() ),),
                                            ),
                                            TextButton(onPressed: (){
                                              setState(() {
                                                 var respuestas= respuestaG.text;
                                              print(respuestas);
                                              if(respuestaunica!=respuestas){
                                                contador++;
                                                if(contador==1){
                                                  n1=Border.all(width: 2);
                                                }
                                                if(contador==2){
                                                  n3=Colors.black;
                                                }
                                                if(contador==3){
                                                  valor=true;//brazo izquierdo
                                                }
                                                if(contador==4){
                                                  valor2=true;
                                                }
                                                if(contador==5){
                                                  valor3=true;
                                                }
                                                if(contador==6){
                                                  valor4=true;

                                                  addrequestGame(codigo2,respuestas);

                                                }   
                                                 
                                              }else{
                                                //falta logica
                                                addrequestGame(codigo2,respuestas);
                                                final snackBar = SnackBar(
                                                  backgroundColor: Color.fromARGB(255, 155, 118, 214),
                                                  shape: Border.all(width: 1),
                                                  closeIconColor: Color.fromARGB(255, 230, 230, 230),
                                                  content: Row(
                                                  children: [
                                                    Text("Si coincide"),
                                                  ],
                                                ));
                                                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                              }
                                              });
                                              respuestaG.text="";
                                            }, child: Container(
                                              width: 100,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                border: Border.all(width: 1),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: Center(child: Text("Comprobar",style: TextStyle(color: Colors.black),))))
                                          ],
                                        ),
                                         Padding(padding: EdgeInsets.all(10)),
                                         //caja de muñeco
                                         //si aun no se responde
                                         respuesta[i]==null?
                                        Container(
                                          height: 350,
                                          decoration: BoxDecoration(
                                            border:Border.all(width: 1),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(padding: EdgeInsets.all(10)),
                                              Container(width: 150,height: 2,color: Colors.black,),
                                              Row(
                                                crossAxisAlignment:CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 60,),
                                            Column(
                                              children: [
                                                Container(width: 2,height: 30,color: Colors.black,),
                                                //cabeza
                                                 Container(width: 30,height:30 ,decoration: BoxDecoration(
                                                  border: n1,
                                                  borderRadius: BorderRadius.circular(50),
                                                 ),),
                                                 Row(
                                                   children: [
                                                    //brazo izquierdo
                                                    Container(width: 10,height: 60,
                                                    child: CustomPaint(
                                                      painter:valor==false?
                                                      DiagonalPainter3():
                                                      DiagonalPainter()
                                                      
                                                    ),),
                                                    //cuerpo
                                                     Container(width: 2,height: 100,color: n3,),
                                                     //brazo derecho
                                                     Container(width: 10,height: 60,
                                                    child: CustomPaint(
                                                      painter:  valor2==false?
                                                      DiagonalPainter3():
                                                      DiagonalPainter2()
                                                    ),),
                                                   ],
                                                 ),
                                                 //piernas
                                                 Row(
                                                  children: [
                                                    //pierna izquierda
                                                    Container(width: 10,height: 60,
                                                    child: CustomPaint(
                                                      painter: valor3==false?
                                                      DiagonalPainter3():
                                                      DiagonalPainter()
                                                    ),),
                                                    //pierna derecha
                                                     Container(width: 10,height: 60,
                                                    child: CustomPaint(
                                                      painter: valor4==false?
                                                      DiagonalPainter3():
                                                      DiagonalPainter2()
                                                    ),),
                                                  ],
                                                 )
                                              ],
                                            ),
                                           
                                            SizedBox(width: 120,),
                                          Container(width: 2,height: 300,color: Colors.black,),
                                          
                                        ],),
                                        Row(
                                            children: [
                                              SizedBox(
                                                width: 185,
                                              ),
                                              Container(
                                                width: 50,
                                                height: 2,
                                                color: Colors.black,
                                              )
                                            ],
                                          )
                                            ],
                                            
                                          ),
                                        ):
                                        //si ya se respondio
                                        Container(
                                          height: 350,
                                          decoration: BoxDecoration(
                                            border:Border.all(width: 1),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(padding: EdgeInsets.all(10)),
                                              Container(width: 150,height: 2,color: Colors.black,),
                                              Row(
                                                crossAxisAlignment:CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 60,),
                                            Column(
                                              children: [
                                                Container(width: 2,height: 30,color: Colors.black,),
                                                //cabeza
                                                 Container(width: 30,height:30 ,decoration: BoxDecoration(
                                                  border:Border.all(width: 2),
                                                  borderRadius: BorderRadius.circular(50),
                                                 ),),
                                                 Row(
                                                   children: [
                                                    //brazo izquierdo
                                                    Container(width: 10,height: 60,
                                                    child: CustomPaint(
                                                      painter:
                                                      DiagonalPainter()
                                                      
                                                    ),),
                                                    //cuerpo
                                                     Container(width: 2,height: 100,color: Colors.black,),
                                                     //brazo derecho
                                                     Container(width: 10,height: 60,
                                                    child: CustomPaint(
                                                      painter:  
                                                      DiagonalPainter2()
                                                    ),),
                                                   ],
                                                 ),
                                                 //piernas
                                                 Row(
                                                  children: [
                                                    //pierna izquierda
                                                    Container(width: 10,height: 60,
                                                    child: CustomPaint(
                                                      painter: 
                                                      DiagonalPainter()
                                                    ),),
                                                    //pierna derecha
                                                     Container(width: 10,height: 60,
                                                    child: CustomPaint(
                                                      painter: 
                                                      DiagonalPainter2()
                                                    ),),
                                                  ],
                                                 )
                                              ],
                                            ),
                                           
                                            SizedBox(width: 120,),
                                          Container(width: 2,height: 300,color: Colors.black,),
                                          
                                        ],),
                                        Row(
                                            children: [
                                              SizedBox(
                                                width: 185,
                                              ),
                                              Container(
                                                width: 50,
                                                height: 2,
                                                color: Colors.black,
                                              )
                                            ],
                                          )
                                            ],
                                            
                                          ),
                                        ),

                                        //container de muñeco
                                        
                                        Padding(padding: EdgeInsets.all(5)),
                                        Container(width: 290,height: 2,color: Colors.black,),
                                        
                                    Padding(padding: EdgeInsets.all(5)),
                                        respuesta[i]==null?
                                          Container(
                                          width: 260,
                                          child: TextField(
                                        enabled: false,
                                        maxLines: 4,
                                        decoration:
                                            InputDecoration(
                                              border: OutlineInputBorder(),
                                                hintText:
                                                   "codigo: ${cod_res[i]}\nRespuesta: vacia " ),
                                          ),
                                          )
                                        :
                                         Container(
                                          width: 250,
                                          child: TextField(
                                        enabled: false,
                                        maxLines: 4,
                                        decoration:
                                            InputDecoration(
                                              border: OutlineInputBorder(),
                                                hintText:
                                                   "codigo: ${cod_res[i]}\nRespuesta: ${respuesta[i]} " ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(5)),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                              //imagen
                            : audio_p[i] == null && imagen_p[i] != ""
                                ? MaterialButton(
                                   padding: EdgeInsets.all(10),
                                    onPressed: () {
                                       
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 320,
                                          decoration: BoxDecoration(
                                               color: Color.fromARGB(255, 199, 157, 236),
                                              border: Border.all(width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                   Container(
                                            width: 245,
                                            child: TextField(
                                              enabled: false,
                                              maxLines: 3,
                                              decoration:
                                                  InputDecoration.collapsed(
                                                      hintText:
                                                          "${i} - ${pregunta[i]}"),
                                            ),
                                          ),
                                          Text("${notas[i]}/10"),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              
                                                Container(
                                                  width: 340,
                                                  height: 400,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                    border:
                                                        Border.all(width: 3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    image: DecorationImage(
                                                        image: MemoryImage(
                                                            imagen_p[i]),
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                                Padding(padding: EdgeInsets.all(5)),
                                                Container(width: 290,height: 2,color: Colors.black,),
                                      Padding(padding: EdgeInsets.all(5)),
                                         respuesta[i] == null &&  imagen[i] == null &&  audio[i] == null
                                          ? Container(
                                            width: 260,
                                            child: TextField(
                                          enabled: false,
                                          maxLines: 4,
                                          decoration:
                                              InputDecoration(
                                                border: OutlineInputBorder(),
                                                  hintText:
                                                     "codigo: ${cod_res[i]}\nRespuesta: vacia " ),
                                            ),
                                          )
                                          : imagen[i] == null  && audio[i]==null?
                                          Container(
                                            width: 260,
                                            child: TextField(
                                          enabled: false,
                                          maxLines: 4,
                                          decoration:
                                              InputDecoration(
                                                border: OutlineInputBorder(),
                                                  hintText:
                                                     "codigo: ${cod_res[i]}\nRespuesta: ${respuesta[i]} " ),
                                            ),
                                          ): audio[i]==null && respuesta[i]==null?       
                                                      Container(
                                                        width: 340,
                                                        height: 400,
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 20,
                                                                vertical: 5),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              width: 3),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          image: DecorationImage(
                                                              image:
                                                                  MemoryImage(
                                                                      imagen[i]),
                                                              fit:BoxFit.cover),
                                                        ),
                                                      ): imagen[i]==null && respuesta[i]==null?
                                                       //respuesta audio imagen

                                                        Container(
                                                          height: 100,
                                                          decoration: BoxDecoration(border: Border.all(width: 2),borderRadius: BorderRadius.circular(10)),
                                                          child: Column(
                                                            children: [
                                                              Text("Codigo: ${cod_res[i]}\nAudio de el estudiante:"),
                                                              Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                ElevatedButton(
                                                                  style: ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStateProperty
                                                                            .resolveWith<
                                                                                Color?>(
                                                                      (Set<MaterialState>
                                                                          states) {
                                                                        if (states.contains(
                                                                            MaterialState
                                                                                .pressed)) {
                                                                          return Color
                                                                              .fromARGB(
                                                                                  255,
                                                                                  78,
                                                                                  76,
                                                                                  187); // Color cuando se presiona el botón
                                                                        }
                                                                        return Color.fromARGB(255,152,116,219); // Color predeterminado
                                                                      },
                                                                    ),
                                                                  ),
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      var n = audio.length;
                                                                      for (var a = 0; a < n;a++) {
                                                                        if (audio[a] =="no existe") {
                                                                        } else {
                                                                          playaudio(
                                                                              audio[a]);
                                                                        }
                                                                      }
                                                                    });
                                                                  },
                                                                  child: Container(
                                                                    child: Icon(Icons
                                                                        .play_arrow),
                                                                  ),
                                                                ),
                                                                ElevatedButton(
                                                                  style: ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStateProperty
                                                                            .resolveWith<
                                                                                Color?>(
                                                                      (Set<MaterialState>
                                                                          states) {
                                                                        if (states.contains(
                                                                            MaterialState
                                                                                .pressed)) {
                                                                          return Color
                                                                              .fromARGB(
                                                                                  255,
                                                                                  78,
                                                                                  76,
                                                                                  187); // Color cuando se presiona el botón
                                                                        }
                                                                        return Color
                                                                            .fromARGB(
                                                                                255,
                                                                                152,
                                                                                116,
                                                                                219); // Color predeterminado
                                                                      },
                                                                    ),
                                                                  ),
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      audios.stop();
                                                                    });
                                                                  },
                                                                  child: Container(
                                                                    child: Icon(
                                                                        Icons.stop),
                                                                  ),
                                                                ),
                                                              ], ),
                                                            ],
                                                          ),
                                                        ):
                                                      Padding(padding: EdgeInsets.all(1))
                                            
                                               
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : audio_p[i] != null && imagen_p[i] == ""
                                    ? MaterialButton(
                                        onPressed: () {
                                            _opAdk(context,codigo2);
                                        },
                                        child: Container(
                                            width: 320,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 5),
                                            decoration: BoxDecoration(
                                                  color: Color.fromARGB(255, 199, 157, 236),
                                                border: Border.all(width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Column(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.all(5)),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                     Container(
                                            width: 240,
                                            child: TextField(
                                              enabled: false,
                                              maxLines: 3,
                                              decoration:
                                                  InputDecoration.collapsed(
                                                      hintText:
                                                          "${i} - ${pregunta[i]}"),
                                            ),
                                          ),
                                          Text("${notas[i]}/10"),
                                                  ],
                                                ),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.all(10)),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .resolveWith<
                                                                    Color?>(
                                                          (Set<MaterialState>
                                                              states) {
                                                            if (states.contains(
                                                                MaterialState
                                                                    .pressed)) {
                                                              return Color.fromARGB(
                                                                  255,
                                                                  78,
                                                                  76,
                                                                  187); // Color cuando se presiona el botón
                                                            }
                                                            return Color.fromARGB(
                                                                255,
                                                                152,
                                                                116,
                                                                219); // Color predeterminado
                                                          },
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          var n = audio_p.length;
                                                          for (var a = 0;
                                                              a < n;
                                                              a++) {
                                                            if (audio_p[a] ==
                                                                null) {
                                                            } else {
                                                              playaudio(
                                                                  audio_p[a]);
                                                            }
                                                          }
                                                        });
                                                      },
                                                      child: Container(
                                                        child: Icon(
                                                            Icons.play_arrow),
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .resolveWith<
                                                                    Color?>(
                                                          (Set<MaterialState>
                                                              states) {
                                                            if (states.contains(
                                                                MaterialState
                                                                    .pressed)) {
                                                              return Color.fromARGB(
                                                                  255,
                                                                  78,
                                                                  76,
                                                                  187); // Color cuando se presiona el botón
                                                            }
                                                            return Color.fromARGB(
                                                                255,
                                                                152,
                                                                116,
                                                                219); // Color predeterminado
                                                          },
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          audios.stop();
                                                        });
                                                      },
                                                      child: Container(
                                                        child: Icon(Icons.stop),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                //añadir codigo
                                                Text("${codigo2 = cod_res[i]}",style: TextStyle(color: Colors.transparent),),
                                                Padding(padding: EdgeInsets.all(10)),
                                                Container(width: 290,height: 2,color: Colors.black,),
                                      Padding(padding: EdgeInsets.all(5)),
                                         respuesta[i] == null &&  imagen[i] == null &&  audio[i] == null
                                          ? Container(
                                            width: 260,
                                            child: TextField(
                                          enabled: false,
                                          maxLines: 4,
                                          decoration:
                                              InputDecoration(
                                                border: OutlineInputBorder(),
                                                  hintText:
                                                     "codigo: ${cod_res[i]}\nRespuesta: vacia " ),
                                            ),
                                          )
                                          : imagen[i] == null  && audio[i]==null?
                                          Container(
                                            width: 260,
                                            child: TextField(
                                          enabled: false,
                                          maxLines: 4,
                                          decoration:
                                              InputDecoration(
                                                border: OutlineInputBorder(),
                                                  hintText:
                                                     "codigo: ${cod_res[i]}\nRespuesta: ${respuesta[i]} " ),
                                            ),
                                          ): audio[i]==null && respuesta[i]==null?   

                                                      Column(
                                                        children: [
                                                          Text("${cod_res[i]}",style: TextStyle(fontStyle: FontStyle.italic),),
                                                          Text("Imagen subida por el estudiante:"),
                                                          Container(
                                                            width: 340,
                                                            height: 400,
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal: 20,
                                                                    vertical: 5),
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  width: 3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(5),
                                                              image: DecorationImage(
                                                                  image:
                                                                      MemoryImage(
                                                                          imagen[i]),
                                                                  fit:BoxFit.cover),
                                                            ),
                                                          ),
                                                        ],
                                                      ): imagen[i]==null && respuesta[i]==null?
                                                        Container(
                                                          height: 100,
                                                          decoration: BoxDecoration(border: Border.all(width: 2),borderRadius: BorderRadius.circular(10)),
                                                          child: Column(
                                                            children: [
                                                              Text("Codigo: ${cod_res[i]}\nAudio del estudiante:",style: TextStyle(fontStyle: FontStyle.italic),),
                                                              Padding(padding: EdgeInsets.all(5)),
                                                              Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                ElevatedButton(
                                                                  style: ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStateProperty
                                                                            .resolveWith<
                                                                                Color?>(
                                                                      (Set<MaterialState>
                                                                          states) {
                                                                        if (states.contains(
                                                                            MaterialState
                                                                                .pressed)) {
                                                                          return Color
                                                                              .fromARGB(
                                                                                  255,
                                                                                  78,
                                                                                  76,
                                                                                  187); // Color cuando se presiona el botón
                                                                        }
                                                                        return Color.fromARGB(255,152,116,219); // Color predeterminado
                                                                      },
                                                                    ),
                                                                  ),
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      var n = audio.length;
                                                                      for (var a = 0; a < n;a++) {
                                                                        if (audio[a] ==null) {
                                                                        } else {
                                                                          playaudio(
                                                                              audio[a]);
                                                                        }
                                                                      }
                                                                    });
                                                                  },
                                                                  child: Container(
                                                                    child: Icon(Icons
                                                                        .play_arrow),
                                                                  ),
                                                                ),
                                                                ElevatedButton(
                                                                  style: ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStateProperty
                                                                            .resolveWith<
                                                                                Color?>(
                                                                      (Set<MaterialState>
                                                                          states) {
                                                                        if (states.contains(
                                                                            MaterialState
                                                                                .pressed)) {
                                                                          return Color
                                                                              .fromARGB(
                                                                                  255,
                                                                                  78,
                                                                                  76,
                                                                                  187); // Color cuando se presiona el botón
                                                                        }
                                                                        return Color
                                                                            .fromARGB(
                                                                                255,
                                                                                152,
                                                                                116,
                                                                                219); // Color predeterminado
                                                                      },
                                                                    ),
                                                                  ),
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      audios.stop();
                                                                    });
                                                                  },
                                                                  child: Container(
                                                                    child: Icon(
                                                                        Icons.stop),
                                                                  ),
                                                                ),
                                                              ],
                                                                                                              ),
                                                            ],
                                                          ),
                                                        ):
                                                      Padding(padding: EdgeInsets.all(1))
                                              ],
                                            )),
                                      )
                                    : Padding(padding: EdgeInsets.all(10)),
                    //espacio para definición de contenedor para mostrar historial
                  ],
                ),
                Padding(padding: EdgeInsets.all(20))
            ]))));
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
              height: 190,
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

   void _opAdk(BuildContext context,var cod) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("Califica la respuesta"),
            content: Container(
              height: 155,
              child: Column(
                children: [
                  MaterialButton(onPressed: (){

                  },
                  child: Container(
                    child:Row(
                      children: [
                        Text("Responder"),
                      ],
                    ) ),)
                ],
              )
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
                        width: 70,
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
                                "NO",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.arrow_back)
                            ],
                          ),
                        ),
                      )),
                  MaterialButton(
                      onPressed: () {
                          print(cod);
                         
                      },
                      child: Container(
                         width: 70,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("SI", style: TextStyle(color: Colors.white)),
                          Icon(Icons.navigate_next_outlined)
                        ],
                      ))),
                ],
              )
            ],
          );
        });
  }

  void _messaje(BuildContext parentContext) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("Sugerencia"),
            content: Container(
              height: 172,
              child: Column(
                children: [
                  Text(
                      "Si en dado caso no se previsualiza un cambio en la pantalla,"),
                  Text(
                      "podria ser necesario el recargar la pantalla para poder visualizar los cambios realizados anteriormente"),
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

//brazo izquierdo y pierna izquierda
class DiagonalPainter extends CustomPainter {
   @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    
    canvas.drawLine(Offset(size.width, 0), Offset(-30, 30), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}
//brazo derecho y pierna derecha
class DiagonalPainter2 extends CustomPainter {
   @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    
   canvas.drawLine(Offset(0, 0), Offset(40, 30), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}

//no mostrar
class DiagonalPainter3 extends CustomPainter {
   @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}