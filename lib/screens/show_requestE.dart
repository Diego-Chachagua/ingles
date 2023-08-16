// ignore: file_names

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:ingles/screens/verEstuAct.dart';
import '../developer/consultasf.dart';
import 'calificar_E.dart';

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
  ShowRequestEstu(
      {super.key,
      required this.nie,
      required this.anio,
      required this.seccion,
      required this.nombres,
      required this.cod_profe,
      required this.cod_act,
      required this.nombre_act});

  @override
  State<ShowRequestEstu> createState() => _ShowRequestEstuState();
}

class _ShowRequestEstuState extends State<ShowRequestEstu> {
  var audios = AudioPlayer();
  var n1 = 0;

  void playaudio(var sonido) async {
    try {
      if (sonido != null) {
        await audios.play(UrlSource(sonido)) as List;
        await Future.delayed(Duration(seconds: 120));
      }
    } catch (e) {
      print("Error [002] $e");
    }
  }

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

  var i = 0;

  @override
  void initState() {
    super.initState();
    getActivitys();
  }

  Future<void> getActivitys() async {
    //resultado = await showactAlum(widget.nie);
    resultado2 = await showAskAlum(widget.cod_act);
    setState(() {
      if (resultado != "noExisten") {
        var n = resultado2.length;
        if (n == null) {
          n = 1;
        }
        for (var i = 0; i < n; i++) {
          var dato2 = resultado2[i];
          //espacio para preguntas
          var preguntas = dato2["preguntas"];
          var audios_pre = dato2["audio"];
          var imagenes_pre = dato2["imagen"];
          var respuestas_G = dato2["respuesta_G"];
          var respuestas=dato2["respuestas"];
        var audios=dato2["audio"];
        var imagenes=dato2["imagen"];
        var nota=dato2["notas"];
        if(nota!=null){
          notas.add(nota);
        }else{
          notas.add("0");
        }
          //espacio para preguntas
          respuesta_Game.add(respuestas_G);
          pregunta.add(preguntas);
          audio_p.add(audios_pre);
          imagen_p.add(imagenes_pre);
        respuesta.add(respuestas);
        audio.add(audios);
        imagen.add(imagenes);
        
        }
      }
    });
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
              leading: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  CalificarE(
                              cod_profe: widget.cod_profe,
                              anio: widget.anio,
                              seccion: widget.seccion,
                              nie: widget.nie,
                              nombres: widget.nombres,
                            )),
                  );
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
                    'Se muestra la actividad: "${widget.nombre_act}"\nde el estudiante: "${widget.nombres}"',
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
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
                    imagen_p[i] == null &&
                            audio_p[i] == null &&
                            respuesta_Game[i] == null
                        ? Row(
                          
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                onPressed: ()  {
 
                                },
                                child: Container(
                                  width: 350,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 167, 137, 194),
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
                                          Text(
                                            "${i}  -  ${pregunta[i]}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color.fromARGB(
                                                    255, 238, 234, 234)),
                                          ),
                                          Text("${notas[i]}/10")
                                          
                                        ],
                                      ),
                                      Text(
                                          "${respuesta[i]}"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : imagen_p[i] == null &&
                                audio_p[i] == null &&
                                respuesta_Game[i] != null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                    onPressed: () {},
                                    child: Container(
                                      width: 350,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 167, 137, 194),
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
                                              Text(
                                                "${i}  -  ${pregunta[i]}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color.fromARGB(
                                                        255, 238, 234, 234)),
                                              ),
                                              
                                            ],
                                          ),
                                          Text(
                                            "Respuesta: " + respuesta_Game[i],
                                            style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : audio_p[i] == null && imagen_p[i] != null
                                ? MaterialButton(
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 350,
                                          height: 300,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 167, 137, 194),
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
                                                  Text(
                                                    "${i}  -  ${pregunta[i]}",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Color.fromARGB(
                                                            255,
                                                            238,
                                                            234,
                                                            234)),
                                                  ),
                                                  
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              if (i < imagen_p.length)
                                                Container(
                                                  width: 340,
                                                  height: 220,
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
                                                )
                                              else
                                                Container(
                                                  width: 300,
                                                  height: 200,
                                                  child: Center(
                                                      child: Text(
                                                          "No se puede mostrar la imagen\nOcurrio un error\nCodigo de error[001]")),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : audio_p[i] != null && imagen_p[i] == null
                                    ? MaterialButton(
                                        onPressed: () {},
                                        child: Container(
                                            width: 350,
                                            height: 120,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 5),
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 167, 137, 194),
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
                                                    Text(
                                                      "${i}  -  ${pregunta[i]}",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255,
                                                              238,
                                                              234,
                                                              234)),
                                                    ),
                                                    
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
                                                          var n = audio.length;
                                                          for (var a = 0;
                                                              a < n;
                                                              a++) {
                                                            if (audio[a] ==
                                                                "no existe") {
                                                            } else {
                                                              playaudio(
                                                                  audio[a]);
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
                                              ],
                                            )),
                                      )
                                    : Padding(padding: EdgeInsets.all(10)),
                    //espacio para definición de contenedor para mostrar historial
                  ],
                )
            ]))));
  }
}
