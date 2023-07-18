// ignore: file_names
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: Examenes(),
  ));
}

class Examenes extends StatelessWidget {
  const Examenes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/lila.jpg'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:  Center(
            child: GradientText(
                  'XAM',
                  style: const TextStyle(
                      fontSize: 50.0,
                  ),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: 2.5,
                  colors: const [
                      Color.fromARGB(255, 153, 97, 185),
                      Color.fromARGB(255, 59, 68, 117),
                      Color.fromARGB(255, 127, 131, 136),
                  ],
                          ),
   
          ),
        ),
        body:  SingleChildScrollView(
          child: Column(
            children: [
            //Definicion de la linea
              const SizedBox(height: 20,),
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
        backgroundColor: Colors.transparent,
      ),
    );

  

  }
  
}