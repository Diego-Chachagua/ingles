// ignore: file_names
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import '../developer/consultaso.dart';
import '../main.dart';
import 'elec_op_p.dart';
import 'tareasM.dart';
import 'unidades.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Imagen(
      imagen: '',
    ),
  ));
}

class Imagen extends StatefulWidget {
  var imagen;
   Imagen({super.key,required this.imagen});

  @override
  State<Imagen> createState() => _ImagenState();
}

class _ImagenState extends State<Imagen> {

   bool _obscureText = true;
final usuariob =TextEditingController();
final contrab =TextEditingController();
var reslt;
var cod;

  String usuariobd = "";
  String contrabd = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fondof.jpg'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
         
        ),
        backgroundColor: Colors.transparent,
        body: 
        InteractiveViewer(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: MemoryImage(widget.imagen))
            ),
          ),
        )
      ),
    );
  }
//widgets que forman la aplicacion
// ignore: non_constant_identifier_names
}
