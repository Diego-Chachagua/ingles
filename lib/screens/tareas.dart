// ignore: file_names
import 'package:flutter/material.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: Tareas(seccion: '', grado: '',),
  ));
}

class Tareas extends StatefulWidget {
  final String grado;
  final String seccion;
  const Tareas({super.key, required this.grado, required this.seccion});

  @override
  State<Tareas> createState() => _TareasState();
}

class _TareasState extends State<Tareas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/lila.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar:  PreferredSize(
    preferredSize: const Size.fromHeight(150),
    child: AppBar(
      centerTitle: true,
      //MODIFICACION DEL CONTAINER DEL APPBAR
  title: const Text("", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 25),),
  backgroundColor: Colors.red,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50)),
    ),
    //MODIFICACION DE LA IMAGEN DEL APPBAR
  flexibleSpace: ClipRRect(
  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
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
              color: const Color.fromARGB(255, 15, 152, 161),
              ),
              //Apartado del cuadro con imagen
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, right: 20),
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color:  const Color.fromARGB(255, 185, 91, 91),
                      borderRadius: BorderRadius.circular(300),
                      border: Border.all(width: 2, color: const Color.fromARGB(255, 24, 3, 119)),
                      image: const DecorationImage(
                      image: AssetImage('assets/task.png'),),
                      
                      ),
                    ),
                    Container(
                      //Apartado del boton
                      margin: const EdgeInsets.only(top: 20),
                      height: 50,
                      width: 200,
                      color: const Color.fromARGB(255, 135, 8, 160),
                      
                      child:  MaterialButton(onPressed: (){

                      },
                      child:  Text(widget.grado, style: TextStyle(color: Colors.white)),

                        
                      

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
