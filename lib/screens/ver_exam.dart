import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:ingles/screens/save_Exam.dart';
import 'package:ingles/screens/save_act.dart';
import 'package:ingles/screens/use_url.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../developer/consultasf.dart';
import '../main.dart';
import 'elec_e_o_t.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

import 'elec_op_p.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: VerExam(
      cod: '',
      cod_p: '',
    ),
  ));
}

class VerExam extends StatefulWidget {
  String cod;
  String cod_p;

  VerExam({required this.cod, required this.cod_p});

  @override
  State<VerExam> createState() => _VerExamState();
}

class _VerExamState extends State<VerExam> {
 String nameE = "";
//variables de audio
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
      _msError(context);
    }
  }

  //generar validacion de formularios
  GlobalKey<FormState> valueupdateimg = GlobalKey<FormState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formchangeask = GlobalKey<FormState>();
  GlobalKey<FormState> nameact = GlobalKey<FormState>();
  GlobalKey<FormState> formdeleteask = GlobalKey<FormState>();
  GlobalKey<FormState> deleteimg = GlobalKey<FormState>();
  GlobalKey<FormState> addimg = GlobalKey<FormState>();
  GlobalKey<FormState> addsound = GlobalKey<FormState>();
  GlobalKey<FormState> addgame = GlobalKey<FormState>();
  GlobalKey<FormState> editRequest = GlobalKey<FormState>();
  File? imagen;

