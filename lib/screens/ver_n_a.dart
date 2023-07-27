// ignore: file_names
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../main.dart';
import 'package:ingles/developer/consultad.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: VerNotasA(usuario: '', contra: '',),
  ));
}

class VerNotasA extends StatefulWidget {
  final String contra;
  final String usuario;
  const VerNotasA({super.key, required this.contra, required this.usuario, });

  @override
  State<VerNotasA> createState() => _VerNotasAEState();
}

class _VerNotasAEState extends State<VerNotasA> {
  final usuariob = TextEditingController();
  final contrab = TextEditingController();

  String usuariobd = "";
  String contrabd = "";
  var resultado;
  var dato;
  List<String> nombre = [];
  List<String> nota = [];

@override
void initState() {
  super.initState();
  (() async {
    usuariobd = widget.usuario;
    contrabd = widget.contra;
    resultado = await historialestu2(usuariobd, contrabd);
    if (resultado != null) {
      for (var dato in resultado) {
        print(dato);
        var nombre_p = dato['nombre'];
        var nota_p = dato['nota'];

        setState(() {
          nombre.add(nombre_p);
          nota.add(nota_p);
        });
      }
    } else {
      print("El resultado es nulo.");
    }
  })();
}

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondo_v.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              title: Center(
                child: Column(
                  children: [
                    GradientText(
                      'HOMEWORK GRADES',
                      style: const TextStyle(
                        fontSize: 30.0,
                      ),
                      gradientType: GradientType.linear,
                      gradientDirection: GradientDirection.ttb,
                      radius: 3.5,
                      colors: const [
                        Color.fromARGB(255, 170, 63, 233),
                        Color.fromARGB(255, 66, 91, 233),
                        Color.fromARGB(255, 60, 135, 221),
                      ],
                    ),
                    GradientText(
                      '(Calificaciones de tarea)',
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                      gradientType: GradientType.linear,
                      gradientDirection: GradientDirection.ttb,
                      radius: 3.5,
                      colors: const [
                        Color.fromARGB(255, 170, 63, 233),
                        Color.fromARGB(255, 66, 91, 233),
                        Color.fromARGB(255, 60, 135, 221),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 1000,
                  color: Colors.black,
                  height: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                for (var i = 0; i < nombre.length; i++)
                Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 320,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color: Color.fromARGB(255, 249, 249, 249),
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 30,
                          top: 20,
                          child: Text(nombre[i], style: TextStyle(fontSize: 15)),
                        ),
                        Positioned(
                          left: 255,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 2,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 270,
                          top: 20,
                          child: Text(nota[i] + "/10"),
                        ),
                      ],
                    ),
                  ),
              ],
            ))));
  }

}
