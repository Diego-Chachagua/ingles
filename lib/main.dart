import 'package:flutter/material.dart';
import 'package:ingles/screens/form_a.dart';
import 'package:ingles/screens/form_es.dart';
import 'package:ingles/screens/form_p.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';


void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: FirstRoute(),
    
  ));
}

class FirstRoute extends StatefulWidget {
  const FirstRoute({super.key});

  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  @override
void initState(){
  super.initState();
  (() async{
    FlutterWindowManager.addFlags(
    FlutterWindowManager.FLAG_SECURE);
  })();
}

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
            title:  Center(
              child: GradientText(
                'BIENVENIDOS',
                style: const TextStyle(
                    fontSize: 55.0,
                ),
                gradientType: GradientType.linear,
                gradientDirection: GradientDirection.ttb,
                radius: 2.5,
                colors: const [
                    Color.fromARGB(255, 170, 63, 233),
                    Color.fromARGB(255, 66, 91, 233),
                    Color.fromARGB(255, 60, 135, 221),
                ],
            ),
            ),
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
                      height: 50,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        MaterialButton(
                          child: const SizedBox(height: 150, width: 145, child: Image(image: AssetImage('assets/profesor.png'))),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const FormP(),));
                          },
                        ),
                        MaterialButton(
                      child: const SizedBox(height: 150, width: 145, child: Image(image: AssetImage('assets/alumno.png'))),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Formes(),));
                      },
                    ),
                      ],
                    ),
                      Row(
                          children: [
                            const SizedBox(
                              width: 27,
                            ),
                             GradientText(
                'PROFESOR',
                style: const TextStyle(
                    fontSize: 30.0,
                ),
                gradientType: GradientType.linear,
                gradientDirection: GradientDirection.ttb,
                radius: 2.5,
                colors: const [
                    Color.fromARGB(255, 170, 63, 233),
                    Color.fromARGB(255, 66, 91, 233),
                    Color.fromARGB(255, 60, 135, 221),
                ],
            ),
            const SizedBox(
              width: 50,
            ),
             GradientText(
                'ALUMNO',
                style: const TextStyle(
                    fontSize: 30.0,
                ),
                gradientType: GradientType.linear,
                gradientDirection: GradientDirection.ttb,
                radius: 2.5,
                colors: const [
                    Color.fromARGB(255, 170, 63, 233),
                    Color.fromARGB(255, 66, 91, 233),
                    Color.fromARGB(255, 60, 135, 221),
                ],
            ),
                          ],
                      ),
                    
                        
                    
                      
                    const SizedBox(
                      height: 40,
                    ),
                        
                    MaterialButton(
                      child: const SizedBox(height: 150, width: 145, child: Image(image: AssetImage('assets/admin.png'))),
                      onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const FormA(),));
                      },
                    ),

                     GradientText(
                'ADMINISTRADOR',
                style: const TextStyle(
                    fontSize: 30.0,
                ),
                gradientType: GradientType.linear,
                gradientDirection: GradientDirection.ttb,
                radius: 2.5,
                colors: const [
                    Color.fromARGB(255, 170, 63, 233),
                    Color.fromARGB(255, 66, 91, 233),
                    Color.fromARGB(255, 60, 135, 221),
                ],
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
    child: Center(
              child: GradientText(
                '----¿COMO DESEA INICIAR SESION?----',
                style: const TextStyle(
                    fontSize: 23,
                ),
                gradientType: GradientType.linear,
                gradientDirection: GradientDirection.ttb,
                radius: 2.5,
                colors: const [
                    Color.fromARGB(255, 170, 63, 233),
                    Color.fromARGB(255, 66, 91, 233),
                    Color.fromARGB(255, 60, 135, 221),
                ],
            ),
            ),
    );
}


      