//future para buscar y almacenar imagen
  Future setimage(var ask) async {
    var picturefile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (picturefile != null) {
        imagen = File(picturefile.path);
        agregarImgEx(ask, imagen, widget.cod);
        obtenerpreguntas();
      } else {
        setState(() {
          final snackBar =
              SnackBar(content: Text("No se agrego ninguna imagen"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      }
    });
  }
  //variables y funciones para audio

  //funcion para añadir imagen a una pregunta sin imagen
  Future addimage(var cod) async {
    var picturefile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (picturefile != null) {
        imagen = File(picturefile.path);
        addImgEx(cod, imagen, widget.cod);
        final snackBar = SnackBar(
            backgroundColor: Color.fromARGB(255, 155, 118, 214),
            shape: Border.all(width: 1),
            showCloseIcon: true,
            closeIconColor: Color.fromARGB(255, 230, 230, 230),
            content: Text("Es necesario refrescar la pantalla"));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        obtenerpreguntas();
      } else {
        setState(() {
          final snackBar =
              SnackBar(content: Text("No se agrego ninguna imagen"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      }
    });
  }

//funcion para actualizar una imagen en la base datos

  final usuariob = TextEditingController();
  final contrab = TextEditingController();
  final nameac = TextEditingController();
  final changeask = TextEditingController();
  final cod_changeask = TextEditingController();
  final nameask = TextEditingController();
  final namesound = TextEditingController();
  final url = TextEditingController();
  final deleteask = TextEditingController();
  final addaskgame = TextEditingController();
  final newrquest = TextEditingController();
  var i = 0;
  String usuariobd = "";
  String contrabd = "";
  String ask = "Escribe tu pregunta aqui";
  String pregunta = "";
  var reslt;
  List preguntas = [];
  List imagenes = [];
  List images = [];
  List cod_p = [];
  List audio = [];
  @override
  void initState() {
    super.initState();
    obtenerpreguntas();
  }

  Future<void> obtenerpreguntas() async {
    print(widget.cod);
    reslt = await mostrarExam(widget.cod);
    setState(() {
      preguntas.clear();
      imagenes.clear();
      images.clear();
      audio.clear();
      cod_p.clear(); // Limpiar la lista antes de agregar las nuevas preguntas
      if (reslt != "noExisten") {
        for (var i = 0; i < reslt.length; i++) {
          var dato = reslt[i];
          var nombreExam = dato["nombre"];
          print(nombreExam);
          var nom_tem = dato["pregunta"];
          var cod = dato["cod_pre"];
          var img = dato["img"];
          var sound = dato["audio"];
          preguntas.add(nom_tem);
          imagenes.add(img);
          if (nombreExam != "") {
            nameE = nombreExam;
          } else {
            nameE = "NAME OF EXAM";
          }
          cod_p.add(cod);
          if (img != null) {
            Uint8List bytes = base64.decode(img);
            images.add(bytes);
          } else {
            images.add("");
          }
          // Agregar las nuevas preguntas a la lista
          if (sound != null) {
            audio.add(sound);
          } else {
            audio.add("no existe");
          }
        }
        print(audio);
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
                if (nameE == "NAME OF EXAM") {
                  final snackBar =
                      SnackBar(content: Text("Es necesario cambiar el nombre"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  _changename(context);
                } else {
                  _wishExit(context);
                }
              },
              child: SizedBox(
                width: 30,
                height: 30,
                child: Icon(Icons.arrow_back_outlined),
              ),
            ),
            elevation: 0,
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          ),
          backgroundColor: Colors.transparent,
          body: RefreshIndicator(
            onRefresh: obtenerpreguntas,
            child: ListView(children: [
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 250,
                          height: 60,
                          child: Text(
                            nameE,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            _changename(context);
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/editar.png"))),
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 500,
                      height: 2,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 70,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 209, 31, 18),
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              _deleteAsk(context);
                            },
                            child: Icon(
                              Icons.disabled_by_default_outlined,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    for (i = 0; i < preguntas.length; i++)
                      Column(
                        children: [
                          images[i] == "" &&
                                  audio[i] == "no existe" 
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                      onPressed: () {
                                        _opEdit(context);
                                      },
                                      child: Container(
                                        width: 350,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 167, 137, 194),
                                            border: Border.all(width: 2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${i}  -  ${preguntas[i]}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color.fromARGB(
                                                      255, 238, 234, 234)),
                                            ),
                                            Text(cod_p[i]),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                                  : audio[i] == 'no existe' && images[i] != ""
                                      ? MaterialButton(
                                          onPressed: () {
                                            _opEditImg(context);
                                          },
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
                                                    border:
                                                        Border.all(width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${i}  -  ${preguntas[i]}",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      238,
                                                                      234,
                                                                      234)),
                                                        ),
                                                        Text("${cod_p[i]}"),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    if (i < images.length)
                                                      Container(
                                                        width: 340,
                                                        height: 220,
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
                                                                      images[
                                                                          i]),
                                                              fit:
                                                                  BoxFit.cover),
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
                                      : audio[i] != "no existe" &&
                                              images[i] == ""
                                          ? MaterialButton(
                                              onPressed: () {},
                                              child: Container(
                                                  width: 350,
                                                  height: 120,
                                                  padding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20,
                                                          vertical: 5),
                                                  decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 167, 137, 194),
                                                      border:
                                                          Border.all(width: 2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5)),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "${i}  -  ${preguntas[i]}",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        238,
                                                                        234,
                                                                        234)),
                                                          ),
                                                          Text(cod_p[i]),
                                                        ],
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10)),
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
                                                                var n = audio
                                                                    .length;
                                                                for (var a = 0;
                                                                    a < n;
                                                                    a++) {
                                                                  if (audio[
                                                                          a] ==
                                                                      "no existe") {
                                                                  } else {
                                                                    playaudio(
                                                                        audio[
                                                                            a]);
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
                                                  )),
                                            )
                                          : Padding(
                                              padding: EdgeInsets.all(10)),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            if (nameE == "NAME OF EXAM") {
                              final snackBar = SnackBar(
                                  content:
                                      Text("Es necesario cambiar el nombre"));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              _changename(context);
                            } else if (i < 2) {
                              final snackBar = SnackBar(
                                  content: Text(
                                      "Debes contener almenos 10 preguntas"));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SaveExam(
                                          nombre_act: nameE,
                                          cod_act: widget.cod,
                                          cod_p: widget.cod_p,
                                        )),
                              );
                            }
                          },
                          child: Container(
                            width: 70,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 225, 204, 243),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text("Guardar"),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 20))
                      ],
                    ),

                    //edicion de patalla
                  ],
                ),
              )
            ]),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                heroTag: 'tag1',
                onPressed: () async {
                  if(i==20){
                     final snackBar = SnackBar(
                            backgroundColor: Color.fromARGB(255, 155, 118, 214),
                            shape: Border.all(width: 1),
                            showCloseIcon: true,
                            closeIconColor: Color.fromARGB(255, 230, 230, 230),
                            content:
                                Text("No se puede agregar mas de 20 preguntas"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }else{
                    setState(() {
                    _nameask(context);
                  });
                  }
                  
                },
                child: Icon(Icons.add_comment_outlined),
              ),
              FloatingActionButton(
                heroTag: 'tag2',
                onPressed: () {
                   if(i==20){
                     final snackBar = SnackBar(
                            backgroundColor: Color.fromARGB(255, 155, 118, 214),
                            shape: Border.all(width: 1),
                            showCloseIcon: true,
                            closeIconColor: Color.fromARGB(255, 230, 230, 230),
                            content:
                                Text("No se puede agregar mas de 20 preguntas"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }else{
                    _elegirImg(context);
                  }
                  
                },
                child: Icon(Icons.add_photo_alternate_outlined),
              ),
              FloatingActionButton(
                heroTag: 'tag3',
                onPressed: () {
                   if(i==20){
                     final snackBar = SnackBar(
                            backgroundColor: Color.fromARGB(255, 155, 118, 214),
                            shape: Border.all(width: 1),
                            showCloseIcon: true,
                            closeIconColor: Color.fromARGB(255, 230, 230, 230),
                            content:
                                Text("No se puede agregar mas de 20 preguntas"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }else{
                    setState(() {
                    _elegirSound(context);
                  });
                  }
                  
                },
                child: Icon(Icons.mic),
              ),
            ],
          ),
        ));
  }

