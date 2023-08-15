// ignore: file_names

import 'package:flutter/material.dart';
import 'package:ingles/screens/verEstuAct.dart';
import '../developer/consultasf.dart';

void main() {
  runApp( MaterialApp(
    title: 'Navigation Basics',
    home: ShowRequestEstu(nie: '',
    anio: '',
    seccion: '',
    nombres: '',
    cod_profe: '',
    cod_act: '',
    nombre_act: '',),
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
  ShowRequestEstu({super.key, required this.nie,required this.anio,required this.seccion, required this.nombres, required this.cod_profe
  , required this.cod_act, required this.nombre_act});

  @override
  State<ShowRequestEstu> createState() => _ShowRequestEstuState();
}

class _ShowRequestEstuState extends State<ShowRequestEstu> {
  var resultado;
  var resultado2;
  List respuesta=[];
  List pregunta=[];
  List imagen_p=[];
  List imagen=[];
  List audio=[];
  List audio_p=[];

  var n1 = 0;

  @override
  void initState() {
    super.initState();
    getActivitys();
  }
  Future<void> getActivitys() async {
      //resultado = await showactAlum(widget.nie);
      resultado= await showrequestalum(widget.nie,widget.cod_act);
      resultado2=await showAskAlum(widget.cod_act);
    setState(() {
      n1 = 0;
      if (resultado != "noExisten") {
        var n = resultado.length;
        if (n == null) {
          n = 1;
        }
        for (var i = 0; i < n; i++) {
           var dato = resultado[i];
           var dato2= resultado2[i];
        var respuestas=dato["respuesta"];
        var audios=dato["audio"];
        var imagenes=dato["imagen"];
        //espacio para preguntas
        var preguntas=dato2["pregunta"];
        var audios_pre=dato2["audio"];
        var imagenes_pre=dato2["imagen"];
        respuesta.add(respuestas);
        audio.add(audios);
        imagen.add(imagenes);
        //espacio para preguntas
        pregunta.add(preguntas);
        audio_p.add(audios_pre);
        imagen_p.add(imagenes_pre);

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
              leading: MaterialButton(onPressed: (){
                 Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerEstuAct(
                                          cod_p: widget.cod_profe,
                                          anio: widget.anio,
                                          seccion: widget.seccion,
                                        )),
                              );
              },
              child: Center(child:Icon(Icons.arrow_back)),),
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Column(
              children: [
                Text("Se muestran actividades de el estudiante:\n${widget.nombres}",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
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
                //espacio para definición de contenedor para mostrar historial
                
                
                  
                  
                
              ],
            ))));
  }

  
}
