// ignore: file_names

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ingles/screens/use_url.dart';
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
    GlobalKey<FormState> formchangeask = GlobalKey<FormState>();
    GlobalKey<FormState> addsound = GlobalKey<FormState>();
    GlobalKey<FormState> formKey =  GlobalKey<FormState>();
    var codigo;
    var codigo2;
    var respuestaGame;
    final deleteask = TextEditingController();
    final respuestaG= TextEditingController();
    final changeask = TextEditingController();
    final cod_changeask = TextEditingController();
    final namesound = TextEditingController();
    final url = TextEditingController();
    final nameask = TextEditingController();

//funcion para añadir imagen
File? img;
 Future setimage(var cod) async {
    var picturefile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (picturefile != null) {
        img = File(picturefile.path);
        addrequestImagen(cod,img,widget.nie);
      } else {
        setState(() {
          final snackBar =
              SnackBar(content: Text("No se agrego ninguna imagen"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      }
    });
  }
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
  var ask;
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
  List imagen_cod=[];
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
        imagen_cod.clear();
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
          if(imagenes!=null){
            Uint8List bytes = base64.decode(imagenes);// respuestas
            imagen.add(bytes);
          }else{
            imagen.add("");
          }
          imagen_cod.add(imagenes);
          
          // respuestas
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
            body: RefreshIndicator(child:SingleChildScrollView(
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
                                  _opEdit(context);
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
                                      
                                      Container(width: 280,height: 2,color: Colors.black,),
                                      Padding(padding: EdgeInsets.all(5)),
                                      //inicio de evaluacion de respuesta
                                      respuesta[i] == null &&  imagen_cod[i] == null &&  audio[i] == null
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
                                          : imagen_cod[i] == null  && audio[i]==null?
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
                                                      SizedBox(
                                                        child: Column(
                                                          children: [
                                                            Text("${cod_res[i]}"),
                                                            if(i < imagen.length)
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
                                                                            imagen[i]
                                                                        ),
                                                                    fit:BoxFit.cover),
                                                              ) 
                                                            ),
                                                          ],
                                                        ),
                                                      )

                                                      : imagen_cod[i]==null && respuesta[i]==null?
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
                                                  getActivitys();
                                                  addrequestGame(codigo2,respuestas);

                                                }   
                                                 
                                              }else{
                                                //falta logica
                                                addrequestGame(codigo2,respuestas);
                                                getActivitys();
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
                                       _opEdit(context);
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
                                         respuesta[i] == null &&  imagen_cod[i] == null &&  audio[i] == null
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
                                          : imagen_cod[i] == null  && audio[i]==null?
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
                                                      ): imagen_cod[i]==null && respuesta[i]==null?
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
                                          _opEdit(context);
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
                                                Padding(padding: EdgeInsets.all(10)),
                                                Container(width: 290,height: 2,color: Colors.black,),
                                      Padding(padding: EdgeInsets.all(5)),
                                         respuesta[i] == null &&  imagen_cod[i] == null &&  audio[i] == null
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
                                          : imagen_cod[i] == null  && audio[i]==null?
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
                                                      ): imagen_cod[i]==null && respuesta[i]==null?
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
                Padding(padding: EdgeInsets.all(20)),
                  MaterialButton(onPressed: (){
                                         changeState(widget.cod_act,"Finalizado",widget.nie);
                                         Navigator.pop(context);
                                    },
                                    child: 
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      width: 100,
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Finalizar"),
                                          Icon(Icons.check)
                                        ],
                                      ),
                                    ),),
               Padding(padding: EdgeInsets.all(40))
                
            ]
            )
            ),  onRefresh: getActivitys)
            
           
            ));
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
   //menu para editar una pregunta
   void _opEdit(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("¿De que manera deseas responder?"),
            content: Container(
                height: 270,
                child: Column(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        _requestAsk(context);
                      },
                      child: Container(
                        width: 190,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Responder con pregunta"),
                            Icon(Icons.edit),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    MaterialButton(
                      onPressed: () {
                        _elegirImg(context);
                      },
                      child: Container(
                        width: 190,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Responder con imagen"),
                            Icon(Icons.image),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    MaterialButton(
                      onPressed: () {
                         _elegirSound(context);
                      },
                      child: Container(
                        width: 190,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Responder con audio"),
                            Icon(Icons.mic),
                          ],
                        ),
                      ),
                    ),
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
                    )
                  ],
                )),
          );
        });
  }
   //espacio para la opcion de responder con pregunta
   void _requestAsk(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shadowColor: Color.fromARGB(255, 170, 63, 233),
              backgroundColor: Color.fromARGB(255, 196, 158, 218),
              title: const Text("Escribe codigo y tu respuesta"),
              content: Container(
                  height: 280,
                  child: Form(
                    key: formchangeask,
                    child: Column(
                      children: [
                        Container(
                          width: 200,
                          child: TextFormField(
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Campo requerido";
                              }
                            },
                            controller: cod_changeask,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Codigo",
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Center(
                          child: Container(
                            width: 200,
                            height: 108,
                            child: TextFormField(
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Campo requerido";
                                }
                              },
                              controller: changeask,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              maxLength: 40,
                              maxLines: 2,
                              decoration: const InputDecoration(
                                hintText: "Escribir respuesta",
                                hintStyle: TextStyle(fontSize: 15),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      changeask.text = "";
                                      cod_changeask.text = "";
                                      
                                      //añadir funcion sql
                                      
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancelar",
                                        style: TextStyle(color: Colors.black))),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    if (formchangeask.currentState!
                                        .validate()) {
                                      var ask2 = changeask.text;
                                      var cod = cod_changeask.text;
                                      changeState(widget.cod_act,"en proceso",widget.nie);
                                     addrequestAsk(cod,ask2,widget.nie);//funcion para agregar respuesta a la pregunta
                                      cod_changeask.text="";
                                      changeask.text = "";
                                      Navigator.pop(context);
                                      //espacio para actializar pantalla
                                    }
                                  },
                                  child: const Text(
                                    'Aceptar',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )));
        });
  }

  //espacio para responder con imagen
  void _elegirImg(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("Seleccionar una imagen"),
            content: Container(
              width: 100,
              height: 240,
              child: Column(
                children: [
                  Container(
                      width: 150,
                      height: 100,
                      child: Form(
                        key: formKey,
                        child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "campo requerido";
                          }
                        },
                        controller: nameask,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        maxLines: 2,
                        maxLength: 40,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "codigo",
                            hintStyle: TextStyle(fontSize: 15)),
                      ) )
                     ),
                  MaterialButton(
                    onPressed: () {
                      var ask = nameask.text;
                      if (formKey.currentState!.validate()) {
                         setimage(ask);//funcion para cargar imagen
                        nameask.text = "";
                        Navigator.pop(context);
                        final snackBar = SnackBar(
                            backgroundColor: Color.fromARGB(255, 155, 118, 214),
                            shape: Border.all(width: 1),
                            closeIconColor: Color.fromARGB(255, 230, 230, 230),
                            content: Row(
                              children: [
                                Text("Podria ser necesario recargar"),
                                MaterialButton(
                                  onPressed: () {
                                    _messaje(context);
                                  },
                                  child: Text("¿mas?",style: TextStyle(fontSize: 15),),
                                )
                              ],
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    minWidth: 40,
                    height: 70,
                    child: Container(
                      width: 160,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Elegir imagen"),
                          Icon(Icons.image)
                        ],
                      )),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 150,
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
                  )
                ],
              ),
            ),
          );
        });
  }
  //espacio para responder con microfono
  void _elegirSound(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            alignment: AlignmentDirectional.center,
            scrollable: true,
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("Responder con sonido/audio"),
            content: Container(
              height: 420,
              child: Column(
                children: [
                  Container(
                      width: 150,
                      height: 200,
                      child: Form(
                        key: addsound,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "campo requerido";
                                }
                              },
                              controller: namesound,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.number,
                              maxLines: 2,
                              maxLength: 40,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "codigo",
                                  hintStyle: TextStyle(fontSize: 15)),
                            ),
                            TextFormField(
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "campo requerido";
                                }
                              },
                              controller: url,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              maxLines: 2,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Ingresar URL",
                                  helperText: "Usar una URL directa",
                                  hintStyle: TextStyle(fontSize: 15)),
                            ),
                          ],
                        ),
                      )),
                  Padding(padding: EdgeInsets.all(10)),
                  MaterialButton(
                    onPressed: () {
                      var ask = namesound.text;
                      var url_s = url.text;
                      if (addsound.currentState!.validate()) {
                        addrequestsound(ask,url_s,widget.nie);
                        namesound.text = "";
                        url.text = "";
                        //añadir funcion para consulta sql
                        Navigator.pop(context);
                        final snackBar = SnackBar(
                            backgroundColor: Color.fromARGB(255, 155, 118, 214),
                            shape: Border.all(width: 1),
                            closeIconColor: Color.fromARGB(255, 230, 230, 230),
                            content:
                                Text("Es necesario refrescar la pantalla"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Añadir"),
                          Icon(Icons.music_note),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 150,
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
                  Padding(padding: EdgeInsets.all(5)),
                  Text("¿Como usar una URL directa?"),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UseURL(       
                                )),
                      );
                    },
                    child: Text("Presiona aqui"),
                  )
                ],
              ),
            ),
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