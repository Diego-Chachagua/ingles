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
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width;
    double textSizep = screenWidth < 340 ? 5.00 : screenWidth > 600? 30.00 : 50.00;//para textos principal
    double textSize = screenWidth < 340 ? 15.00 : screenWidth > 600? 30.00 : 16.00;//para textos normales
    double textSize2 = screenWidth < 340 ? 20.0 : screenWidth >600 ? 40.00 : 20.00;//para titulos
    double textSize3 = screenWidth < 340 ? 15.0 : screenWidth >600 ? 30.00 : 20.00;//para botones
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
                style:  TextStyle(
                    fontSize: textSizep,
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
              Container(
    color: Colors.transparent,
    child: Center(
              child: GradientText(
                '----¿COMO DESEA INICIAR SESION?----',
                style:  TextStyle(
                    fontSize: textSize2,
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
                             SizedBox(
                              width: screenSize.width * 0.15,
                            ),
                             GradientText(
                'PROFESOR',
                style:  TextStyle(
                    fontSize: textSize,
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
             SizedBox(
              width: screenSize.width * 0.28,
            ),
             GradientText(
                'ALUMNO',
                style:  TextStyle(
                    fontSize: textSize,
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
                style:  TextStyle(
                    fontSize: textSize,
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