import 'package:flutter/material.dart';
import 'package:ingles/screens/form_a.dart';
import 'package:ingles/screens/form_es.dart';
import 'package:ingles/screens/form_p.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import 'screens/manual.dart';

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
  void initState() {
    super.initState();
    (() async {
      FlutterWindowManager.addFlags(
      FlutterWindowManager.FLAG_SECURE);
    })();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;//contenedores
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth < 340 ? 10.00 : screenWidth > 600? 40.00 : 20.00;//textos 
    double textSize2 = screenWidth < 340 ? 20.0 : screenWidth >600 ? 80.00 : 40.00;//titulos
    double textSize3 = screenWidth < 340 ? 15.0 : screenWidth >600 ? 50.00 : 30.00;
    double textSize4 = screenWidth < 340 ? 10.0 : screenWidth >600 ? 30.00 : 15.00;// letra de Botones
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fondop.jpg'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: GradientText(
              'WELCOME',
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
          fontSize: textSize ,
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
                     SizedBox(
                      height: screenSize.height * 0.1,
                    ),
                    Row(
                      children: [
                         SizedBox(
                          width: screenSize.width * 0.05,
                        ),
                        MaterialButton(
                          child:  SizedBox(
                             width: screenSize.width * 0.35, // Utiliza el 80% del ancho de la pantalla
                            height: screenSize.height * 0.2, // Utiliza el 30% de la altura de la pantalla
                              child: Image(
                                  image: AssetImage('assets/profesor.png'))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FormP(),
                                ));
                          },
                        ),
                         SizedBox(
                          width: screenSize.width * 0.05,
                        ),
                        MaterialButton(
                          child: SizedBox(
                               width: screenSize.width * 0.35, // Utiliza el 80% del ancho de la pantalla
                            height: screenSize.height * 0.2,
                              child: Image(
                                  image: AssetImage('assets/alumno.png'))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Formes(),
                                ));
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                         SizedBox(
                          width: screenSize.width * 0.07,
                        ),
                        GradientText(
                          'PROFESOR',
                          style: TextStyle(
                            fontSize: textSize3,
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
                          width: screenSize.width * 0.13,
                        ),
                        GradientText(
                          'ALUMNO',
                          style:  TextStyle(
                            fontSize: textSize3,
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
                     SizedBox(
                          height: screenSize.height * 0.07,
                        ),
                    MaterialButton(
                      child:  SizedBox(
                           width: screenSize.width * 0.35, // Utiliza el 80% del ancho de la pantalla
                            height: screenSize.height * 0.2,
                          child: Image(image: AssetImage('assets/admin.png'))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FormA(),
                            ));
                      },
                    ),
                    GradientText(
                      'ADMINISTRADOR',
                      style:  TextStyle(
                        fontSize: textSize3,
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
                   SizedBox(
                          height: screenSize.height * 0.3,
                        ),
                  Container(
                    height: screenSize.height * 0.05,
                     width: screenSize.width * 0.2,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Ayuda(),
                            )); // Lógica que se ejecutará cuando se presione el botón "Guardar"
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 64, 65,
                            66), // Cambia el color de fondo del botón a rojo
                      ),
                      child:  Text('Ayuda',style: TextStyle(fontSize: textSize4),),
                    ),
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