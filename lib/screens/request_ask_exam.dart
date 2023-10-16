// ignore: file_names

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ingles/screens/use_url.dart';
import 'package:ingles/screens/verEstuAct.dart';
import 'package:intl/intl.dart';
import '../developer/consultasf.dart';
import 'calificar_E.dart';
import 'img_zoom.dart';
import 'listen_audio.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: RespoderTaskEstuExam(
      nie: '',
      cod_act: '',
      nombre_act: '',
      date: '',
    ),
  ));
}

class RespoderTaskEstuExam extends StatefulWidget {
  final String nie;
  String nombre_act;
  String cod_act;
  String date;
  RespoderTaskEstuExam(
      {super.key,
      required this.nie,
      required this.cod_act,
      required this.date,
      required this.nombre_act});

  @override
  State<RespoderTaskEstuExam> createState() => _RespoderTaskEstuExamState();
}

class _RespoderTaskEstuExamState extends State<RespoderTaskEstuExam> {
  GlobalKey<FormState> formdeleteask = GlobalKey<FormState>();
  GlobalKey<FormState> formchangeask = GlobalKey<FormState>();
  GlobalKey<FormState> addsound = GlobalKey<FormState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var codigo;
  var codigo2;
  final deleteask = TextEditingController();
  final respuestaG = TextEditingController();
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
        addrequestImagen(cod, img, widget.nie);
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
  var contador = 0;
  bool isLoading=true;
  String info="";
  var n1;
  var ask;
  bool valor = false;
  bool valor2 = false;
  bool valor3 = false;
  bool valor4 = false;
  var n3;
  var resultado;
  var resultado2;
  var respuestaunica;
  List respuesta = [];
  List pregunta = [];
  List imagen_p = [];
  List imagen = [];
  List imagen_cod = [];
  List audio = [];
  List audio_p = [];
  List notas = [];
  List cod_res = [];

  var i = 0;

  @override
  void initState() {
    super.initState();
    getActivitys();
  }

  Future<void> getActivitys() async {
    //resultado = await showactAlum(widget.nie);
    print(widget.cod_act);
    resultado2 = await showAskExamAlum(widget.cod_act, widget.nie); //cambiar
    if(resultado2!="Error"){
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
        imagen_cod.clear();
        audio.clear();
        audio_p.clear();
        notas.clear();
        cod_res.clear();
        for (var i = 0; i < n; i++) {
          var dato2 = resultado2[i];
          //espacio para preguntas
          var preguntas = dato2["preguntas"];
          var audios_pre = dato2["audio"];
          var imagenes_pre = dato2["imagen"];
          var respuestas = dato2["respuestas"];
          var audios = dato2["audio_R"];
          var imagenes = dato2["imagen_R"];
          var nota = dato2["notas"];
          var codigo = dato2["cod_r"];
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
            Uint8List bytes = base64.decode(imagenes);// respuestas
            imagen.add(bytes);
          }else{
            imagen.add("");
          }  // 
          // respuestas
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
    double textSize = screenWidth < 340? 8.00: screenWidth > 600? 30.00: 20.00; //titulos
    double textSize2 = screenWidth < 340? 10.0 : screenWidth > 600? 25.00: 15.00; //boton de guardado
    double textSize3 = screenWidth < 340? 10.0: screenWidth > 600? 25.00: 15.00; //preguntas
    double textSize4 = screenWidth < 340? 10.0: screenWidth > 600? 25.00: 15.00; //para titulos en las secciones
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
            body: RefreshIndicator(
                child: SingleChildScrollView(
                    child: Column(children: [
                  Container(
                   width:screenSize.width*0.9,
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
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'Se muestra el examen: "${widget.nombre_act}"',
                            style: TextStyle(
                                fontSize: textSize, fontStyle: FontStyle.italic),
                          ),
                          Padding(padding: EdgeInsets.all(10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Entregar antes de: ${widget.date}",style: TextStyle(fontSize: textSize4),)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                height: screenSize.height*0.03,
              ),
                  Container(
                    width: screenSize.width*1,
                    color: Colors.black,
                    height: 1,
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
                Center(
                  child: Container(        
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
                          _opEdit(context,cod_res[index]);
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
                ),
                  Padding(padding: EdgeInsets.all(20)),
                  MaterialButton(
                    onPressed: () {
                      var selectDate = DateTime.now();
                            var selectTime = TimeOfDay.now();
                            String  formattedDate = DateFormat('yyyy-MM-dd').format(selectDate);
                               String formateTime = selectTime.format(context);
                            print(formateTime);
                            print(formattedDate);
                            addDateExam(widget.cod_act,formattedDate,formateTime,widget.nie);
                      changeStateExam(widget.cod_act, "Finalizado", widget.nie);
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      width: 100,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Finalizar"), Icon(Icons.check)],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(40))
                ])),
                onRefresh: getActivitys)));
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
  void _opEdit(BuildContext context,var cod) {
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
                        _requestAsk(context,cod);
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
                        _elegirImg(context,cod);
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
                        _elegirSound(context,cod);
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
  void _requestAsk(BuildContext context,var cod) {
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
                                      getActivitys();
                                      addrequestAsk(
                                          cod,
                                          ask2,
                                          widget
                                              .nie); //funcion para agregar respuesta a la pregunta
                                      cod_changeask.text = "";
                                      changeask.text = "";
                                      final snackBar = SnackBar(
                                          backgroundColor: Color.fromARGB(
                                              255, 155, 118, 214),
                                          shape: Border.all(width: 1),
                                          closeIconColor: Color.fromARGB(
                                              255, 230, 230, 230),
                                          content: Text(
                                              "Es necesario refrescar la pantalla"));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
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
  void _elegirImg(BuildContext context, var cod) {
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
                 
                  MaterialButton(
                    onPressed: () {
                     
                        setimage(cod); //funcion para cargar imagen
                        getActivitys();
                        nameask.text = "";
                       Navigator.pop(context);
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
  void _elegirSound(BuildContext context,var cod) {
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
                      var url_s = url.text;
                      if (addsound.currentState!.validate()) {
                        addrequestsound(cod, url_s, widget.nie);
                        getActivitys();
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
                        MaterialPageRoute(builder: (context) => UseURL()),
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
