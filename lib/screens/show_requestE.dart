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
    GlobalKey<FormState> formdeleteask = GlobalKey<FormState>();
    final deleteask = TextEditingController();
    final nota= TextEditingController();

  var audios = AudioPlayer();
  var n1 = 0;

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
  var heightpregunta = 100.00;
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
          var audios = dato2["audio"];
          var imagenes = dato2["imagen"];
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
            Uint8List bytes = base64.decode(imagenes_pre);
          imagen_p.add(bytes);
          }else{
            imagen_p.add("");
          }
           
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
              image: AssetImage('assets/fondop.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            appBar: AppBar(
              leading: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CalificarE(
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
                    imagen_p[i] == "" &&
                            audio_p[i] == null &&
                            respuesta_Game[i] == null
                        ? 
                        //definicion de subrespuestas segun si imagen y audio estan vacios mostrar 
                        
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            
                              MaterialButton(
                                padding: EdgeInsets.all(10),
                                onPressed: () {
                                   _addNote(context);
                                },
                                child: Container(
                                  width: 350,

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
                                            width: 255,
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
                                      respuesta[i] == null &&  imagen[i] == null &&  audio[i] == null
                                          ? Container(
                                            width: 255,
                                            child: TextField(
                                          enabled: false,
                                          maxLines: 4,
                                          decoration:
                                              InputDecoration.collapsed(
                                                  hintText:
                                                     "codigo: ${cod_res[i]}\nRespuesta: vacia " ),
                                            ),
                                          )
                                          :
                                          Container(
                                            width: 255,
                                            child: TextField(
                                          enabled: false,
                                          maxLines: 4,
                                          decoration:
                                              InputDecoration.collapsed(
                                                  hintText:
                                                     "codigo: ${cod_res[i]}\nRespuesta: ${respuesta[i]} " ),
                                            ),
                                          ),
                                              
                                    ],
                                  ),
                                ),
                                //si audio es nulo
                              )
                            
                       
                            ]
                          )
                        : imagen_p[i] == "" &&
                                audio_p[i] == null &&
                                respuesta_Game[i] != null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                     padding: EdgeInsets.all(10),
                                    onPressed: () {
                                       _addNote(context);
                                    },
                                    child: Container(
                                      width: 350,
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
                                            width: 255,
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
                                          Text(
                                            "Respuesta de la pregunta:  " + respuesta_Game[i],
                                            style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          Padding(padding: EdgeInsets.all(10)),
                                          respuesta[i]==null?
                                            Container(
                                            width: 255,
                                            child: TextField(
                                          enabled: false,
                                          maxLines: 4,
                                          decoration:
                                              InputDecoration.collapsed(
                                                  hintText:
                                                     "codigo: ${cod_res[i]}\nRespuesta: vacia " ),
                                            ),
                                            )
                                          :
                                           Container(
                                            width: 255,
                                            child: TextField(
                                          enabled: false,
                                          maxLines: 4,
                                          decoration:
                                              InputDecoration.collapsed(
                                                  hintText:
                                                     "codigo: ${cod_res[i]}\nRespuesta: ${respuesta[i]} " ),
                                            ),
                                          ),
                                          Padding(padding: EdgeInsets.all(5)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : audio_p[i] == null && imagen_p[i] != ""
                                ? MaterialButton(
                                   padding: EdgeInsets.all(10),
                                    onPressed: () {
                                       _addNote(context);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 350,
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
                                            width: 279,
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
                                          respuesta[i]==null?
                                            Container(
                                            width: 255,
                                            child: TextField(
                                          enabled: false,
                                          maxLines: 4,
                                          decoration:
                                              InputDecoration.collapsed(
                                                  hintText:
                                                     "codigo: ${cod_res[i]}\nRespuesta: vacia " ),
                                            ),
                                            )
                                          :
                                           Container(
                                            width: 255,
                                            child: TextField(
                                          enabled: false,
                                          maxLines: 4,
                                          decoration:
                                              InputDecoration.collapsed(
                                                  hintText:
                                                     "codigo: ${cod_res[i]}\nRespuesta: ${respuesta[i]} " ),
                                            ),
                                          ),
                                          Padding(padding: EdgeInsets.all(5))
                                            
                                               
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : audio_p[i] != null && imagen_p[i] == ""
                                    ? MaterialButton(
                                        onPressed: () {
                                           _addNote(context);
                                        },
                                        child: Container(
                                            width: 350,
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
                                            width: 255,
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
                                                Padding(padding: EdgeInsets.all(10)),
                                          respuesta[i]==null?
                                            Container(
                                            width: 255,
                                            child: TextField(
                                          enabled: false,
                                          maxLines: 4,
                                          decoration:
                                              InputDecoration.collapsed(
                                                  hintText:
                                                     "codigo: ${cod_res[i]}\nRespuesta: vacia " ),
                                            ),
                                            )
                                          :
                                           Container(
                                            width: 255,
                                            child: TextField(
                                          enabled: false,
                                          maxLines: 4,
                                          decoration:
                                              InputDecoration.collapsed(
                                                  hintText:
                                                     "codigo: ${cod_res[i]}\nRespuesta: ${respuesta[i]} " ),
                                            ),
                                          ),
                                          Padding(padding: EdgeInsets.all(5)),
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

   void _addNote(BuildContext context) {
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
              child: Form(
                  key: formdeleteask,
                  child: Column(
                    children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Campo requerido";
                          }
                        },
                        controller: deleteask,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Codigo Respuesta",
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
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
                        if (formdeleteask.currentState!.validate()) {
                          var codigo = deleteask.text;
                          var notas=nota.text;
                           addNotas(notas,codigo,widget.cod_act,widget.nie);
                           Navigator.pop(context);
                            getActivitys();
                       
                        }
                       
                       
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
