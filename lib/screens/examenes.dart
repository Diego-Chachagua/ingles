// ignore: file_names
import 'package:flutter/material.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: Examenes(grado: '', nie: '', seccion: '',),
  ));
}

class Examenes extends StatefulWidget {
  final String grado;
  final String seccion;
  final String nie;
  const Examenes({super.key, required this.grado, required this.seccion, required this.nie});

  @override
  State<Examenes> createState() => _ExamenesState();
}

class _ExamenesState extends State<Examenes> {
var reslt;
List<String> examen= [];
List<String> cod= [];


  @override
void initState(){
  super.initState();
  (() async{
    reslt = await examenes(widget.grado,widget.seccion);
    if (reslt!="noExisten"){
      for (var i = 0; i < reslt.length; i++){
    var dato =reslt[i];
    print(dato["nombre_p"]);
    print(dato["cod_pr"]);

  // ignore: non_constant_identifier_names
          var nom_tem = dato["nombre_p"];
          // ignore: non_constant_identifier_names
          var id_tem = dato["cod_pr"];

         

setState(() {
  // Actualizar las listas con los datos obtenidos
  examen.add(nom_tem);
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
            image: AssetImage('assets/lila.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar:  PreferredSize(
    preferredSize: Size.fromHeight(150),
    child: AppBar(
      centerTitle: true,
      //MODIFICACION DEL CONTAINER DEL APPBAR
  title: Text("", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 25),),
  backgroundColor: Colors.red,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50)),
    ),
    //MODIFICACION DE LA IMAGEN DEL APPBAR
  flexibleSpace: ClipRRect(
  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
     child: Container(
    decoration: BoxDecoration(
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Definicion de la linea
              const SizedBox(
                height: 5,
              ),
              Container(
              height: 5,
              width: 1000,
              color: Color.fromARGB(255, 15, 152, 161),
              ),
              //Apartado del cuadro con imagen
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, right: 20),
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color:  Color.fromARGB(255, 185, 91, 91),
                      borderRadius: BorderRadius.circular(300),
                      border: Border.all(width: 2, color: Color.fromARGB(255, 24, 3, 119)),
                      image: const DecorationImage(
                      image: AssetImage('assets/xam.png'),),
                      
                      ),
                    ),
                    Container(
                      //Apartado del boton
                      margin: EdgeInsets.only(top: 20),
                      height: 50,
                      width: 250,
                      color: const Color.fromARGB(255, 135, 8, 160),
                      child:  MaterialButton(onPressed: (){

                      },
                      child: const Text("Tarea asignada", style: TextStyle(color: Colors.white)),

                        
                      

                      )
                      ),
        
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}
