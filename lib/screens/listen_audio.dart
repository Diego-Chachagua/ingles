// ignore: file_names
import 'package:audioplayers/audioplayers.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import '../developer/consultaso.dart';
import '../main.dart';
import 'elec_op_p.dart';
import 'tareasM.dart';
import 'unidades.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Audio(
      audio: '',
      title: '',
    ),
  ));
}

class Audio extends StatefulWidget {
  var audio;
  String title;
   Audio({super.key,required this.audio, required this.title});

  @override
  State<Audio> createState() => _AudioState();
}

class _AudioState extends State<Audio> {
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
   bool _obscureText = true;
final usuariob =TextEditingController();
final contrab =TextEditingController();
var reslt;
var cod;
 double duracion=0.0;
  double position=0.0;

  String usuariobd = "";
  String contrabd = "";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;//contenedores
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth < 340 ? 8.00 : screenWidth >=600? 30.00 : 25.00;//titulos
    double textSize2 = screenWidth < 340 ? 10.0 : screenWidth >=600 ? 40.00 : 20.00;//subtitulos
    double textSize3 = screenWidth < 340 ? 10.0 : screenWidth >=600 ? 30.00 : 17.00;//filtros
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fondof.jpg'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
         title: Text(widget.title),
        ),
        backgroundColor: Colors.transparent,
        body: 
       Center(
         child: Container(
                                                            width: screenSize.width * 0.9,
                                                            height: screenSize.height * 0.4,
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
                                                                  value: position, 
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
                                                                    width: screenSize.width*0.1,
                                                                    height: screenSize.height*0.05,
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
                                                                          playaudio(widget.audio);
                                                                          audios.onDurationChanged.listen((Duration duration) {
                                                                    setState(() {
                                                                          duracion = duration.inMilliseconds.toDouble();
                                                                    });//fin del setstate
                                                                  });
                                                                  audios.onPositionChanged.listen((Duration duration) { 
                                                                  setState(() {
                                                                  position=duration.inMilliseconds.toDouble();
                                                                  });
                                                                  });
                                                                    });
                                                                  },
                                                                  child: Container(
                                                                     width: screenSize.width*0.1,
                                                                    height: screenSize.height*0.05,
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
                                                                       width: screenSize.width*0.1,
                                                                      height: screenSize.height*0.05,
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
       ),
      ),
    );
  }
//widgets que forman la aplicacion
// ignore: non_constant_identifier_names
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

   @override
  void dispose() {
    audios.dispose();
    super.dispose();
  }
}