//mensaje emergente para cambiar el nombre de la actividad o tarea
  void _changename(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("Cambia el nombre de la actividad"),
            actions: [
              Column(
                children: [
                  Center(
                    child: Container(
                      width: 250,
                      height: 80,
                      child: Form(
                        key: nameact,
                        child: TextFormField(
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Campo requerido";
                            }
                          },
                          controller: nameac,
                          textCapitalization: TextCapitalization.characters,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.black,
                          maxLength: 40,
                          maxLines: 2,
                          decoration: const InputDecoration.collapsed(
                              hintText: "Nombre de la actividad",
                              hintStyle: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              if (nameact.currentState!.validate()) {
                                Navigator.pop(context);
                                var nombre = nameac.text;

                               editnameE(nombre, widget.cod);
                                obtenerpreguntas();
                              }
                            });
                          },
                          child: const Text(
                            'Aceptar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Cancelar',
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

//mensaje emergente para mostrar una pantalla emergente para cambiar la pregunta

  //espacio para añadir imagen con titulo

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
                          maxLines: 2,
                          maxLength: 40,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Escribir pregunta",
                              hintStyle: TextStyle(fontSize: 15)),
                        ),
                      )),
                  MaterialButton(
                    onPressed: () {
                      var ask = nameask.text;
                      if (formKey.currentState!.validate()) {
                        setimage(ask);
                        nameask.text = "";
                        Navigator.pop(context);
                        obtenerpreguntas();
                        final snackBar = SnackBar(
                            backgroundColor: Color.fromARGB(255, 155, 118, 214),
                            shape: Border.all(width: 1),
                            showCloseIcon: true,
                            closeIconColor: Color.fromARGB(255, 230, 230, 230),
                            content: Row(
                              children: [
                                Text("Podria ser necesario recargar"),
                                MaterialButton(
                                  onPressed: () {
                                    _messaje(context);
                                  },
                                  child: Text("¿Saber mas?"),
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

  //para agregar pregunta
  void _nameask(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("Agregar pregunta"),
            actions: [
              Column(
                children: [
                  Center(
                    child: Container(
                      width: 250,
                      height: 80,
                      child: TextField(
                        controller: nameask,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        maxLength: 40,
                        maxLines: 2,
                        decoration: const InputDecoration(
                            hintText: "Escribir pregunta",
                            hintStyle: TextStyle(fontSize: 15),
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              if (nameask.text == "") {
                                ask = "Escribe tu pregunta aqui";
                              } else {
                                ask = nameask.text;
                                agregarAskExam(ask, widget.cod);
                                nameask.text = "";
                              }
                              obtenerpreguntas();
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

//espacio para elegir una opcion , si elegir una imagen o una pregunta

  void _wishExit(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("¿Quieres salir?"),
            content: Container(
              width: 100,
              height: 30,
              child: Text('¿Estas seguro que quieres salir?'),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Text('No'),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfeOp(
                                     cod_p: widget.cod_p,
                                  )),
                        );
                      },
                      child: Center(
                        child: Text('Si'),
                      )),
                ],
              )
            ],
          );
        });
  }

  void _deleteAsk(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("¿Estas seguro que quieres borrar la pregunta?"),
            content: Container(
              child: Form(
                  key: formdeleteask,
                  child: TextFormField(
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
                      hintText: "Codigo pregunta",
                    ),
                  )),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "NO",
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {
                        if (formdeleteask.currentState!.validate()) {
                          var codigo = deleteask.text;
                          deleteAskE(widget.cod, codigo);
                        }
                        Navigator.pop(context);
                        obtenerpreguntas();
                        final snackBar = SnackBar(
                            backgroundColor: Color.fromARGB(255, 155, 118, 214),
                            shape: Border.all(width: 1),
                            showCloseIcon: true,
                            closeIconColor: Color.fromARGB(255, 230, 230, 230),
                            content: Row(
                              children: [
                                Text("Podria ser necesario recargar"),
                                MaterialButton(
                                  onPressed: () {
                                    _messaje(context);
                                  },
                                  child: Text("¿Saber mas?"),
                                )
                              ],
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text("SI", style: TextStyle(color: Colors.white))),
                ],
              )
            ],
          );
        });
  }

  void _changeask2(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shadowColor: Color.fromARGB(255, 170, 63, 233),
              backgroundColor: Color.fromARGB(255, 196, 158, 218),
              title: const Text("Escribe tu pregunta"),
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
                              hintText: "Codigo pregunta",
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
                                hintText: "Escribir  pregunta",
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
                                      pregunta = changeask.text;
                                      var cod = cod_changeask.text;
                                      editAskE(pregunta, cod);
                                      changeask.text = "";
                                      Navigator.pop(context);
                                      obtenerpreguntas();
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

  void _opEdit(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("¿Que deseas hacer?"),
            content: Container(
                height: 190,
                child: Column(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        _changeask2(context);
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
                            Text("Editar pregunta"),
                            Icon(Icons.edit),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    MaterialButton(
                      onPressed: () {
                        _addImg(context);
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
                            Text("añadir imagen"),
                            Icon(Icons.image),
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

  void _addImg(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("Seleccionar una imagen"),
            content: Container(
              height: 200,
              child: Column(
                children: [
                  Form(
                      key: addimg,
                      child: Column(children: [
                        Container(
                          width: 150,
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
                              hintText: "Codigo pregunta",
                            ),
                          ),
                        ),
                      ])),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (addimg.currentState!.validate()) {
                        var cod = cod_changeask.text;
                        addimage(cod);
                        cod_changeask.text = "";
                      }
                      obtenerpreguntas();
                      Navigator.pop(context);
                      final snackBar = SnackBar(
                            backgroundColor: Color.fromARGB(255, 155, 118, 214),
                            shape: Border.all(width: 1),
                            showCloseIcon: true,
                            closeIconColor: Color.fromARGB(255, 230, 230, 230),
                            content: Row(
                              children: [
                                Text("Podria ser necesario recargar"),
                                MaterialButton(
                                  onPressed: () {
                                    _messaje(context);
                                  },
                                  child: Text("¿Saber mas?"),
                                )
                              ],
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(10)),
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
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
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

  //editar una pregunta con imagen
  void _opEditImg(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("¿Que deseas hacer?"),
            content: Container(
                height: 230,
                child: Column(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        _changeask2(context);
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
                            Text("Editar pregunta"),
                            Icon(Icons.edit),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    MaterialButton(
                      onPressed: () {
                        _addImg(context);
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
                            Text("editar imagen"),
                            Icon(Icons.image),
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
                    ),
                  ],
                )),
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

  //elegir archivo
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
            title: const Text("Añadir sonido/audio"),
            content: Container(
              height: 410,
              child: Column(
                children: [
                  Container(
                      width: 150,
                      height: 190,
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
                              maxLines: 2,
                              maxLength: 40,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Escribir pregunta",
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
                        namesound.text = "";
                        url.text = "";
                        upSound_E(widget.cod, url_s, ask);
                        Navigator.pop(context);
                       
                      }
                       final snackBar = SnackBar(
                            backgroundColor: Color.fromARGB(255, 155, 118, 214),
                            shape: Border.all(width: 1),
                            showCloseIcon: true,
                            closeIconColor: Color.fromARGB(255, 230, 230, 230),
                            content:
                                Text("Es necesario refrescar la pantalla"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                                  cod_act: widget.cod,
                                  cod_p: widget.cod_p,
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

  

  
}
