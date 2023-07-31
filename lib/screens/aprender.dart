// ignore: file_names
import 'package:flutter/services.dart';
import 'package:ingles/screens/registrarse.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import '../developer/consultaso.dart';
import '../main.dart';
import 'form_p.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: Videos(),
  ));
}

class Videos extends StatefulWidget {
  const Videos();

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {


  void copyToClipboard(String data) {
    Clipboard.setData(ClipboardData(text: data));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Datos copiados al portapapeles')),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondof.jpg'),
            fit: BoxFit.fill
          ),
        ),
      child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              
              title: Center(
                child: GradientText(
                  'VIDEOS DE APRENDIZAJE',
                  style: const TextStyle(
                      fontSize: 20.0,
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
            child:  Padding(
              padding: const EdgeInsets.all(2.0),
            child: Table(
              columnWidths: const {0: FractionColumnWidth(0.4)},
              border: TableBorder.all(),
              children:  [
                TableRow(
                  children: [
                    opcines(),
                    enlaces(),
                  ]
                ),

                 TableRow(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255)
                  ),
                  children: [
                    Basico(),
                     InkWell(
                                onTap: () {
                                  String userData =
                                      'https://youtu.be/bpMELj9caNY';
                                  copyToClipboard(userData);
                                },
                                child: Text(
                                  'https://youtu.be/bpMELj9caNY',
                                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                     
                  ]
                 ),

                 TableRow(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255)
                  ),
                  children: [
                    medio(),
                     InkWell(
                                onTap: () {
                                  String userData =
                                      'https://youtu.be/qHMf1yLe_BU';
                                  copyToClipboard(userData);
                                },
                                child: Text(
                                  'https://youtu.be/qHMf1yLe_BU',
                                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                     
                  ]
                 ),

                  TableRow(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255)
                  ),
                  children: [
                    avanzado(),
                     InkWell(
                                onTap: () {
                                  String userData =
                                      'https://youtu.be/8UUsGGwrNCY';
                                  copyToClipboard(userData);
                                },
                                child: Text(
                                  'https://youtu.be/8UUsGGwrNCY',
                                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                     
                  ]
                 ),

                  TableRow(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255)
                  ),
                  children: [
                    MUSICA(),
                     InkWell(
                                onTap: () {
                                  String userData =
                                      'https://youtu.be/LaaOaTuiU_s';
                                  copyToClipboard(userData);
                                },
                                child: Text(
                                  'https://youtu.be/LaaOaTuiU_s',
                                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                     
                  ]
                 ),

                  TableRow(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255)
                  ),
                  children: [
                    paginas(),
                     InkWell(
                                onTap: () {
                                  String userData =
                                      'https://www.juegosparaaprenderingles.org/';
                                  copyToClipboard(userData);
                                },
                                child: Text(
                                  'https://www.juegosparaaprenderingles.org/',
                                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                     
                  ]
                 )

              ],
            ),
            ),
          ),
    
          ),
    );
  }

Widget medio() {
    return Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: const Center(
            child: Text('Nivel Medio',style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
        )));
  }

  Widget Basico() {
    return Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: const Center(
            child: Text('Nivel Básico',style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
        )));
  }

  Widget MUSICA() {
    return Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: const Center(
            child: Text('Música',style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
        )));
  }

  Widget avanzado() {
    return Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: const Center(
            child: Text('Nivel Avanzado',style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
        )));
  }

  Widget paginas() {
    return Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: const Center(
            child: Text('Juegos',style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
        )));
  }

  Widget opcines() {
    return Container(
        color: const Color.fromARGB(255, 150, 70, 255),
        child: const Center(
            child: Text('Aprendizaje',style: TextStyle(fontSize: 20, color: Colors.white),
        )));
  }

    Widget enlaces() {
    return Container(
        color: const Color.fromARGB(255, 150, 70, 255),
        child: const Center(
            child: Text('Enlaces',style: TextStyle(fontSize: 20, color: Colors.white),
        )));
  }

}