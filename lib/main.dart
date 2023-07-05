import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: FirstRoute(),
    
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondop.jpg'),
            fit: BoxFit.fill
          ),
        ),
      child: Scaffold(
         appBar: AppBar(
            
            backgroundColor: Colors.transparent,
            elevation: 0,
            title:  const Center(child:  Text('BIENVENIDOS',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 55),)),
          ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              inicio(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 90,
                    ),
                    Row(
                      children: [
                        MaterialButton(
                          child: const SizedBox(height: 150, width: 145, child: Image(image: AssetImage('assets/profesor.png'))),
                          onPressed: () {
                            
                          },
                        ),
                        MaterialButton(
                      child: const SizedBox(height: 150, width: 145, child: Image(image: AssetImage('assets/alumno.png'))),
                      onPressed: () {
                        
                      },
                    ),
                      ],
                    ),
                      
                    
                        
                    
                      
                    const SizedBox(
                      height: 50,
                    ),
                        
                    MaterialButton(
                      child: const SizedBox(height: 150, width: 145, child: Image(image: AssetImage('assets/admin.png'))),
                      onPressed: () {
                      
                      },
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                      height: 300,
                    ),
                  ElevatedButton(
          onPressed: () {
            // Lógica que se ejecutará cuando se presione el botón "Guardar"
            
          },
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(
                    255, 64, 65, 66), // Cambia el color de fondo del botón a rojo
          ),
          child: const Text('Ayuda'),
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

Widget inicio(){
  return Container(
    color: Colors.transparent,
    child: const Text('----¿Como desea iniciar sesion?----', style: TextStyle(fontSize: 25, color: Color.fromARGB(236, 255, 255, 255)),)
    );
}


      
