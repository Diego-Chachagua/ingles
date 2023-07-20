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
  final changeask = TextEditingController();
   final nameask = TextEditingController();
  int opactual = 0;
  List<Widget> _addedWidgets = [];
  String usuariobd = "";
  String contrabd = "";
  String nameA = "NAME OF ACTIVITY/TASK";
  int number = 1;
  String ask = "Escribe tu pregunta aqui";


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
                      height: 60,
                      child: TextField(
                        enabled: false,
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
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: _addedWidgets,
                )
              ],
            ),
          )),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () async {
                  setState(() {
                    
                    _nameask(context);
                  });
                },
                child: Icon(Icons.add_comment_outlined),
              ),
              FloatingActionButton(
                onPressed: () {
                  _elegirImg(context);
                },
                child: Icon(Icons.add_photo_alternate_outlined),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add_link_rounded),
              ),
            ],
          ),
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
                      child: const Text(
                        'Aceptar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }

//mensaje emergente para mostrar una pantalla emergente para cambiar la pregunta

  void _changeask(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("Cambia la pregunta"),
            actions: [
              Column(
                children: [
                  Center(
                    child: Container(
                      width: 250,
                      height: 80,
                      child: TextField(
                        controller: changeask,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        maxLength: 40,
                        maxLines: 2,
                        decoration: const InputDecoration.collapsed(
                            hintText: "Escribe la pregunta aqui",
                            hintStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          if (changeask.text == "") {
                            ask = "Escribe tu pregunta aqui";
                            number;
                          } else {
                            number;
                            ask = changeask.text;
                          }
                        });
                      },
                      child: const Text(
                        'Aceptar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }

  //widget para crear una pregunta
  Widget usuario() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: TextField(
            enabled: false,
            decoration: InputDecoration.collapsed(
              hintText: "${number++}-${ask}",
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        MaterialButton(
          onPressed: () {
            _changeask(context);
          },
          minWidth: 10,
          height: 50,
          child: Container(
            width: 30,
            height: 30,
            child: Icon(Icons.edit),
          ),
        )
      ],
    );
  }

  void _elegirImg(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Seleccionar una imagen"),
            content: MaterialButton(
              onPressed: () {},
              minWidth: 40,
              height: 70,
              child: SizedBox(
                width: 150,
                height: 50,
                child: Center(
                    child: Row(
                  children: const [
                    Text("Elegir imagen"),
                    const SizedBox(
                      width: 30,
                    ),
                    Icon(Icons.image)
                  ],
                )),
              ),
            ),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar'),
                ),
              )
            ],
          );
        });
  }
  void _nameask(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("Cambia la pregunta"),
            actions: [
              Column(
                children: [
                  Center(
                    child: Container(
                      width: 250,
                      height: 80,
                      child: TextField(
                        controller: nameask,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        maxLength: 40,
                        maxLines: 2,
                        decoration: const InputDecoration.collapsed(
                            hintText: "Escribe la pregunta aqui",
                            hintStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          if (nameask.text == "") {
                            ask = "Escribe tu pregunta aqui";
                            number;
                          } else {
                            number;
                            ask = nameask.text;
                            _addedWidgets.add(usuario());
                          }
                        });
                      },
                      child: const Text(
                        'Aceptar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}
