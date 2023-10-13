import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:ingles/screens/save_Exam.dart';
import 'package:ingles/screens/save_act.dart';
import 'package:ingles/screens/show_act.dart';
import 'package:ingles/screens/use_url.dart';
import '../developer/consultasf.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';

import 'img_zoom.dart';

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
        await audios.play(UrlSource(sonido));
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
    try{
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
  }catch(e){
    _messaje(context);
  }
  }
  //variables y funciones para audio

  //funcion para añadir imagen a una pregunta sin imagen
  Future addimage(var cod) async {
    try{
    var picturefile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (picturefile != null) {
        imagen = File(picturefile.path);
        addImgEx(cod, imagen, widget.cod);
        final snackBar = SnackBar(
            backgroundColor: Color.fromARGB(255, 155, 118, 214),
            shape: Border.all(width: 1),
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
    }catch(e){
      _messaje(context);
    }
  }

//funcion para actualizar una imagen en la base datos
int currentIndex=0;
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

  //apartado para agregar preguntas de la imagen/audio y su codigo
  List p_img=[];
  List coP_img=[];
  List p_sound=[];
  List co_Psound=[];
  //apartado par pregunta de juego y su respuesta con sus debidos codigos

  //fin del aparatado 
  bool isLoading = true;
  double duracion=0.0;
  List position=[];
  var info;
  var cant_P;
  var cant_I;
  var cant_S;
  var cantidad;
  //eventos nuevos
  @override
  void initState() {
    super.initState();
    obtenerpreguntas(); 
  }
  Future<void> obtenerpreguntas() async {
    print(widget.cod_p);
    reslt = await mostrarExam(widget.cod);
    if (reslt != "Error") {
      setState(() {
        p_img.clear();
        coP_img.clear();
        p_sound.clear();
        co_Psound.clear();
        isLoading = false;
        preguntas.clear();
        imagenes.clear();
        images.clear();
        audio.clear();
        cod_p.clear(); // Limpiar la lista antes de agregar las nuevas preguntas
        if (reslt != "noExisten") {
          for (var i = 0; i < reslt.length; i++) {
            var dato = reslt[i];
            var nombreExam = dato["nombre"];
            var nom_tem = dato["pregunta"];
            var cod = dato["cod_pre"];
            var img = dato["img"];
            var sound = dato["audio"];
            if(nom_tem!=null && sound == null  && img ==null){
             preguntas.add(nom_tem);
             cod_p.add(cod);
            }
            imagenes.add(img);
            if(nom_tem != null && sound ==null && img != null){
              p_img.add(nom_tem);//llenar unicamente una lista donde las preguntas pertenezcan a las imagenes
              coP_img.add(cod);
            }
            //if para llenar sonido
            if(nom_tem != null && sound != null  && img ==null){
              p_sound.add(nom_tem);
              co_Psound.add(cod);
            }


            //evento if si en dado caso falla el nombre de la actividad
            if (nombreExam != "") {
              nameE = nombreExam;
            } else {
              nameE = "Name of exam";
            }
            //cod_p es codigo de todas las preguntas
            if (img != null) {
              Uint8List bytes = base64.decode(img);
              images.add(bytes);
            } 
            if(sound !=null){
               audio.add(sound);
            }  
          }

        }
       
        cant_P = preguntas.length;
        cant_I= images.length;
        cant_S=audio.length;
        cantidad=cant_P+cant_I+cant_S;
        for(var a=0; a<cant_S;a++){
          position.add(0.0);
        }

      });
    } else {
      setState(() {
        info = "Error";
        isLoading = false;
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
            leading: MaterialButton(
              onPressed: () {
                if (nameE == "NAME OF EXAM") {
                  final snackBar =
                      SnackBar(content: Text("Es necesario cambiar el nombre"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  _changename(context);
                } else {
                   Navigator.pop(context);
                }
              },
              child: SizedBox(
                width: screenSize.width *0.1,
                height:screenSize.height*0.1,
                child: Icon(Icons.arrow_back_outlined),
              ),
            ),
            elevation: 0,
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          ),
          backgroundColor: Colors.transparent,
          body: RefreshIndicator(
            strokeWidth:BorderSide.strokeAlignOutside,
            onRefresh: obtenerpreguntas,
            child: Scrollbar(
              thickness: screenSize.width*0.03,
              trackVisibility: true,
              interactive: true,
              child: ListView(
                children: [
                Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: screenSize.width*0.7,
                              height: screenSize.height*0.07,
                              child: TextField(
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                enabled: false,
                                decoration: InputDecoration.collapsed(
                                    hintText: "${nameE}"),
                                    style: TextStyle(fontSize: textSize),
                              )),
                          MaterialButton(
                            onPressed: () {
                              _changename(context);
                            },
                            child: Container(
                              height: screenSize.height*0.05,
                              width: screenSize.width*0.07,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/editar.png"))),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: screenSize.width*1,
                        height: screenSize.height*0.002,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: screenSize.height*0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Padding(padding: EdgeInsets.all(screenSize.width*0.02)),
                         Text(cantidad!=null?"Cant. Total: ${cantidad}"
                         : "Cant. Total: 0",style: TextStyle(fontSize: textSize4),)
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(screenSize.height*0.02)),
                      isLoading
                          ? Column(
                              children: [
                                SizedBox(
                                  height: screenSize.height * 0.3,
                                ),
                                const FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: CircularProgressIndicator(
                                    color: Color.fromARGB(255, 103, 82, 197),
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Cargando",
                                  style: TextStyle(
                                      fontSize: textSize3,
                                      fontStyle: FontStyle.italic),
                                )
                              ],
                            )
                          : info == "Error"
                              ? Center(
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
                                              border: Border.all(width: screenSize.width*0.003),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: MaterialButton(
                                              onPressed: () {
                                                setState(() {
                                                  info = "";
                                                  isLoading=true;
                                                  obtenerpreguntas();
                                                });
                                              },
                                              child: Row(children: [
                                                Text("Reintentar",style: TextStyle(fontSize: textSize2),),
                                                Icon(Icons.error)
                                              ]),
                                            ),
                                          ),
                                          Padding(padding: EdgeInsets.all(10)),
                                          Text(
                                              "Error en la red o no estas conectado",style: TextStyle(fontSize: textSize2),),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : 
                              
                      Column(
                        children: [
                          cant_P!=0?
                          Container(
                            width: screenSize.width * 0.9,
                            height: screenSize.height * 0.35,
                            decoration: BoxDecoration(
                              border: Border.all(width: screenSize.width*0.005),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(screenSize.height*0.01)),
                                Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Preguntas",style: TextStyle(fontSize: textSize4),),
                                          Text("Cant. Preguntas : $cant_P",style: TextStyle(fontSize: textSize4),),
                                        ],
                                      ),
                                Container(
                                  width: screenSize.width * 0.9,
                                  height: screenSize.height * 0.3,
                                  child: ListView.builder(
                                    itemCount: preguntas.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      // Crea un botón para cada elemento en la lista de datos
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(padding: EdgeInsets.all(screenSize.height*0.01)),
                                          MaterialButton(
                                            onPressed: () {
                                              // Cuando se presiona el botón, identifica el dato correspondiente
                                              String datoSeleccionado =
                                                  preguntas[index];
                                              var codigo = cod_p[index];
                                              _opEdit(context,codigo);
                                              print('$datoSeleccionado $codigo');
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(width: screenSize.width*0.003),
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                    color: Color.fromARGB(
                                                        255, 145, 119, 218)),
                                                width: screenSize.width * 0.8,
                                                height: screenSize.height * 0.06,
                                                child: Center(
                                                  child: Text(
                                                    preguntas[index],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(         
                                                        fontSize: textSize3),
                                                  ),
                                                )),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ):
                          Padding(padding: EdgeInsets.all(screenSize.height*0.02)),
                          Padding(padding: EdgeInsets.all(screenSize.height*0.01)),
                          cant_I!=0?// si imagenes es diferente de 0
                          Container(
                            width: screenSize.width * 0.9,
                            height: screenSize.height * 0.5,
                            decoration: BoxDecoration(
                              border: Border.all(width: screenSize.width*0.005),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(screenSize.height*0.01)),
                                Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Imagenes",style: TextStyle(fontSize: textSize4),),
                                          Text("Cant. Imagenes : $cant_I",style: TextStyle(fontSize: textSize4)),
                                        ],
                                      ),
                                Container(
                                  width: screenSize.width * 0.9,
                                  height: screenSize.height * 0.45,
                                  child: ListView.builder(
                                    itemCount: images.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      // Crea un botón para cada elemento en la lista de datos
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(padding: EdgeInsets.all(screenSize.height*0.01)),
                                          MaterialButton(
                                            onPressed: () {
                                              // Cuando se presiona el botón, identifica el dato correspondiente
                                              String datoSeleccionado =
                                                  p_img[index];
                                              var codigo = coP_img[index];
                                              _opEditImg(context, codigo);
                                              print('$datoSeleccionado $codigo');
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(width: screenSize.width*0.003),
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                    color: Color.fromARGB(
                                                        255, 145, 119, 218)),
                                                width: screenSize.width * 0.8,
                                                height: screenSize.height * 0.3,
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      Padding(padding: EdgeInsets.all(screenSize.height*0.01)),
                                                      Text(
                                                        p_img[index],
                                                         textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: textSize3),
                                                      ),
                                                      Padding(padding: EdgeInsets.all(screenSize.height*0.01)),
                                                      MaterialButton(
                                                        onPressed: (){
                                                          Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                          builder: (context) => Imagen(imagen: images[index],)),
                                                          );
                                                        },
                                                        child: Container(
                                                          width: screenSize.width * 0.6,
                                                          height: screenSize.height * 0.2,
                                                          decoration: 
                                                          BoxDecoration(
                                                            borderRadius:BorderRadius.circular(10),
                                                            border: Border.all(width: screenSize.width*0.005),
                                                            image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: MemoryImage(images[index]) )                             
                                                          ),
                                                          
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ):
                          Padding(padding: EdgeInsets.all(0)),//padding sin tomar a cuenta
                          Padding(padding: EdgeInsets.all(screenSize.height*0.01)),
                          cant_S!=0? // si sonido es diferente de 0
                           Container(
                            width: screenSize.width * 0.9,
                            height: screenSize.height * 0.45,
                            decoration: BoxDecoration(
                              border: Border.all(width: screenSize.width*0.005),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(screenSize.height*0.01)),
                                Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Sonidos"),
                                          Text("Cant. Sonidos : $cant_S"),
                                        ],
                                      ),
                                Container(
                                  width: screenSize.width * 0.9,
                                  height: screenSize.height * 0.40,
                                  child: ListView.builder(
                                    itemCount: audio.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      // Crea un botón para cada elemento en la lista de datos
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(padding: EdgeInsets.all(screenSize.height*0.01)),
                                          MaterialButton(
                                            onPressed: () {
                                              // Cuando se presiona el botón, identifica el dato correspondiente
                                              String datoSeleccionado =
                                                  p_sound[index];
                                              var codigo = co_Psound[index];
                                              _opEditSound(context,codigo);
                                              print('$datoSeleccionado $codigo');
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(width: screenSize.width*0.003),
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                    color: Color.fromARGB(
                                                        255, 145, 119, 218)),
                                                width: screenSize.width * 0.8,
                                                height: screenSize.height * 0.3,
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      Padding(padding: EdgeInsets.all(screenSize.height*0.01)),
                                                      Text(
                                                        p_sound[index],
                                                         textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: textSize3),
                                                      ),
                                                      Padding(padding: EdgeInsets.all(screenSize.height*0.01)),
                                                      MaterialButton(
                                                        onPressed: (){
                                                         
                                                        },
                                                        child: Container(
                                                          width: screenSize.width * 0.7,
                                                          height: screenSize.height * 0.2,
                                                          decoration: 
                                                          BoxDecoration(
                                                            borderRadius: BorderRadius.circular(10),
                                                            border: Border.all(width: screenSize.width*0.005),
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Slider(//slider o barra de carga
                                                                activeColor: Color.fromARGB(255, 107, 71, 139),
                                                                inactiveColor: Color.fromARGB(255, 137, 66, 204),
                                                                thumbColor: Colors.black,
                                                                value: position[index], 
                                                              onChanged: (value){                                                  
                                                                  audios.seek(Duration(milliseconds: value.toInt()));
                                                              },
                                                              min: 0.0,
                                                              max: duracion,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                children: [
                                                                   ElevatedButton(
                                                                style: ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty.resolveWith<Color?>(
                                                                    (Set<MaterialState>states) {
                                                                      if (states.contains(MaterialState.pressed)) {
                                                                        return Color.fromARGB(255,78,76,187); // Color cuando se presiona el botón
                                                                      }
                                                                      return Color.fromARGB(255,78,76,187); // Color predeterminado
                                                                    },
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  setState(() {    
                                                                    audios.stop();
                                                                  });
                                                                },
                                                                child: Container(
                                                                  width: screenSize.width*0.05,
                                                                  height: screenSize.height*0.03,
                                                                  child: Center(
                                                                    child: Icon(Icons
                                                                        .stop),
                                                                  ),
                                                                ),
                                                              ),
                                                                  ElevatedButton(
                                                                style: ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty.resolveWith<Color?>(
                                                                    (Set<MaterialState>states) {
                                                                      if (states.contains(MaterialState.pressed)) {
                                                                        return Color.fromARGB(255,78,76,187); // Color cuando se presiona el botón
                                                                      }
                                                                      return Color.fromARGB(255,78,76,187); // Color predeterminado
                                                                    },
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  setState(() {  
                                                                        playaudio(audio[index]);
                                                                        audios.onDurationChanged.listen((Duration duration) {
                                                                  setState(() {
                                                                        duracion = duration.inMilliseconds.toDouble();
                                                                  });//fin del setstate
                                                                });
                                                                audios.onPositionChanged.listen((Duration duration) { 
                                                                setState(() {
                                                                position[index]=duration.inMilliseconds.toDouble();
                                                                });
                                                                });
                                                                  });
                                                                },
                                                                child: Container(
                                                                   width: screenSize.width*0.05,
                                                                  height: screenSize.height*0.03,
                                                                  child: Center(
                                                                    child: Icon(Icons
                                                                        .play_arrow),
                                                                  ),
                                                                ),
                                                              ),
                                                              ElevatedButton(
                                                                style: ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty.resolveWith<Color?>(
                                                                    (Set<MaterialState>states) {
                                                                      if (states.contains(MaterialState.pressed)) {
                                                                        return Color.fromARGB(255,78,76,187); // Color cuando se presiona el botón
                                                                      }
                                                                      return Color.fromARGB(255,78,76,187); // Color predeterminado
                                                                    },
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  setState(() {    
                                                                    audios.pause();
                                                                  });
                                                                },
                                                                child: Center(
                                                                  child: Container(
                                                                     width: screenSize.width*0.05,
                                                                    height: screenSize.height*0.03,
                                                                    child: Icon(Icons
                                                                        .pause),
                                                                  ),
                                                                ),
                                                              ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ):
                          Padding(padding: EdgeInsets.all(5)),
                          Padding(padding: EdgeInsets.all(screenSize.height*0.01)),
                         
                      Padding(padding: EdgeInsets.all(screenSize.width*0.03)),      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MaterialButton(
                            onPressed: () async{
                              var n=await  extraerAS(widget.cod); 
                                print(n);  
                                if(n!="Error"){
                                  print(n);
                                  if(n=="contiene"){
                                    final snackBar = SnackBar(
                                    content:
                                        Text("Esta actividad ya ha sido asignada"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                  }else{
                              if (nameE== "NAME OF EXAM") {
                                final snackBar = SnackBar(
                                    content:
                                        Text("Es necesario cambiar el nombre"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                _changename(context);
                              } else if (cantidad < 10) {
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
                                  }
                                }else{
                                  _mensaje(context);
                                }
                            },
                            child: Container(
                              width: screenSize.width*0.2,
                              height: screenSize.height*0.05,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 225, 204, 243),
                                  border: Border.all(width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text("Guardar",style: TextStyle(fontSize: textSize3),),
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: screenSize.width*0.05))
                        ],
                      ),        
                    ],
                  ),    
              ]),         
            ),
                ]
              )
            )
          ),
           bottomNavigationBar: BottomNavigationBar(
            iconSize: screenSize.width*0.07,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            backgroundColor: Color.fromARGB(255, 114, 83, 155),
            currentIndex: currentIndex,
            onTap: _showDialogForItem,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                label: "Add Ask",
                
                icon: Icon(Icons.add_comment_outlined)
                ),
              BottomNavigationBarItem(
                label: "Add Image",
                icon: Icon(Icons.add_photo_alternate_rounded)),
                BottomNavigationBarItem(
                label: "Add Sound",
                icon: Icon(Icons.music_video_sharp))
            ]),
        )
    );      
  }
  void _showDialogForItem(int index) {
    switch (index) {
      case 0: if(cantidad == 20){
         final snackBar = SnackBar(
                            backgroundColor: Color.fromARGB(255, 155, 118, 214),
                            shape: Border.all(width: 1),
                            closeIconColor: Color.fromARGB(255, 230, 230, 230),
                            content: Text("Se ha alcanzado el limite de preguntas"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }else{
         _nameask(context);
      }
      break;
      case 1 : if(cantidad ==20){
         final snackBar = SnackBar(
                            backgroundColor: Color.fromARGB(255, 155, 118, 214),
                            shape: Border.all(width: 1),
                            closeIconColor: Color.fromARGB(255, 230, 230, 230),
                            content: Text("Se ha alcanzado el limite de preguntas"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }else{
        _elegirImg(context);
      }
      break;
      case 2: if(cantidad==20){
           final snackBar = SnackBar(
                            backgroundColor: Color.fromARGB(255, 155, 118, 214),
                            shape: Border.all(width: 1),
                            closeIconColor: Color.fromARGB(255, 230, 230, 230),
                            content: Text("Se ha alcanzado el limite de preguntas"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }else{
         _elegirSound(context);
      }
     
    }
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
                      height: 70,
                      child: Form(
                        key: nameact,
                        child: SingleChildScrollView(
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
                            decoration:  InputDecoration.collapsed(
                                hintText: "Nombre de la actividad",
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
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
                              if (nameact.currentState!.validate()) {
                                Navigator.pop(context);
                                var nombre = nameac.text;
                               var n= editnameE(nombre, widget.cod);
                               if(n=="Error"){
                                _mensaje(context);
                               }
                                obtenerpreguntas();
                              }
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
                          maxLength: 70,
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
                        maxLength: 70,
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
                          },
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {  
                              if (nameask.text == "") {
                                ask = "Escribe tu pregunta aqui";
                                nameask.text = "";
                              } else {
                                ask = nameask.text;
                                var n = agregarAskExam(ask, widget.cod);
                                print(n);
                                nameask.text = "";
                                if(n=="Error"){
                                _mensaje(context);
                               }else{
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
                                  child: Text("¿Saber mas?"),
                                )
                              ],
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              obtenerpreguntas();
                              }    
                              }
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


  void _changeask2(BuildContext context, var cod) {
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
                              maxLength: 70,
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
                                    if (formchangeask.currentState!.validate()) {
                                      pregunta = changeask.text;
                                     var n=  editAskE(pregunta, cod);
                                      changeask.text = "";
                                      if(n=="Error"){
                                      _mensaje(context);
                                      }
                                obtenerpreguntas();
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
                                  child: Text("¿Saber mas?"),
                                )
                              ],
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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

  void _opEdit(BuildContext context, var cod) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("¿Que deseas hacer?"),
            content: Container(
                height: 260,
                child: Column(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        _changeask2(context,cod);
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
                         addimage(cod);
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
                                  child: Text("¿Saber mas?"),
                                )
                              ],
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);  
                      obtenerpreguntas();
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
                            Text("añadir imagen"),
                            Icon(Icons.image),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    MaterialButton(
                      onPressed: () {
                       var n= deleteAskE(widget.cod, cod);
                       if(n=="Error"){
                                _mensaje(context);
                               }else{

                               
                                obtenerpreguntas();
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
                                  child: Text("¿Saber mas?"),
                                )
                              ],
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        obtenerpreguntas();
                               
                        Navigator.pop(context);
                               }
                      },
                      child: Container(
                        width: 180,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 230, 91, 81),
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Eliminar pregunta"),
                            Icon(Icons.delete_forever),
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

  
  //editar una pregunta con imagen
  void _opEditImg(BuildContext context, var cod) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("¿Que deseas hacer?"),
            content: Container(
                height: 270,
                child: Column(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        _changeask2(context, cod);
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
                        addimage(cod);
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
                                  child: Text("¿Saber mas?"),
                                )
                              ],
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        obtenerpreguntas();
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
                            Text("editar imagen"),
                            Icon(Icons.image),
                          ],
                        ),
                      ),
                    ),
                     Padding(padding: EdgeInsets.all(10)),
                    MaterialButton(
                      onPressed: () {
                        var n=deleteAskE(widget.cod, cod);
                        if(n=="Error"){
                                _mensaje(context);
                               }else{
                        obtenerpreguntas();
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
                                  child: Text("¿Saber mas?"),
                                )
                              ],
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pop(context);
                               }
                      },
                      child: Container(
                        width: 180,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 230, 91, 81),
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Eliminar pregunta"),
                            Icon(Icons.delete_forever),
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
                              maxLines: 2,
                              maxLength: 70,
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
                        var n= upSound_E(widget.cod, url_s, ask);
                        if(n=="Error"){
                                _mensaje(context);
                               }else{
                                obtenerpreguntas();
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
                                  child: Text("¿Saber mas?"),
                                )
                              ],
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                               }
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

 

  

  void _opEditSound(BuildContext context, var cod) {
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
                       _changeask2(context, cod);
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
                        var n = deleteAskE(widget.cod, cod);
                        if(n=="Error"){
                                _mensaje(context);
                               }
                                else{
                        obtenerpreguntas();
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
                                  child: Text("¿Saber mas?"),
                                )
                              ],
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pop(context);
                                }
                      },
                      child: Container(
                        width: 180,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 230, 91, 81),
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Eliminar pregunta"),
                            Icon(Icons.delete_forever),
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
  void _mensaje(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error de conexión"),
            content:
                const Text('La conexion es lenta\nIntentalo de nuevo mas tarde o conectate a una red WIFI'),
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

   @override
  void dispose() {
    audios.dispose();
    super.dispose();
  }
}
