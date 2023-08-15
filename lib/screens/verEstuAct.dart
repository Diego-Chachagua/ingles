// ignore: file_names

import 'package:flutter/material.dart';
import 'package:ingles/screens/select_A_S.dart';
import '../developer/consultasf.dart';
import 'calificar_E.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: VerEstuAct(
      anio: '',
      seccion: '',
      cod_p: '',
    ),
  ));
}

class VerEstuAct extends StatefulWidget {
  String anio;
  String seccion;
  String cod_p;
  VerEstuAct(
      {super.key,
      required this.anio,
      required this.seccion,
      required this.cod_p});
  @override
  State<VerEstuAct> createState() => _VerEstuActState();
}

class _VerEstuActState extends State<VerEstuAct> {
  var resultado;
  var resultado2;
  List nombres = [];
  List apellidos = [];
  var secc;
  List nie = [];

  @override
  void initState() {
    super.initState();
    getActivitys();
  }

  Future<void> getActivitys() async {
    resultado = await shownieAlum(widget.anio, widget.seccion);
    setState(() {
      nie.clear();
      nombres.clear();
      if (resultado != "noExisten") {
        var n = resultado.length;
        if (n == null) {
          n = 1;
        }
        for (var i = 0; i < n; i++) {
          var dato = resultado[i];
          var codigo = dato["nie"];
          var nombre = dato["nombre_e"];
          var apellido = dato["apellido_e"];
          nie.add(codigo);
          nombres.add(nombre);
          apellidos.add(apellido);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.seccion == "1") {
      secc = "A";
    } else if (widget.seccion == "2") {
      secc = "E";
    } else if (widget.seccion == "3") {
      secc = "K";
    } else if (widget.seccion == "4") {
      secc = "G";
    } else if (widget.seccion == "5") {
      secc = "D";
    } else if (widget.seccion == "6") {
      secc = "O";
    } else if (widget.seccion == "7") {
      secc = "L";
    } else if (widget.seccion == "8") {
      secc = "M";
    } else if (widget.seccion == "9") {
      secc = "N";
    } else if (widget.seccion == "10") {
      secc = "F";
    }
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondof.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            appBar: AppBar(
              leading: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectAS(
                              cod_p: widget.cod_p,
                            )),
                  );
                },
                child: Center(child: Icon(Icons.arrow_back)),
              ),
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Column(
              children: [
                Text(
                  'Se muestran estudiantes de ${widget.anio}°  "${secc}" ',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 1000,
                  color: Colors.black,
                  height: 2,
                ),
                //fin de espacio para definicion de linea
                const SizedBox(
                  height: 20,
                ),
                //espacio para definición de contenedor para mostrar historial
                for (var i = 0; i < nie.length; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () async {
                          if (nie[i] != "0") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CalificarE(
                                        nombres: nombres[i] +" "+ apellidos[i],
                                        nie: nie[i],
                                        anio: widget.anio,
                                        seccion: widget.seccion,
                                        cod_profe: widget.cod_p,
                                      )),
                            );
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          width: 350,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
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
                                child: Text(nombres[i] + " " + apellidos[i],
                                    style: TextStyle(fontSize: 15)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                //fin de definición de contenedor
              ],
            ))));
  }
}
