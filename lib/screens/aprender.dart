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
              padding: const EdgeInsets.all(7.0),
            child: Table(
              columnWidths: const {0: FractionColumnWidth(0.3)},
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
                                  style: TextStyle(color: Colors.white),
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
        color: const Color.fromARGB(255, 150, 70, 255),
        child: const Center(
            child: Text('Nivel Medio',style: TextStyle(fontSize: 20, color: Colors.white),
        )));
  }

  Widget Basico() {
    return Container(
        color: const Color.fromARGB(255, 150, 70, 255),
        child: const Center(
            child: Text('Nivel Básico',style: TextStyle(fontSize: 20, color: Colors.white),
        )));
  }

  Widget MUSICA() {
    return Container(
        color: const Color.fromARGB(255, 150, 70, 255),
        child: const Center(
            child: Text('Música',style: TextStyle(fontSize: 20, color: Colors.white),
        )));
  }

  Widget avanzado() {
    return Container(
        color: const Color.fromARGB(255, 150, 70, 255),
        child: const Center(
            child: Text('Nivel Avanzado',style: TextStyle(fontSize: 20, color: Colors.white),
        )));
  }

  Widget paginas() {
    return Container(
        color: const Color.fromARGB(255, 150, 70, 255),
        child: const Center(
            child: Text('Pagina web',style: TextStyle(fontSize: 20, color: Colors.white),
        )));
  }

  Widget opcines() {
    return Container(
        color: const Color.fromARGB(255, 150, 70, 255),
        child: const Center(
            child: Text('Opciones de aprendizaje',style: TextStyle(fontSize: 20, color: Colors.white),
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