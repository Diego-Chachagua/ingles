// ignore: file_names
import 'package:flutter/material.dart';
import 'package:ingles/screens/request_ask.dart';

import '../developer/consultaso.dart';
import '../main.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: Tareas(seccion: '', grado: '', nie: '',),
  ));
}

class Tareas extends StatefulWidget {
  final String grado;
  final String seccion;
  final String nie;
  const Tareas({super.key, required this.grado, required this.seccion, required this.nie});

  @override
  State<Tareas> createState() => _TareasState();
}

class _TareasState extends State<Tareas> {
var reslt;
List<String> tareas= [];
List<String> cod= [];

  @override
void initState(){
  super.initState();
  (() async{
    reslt = await tareasd(widget.nie);
    if (reslt!="noExisten"){
      for (var i = 0; i < reslt.length; i++){
    var dato =reslt[i];
    print(dato["nombre_act"]);
    print(dato["cod_act"]);

  // ignore: non_constant_identifier_names
          var nom_tem = dato["nombre_act"];
          // ignore: non_constant_identifier_names
          var id_tem = dato["cod_act"];

         

setState(() {
  // Actualizar las listas con los datos obtenidos
  tareas.add(nom_tem);
  cod.add(id_tem);


});
  }
    }
  })();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fondop.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar:  PreferredSize(
    preferredSize: const Size.fromHeight(130),
    child: AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      //MODIFICACION DEL CONTAINER DEL APPBAR
  title: const Text("", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 25),),
  backgroundColor: Colors.red,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50)),
    ),
    //MODIFICACION DE LA IMAGEN DEL APPBAR
  flexibleSpace: ClipRRect(
     child: Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
      image: AssetImage("assets/Banner_app.png"),
      fit: BoxFit.fill

      ),
     
    ),
     )
  ),
    )
        ),
        backgroundColor: Colors.transparent,
        body:  SingleChildScrollView(
          child: Column(
            children: [
            //Definicion de la linea
              const SizedBox(height: 5,),
              Container(
              height: 5,
              width: 1000,
              color: const Color.fromARGB(255, 0, 0, 0),
              ),
              //Apartado del cuadro con imagen
              for (var i = 0; i < tareas.length; i++)
              Column(
                children: [
                  
                  Row(
                    children: [

                      Container(
                        margin: const EdgeInsets.only(top: 20, right: 20,left: 10),
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                          
                          
                          image: DecorationImage(
                          image: AssetImage('assets/tareaso.png'),),
                          
                          ),
                        ),
                        
                        Container(
                          //Apartado del boton
                          margin: const EdgeInsets.only(top: 20),
                          height: 50,
                          width: 200,
                          color:Color.fromARGB(255, 171, 5, 204),
                          
                          
                          child:  MaterialButton(onPressed: () async{
                          
                    dynamic respuesta = await comprobartarea(cod[i],widget.nie);
                    if (respuesta == "error") {
                        _mensaje(context);

                      //se produjo un error
                    }
                    if (respuesta == "noExiste") {
                      //ya realizo la prueba
                      _mensajeUsu(context);
                    } else {
                         if(respuesta == "exito"){
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RespoderTaskEstu(nie: widget.nie,cod_act: cod[i],nombre_act: tareas[i],)),
                   );
                      }
                    }

                          },
                          child:  Center(child: Text(tareas[i], style: const TextStyle(fontSize: 20, color: Colors.white))),

                            
                          

                          )
                          ),
        
                    ],
                  ),
                ],
              ),
              
            
        
            ],
        
          ),
        ),
       
      ),
    );
    
  

  }
    void _mensajeUsu(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("REALIZADO"),
            content: const Text(
                'Ya realizaste esta tarea'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    
                  },
                  child: const Text('Aceptar'),
                ),
              )
            ],
          );
        });
  }

  void _mensaje(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("REALIZADO"),
            content:
                const Text('Ya realizaste este examen'),
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
}
