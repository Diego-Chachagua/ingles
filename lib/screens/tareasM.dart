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
  final nameac = TextEditingController();

  String usuariobd = "";
  String contrabd = "";
  String nameA = "NAME OF ACTIVITY/TASK";

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
                    Container(
                      width: 250,
                      height: 80,
                      child: TextField(
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        decoration: InputDecoration.collapsed(
                            hintText: nameA,
                            hintStyle: TextStyle(fontSize: 20)),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    MaterialButton(
                      onPressed: () {
                        _changename(context);
                      },
                      minWidth: 20,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/editar.png"))),
                      ),
                    )
                  ],
                ),
                Container(
                  width: 500,
                  height: 2,
                  color: Colors.black,
                ),
              ],
            ),
          )),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.add_comment_outlined),
              label: 'Add Ask'

            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.add_photo_alternate_outlined),
            label: 'Add Image'
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.add_link_outlined),
            label: 'Record Audio'
            ),
            
          ]),
        ));
  }

//mensaje emergente para cambiar el nombre de la actividad o tarea
  void _changename(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("Cambia el nombre de la actividad"),
            actions: [
              Column(
                children: [
                  Center(
                    child: Container(
                      width: 250,
                      height: 80,
                      child: TextField(
                        controller: nameac,
                        textCapitalization: TextCapitalization.characters,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        maxLength: 40,
                        maxLines: 2,
                        decoration: const InputDecoration.collapsed(
                            hintText: "NAME OF ACTIVITY/TASK",
                            hintStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          if (nameac.text == "") {
                            nameA = "NAME OF ACTIVITY/TASK";
                          } else {
                            nameA = nameac.text;
                          }
                        });
                      },
                      child: const Text('Aceptar',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}
