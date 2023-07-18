// ignore: file_names
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../main.dart';
import 'elec_e_o_t.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: TareasP(),
  ));
}

class TareasP extends StatefulWidget {
  const TareasP({super.key});

  @override
  State<TareasP> createState() => _TareasPEState();
}

class _TareasPEState extends State<TareasP> {
  final usuariob = TextEditingController();
  final contrab = TextEditingController();

  String usuariobd = "";
  String contrabd = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondop.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            appBar: AppBar(
              title: Center(child: Text("Crear Actividad o tarea")),
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
               
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        children: [
                          Text("Name of activity"),
                          Container(
                            height: 30,
                            width: 30,
                            color: Colors.amber,
                          )
                        ],
                      ),
                      Container(width: 500,height: 2,color: Colors.black,)
                      
                      
                    ],
                  ),
                )
            )
        )
    );
  }
}
