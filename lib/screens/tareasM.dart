import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../developer/consultasf.dart';
import '../main.dart';
import 'elec_e_o_t.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

import 'elec_op_p.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: TareasP(cod: '',cod_p: '',),
  ));
}

class TareasP extends StatefulWidget {
  String cod;
  String cod_p;
  
  TareasP({ required this.cod, required this.cod_p});

  @override
  State<TareasP> createState() => _TareasPEState();
}

class _TareasPEState extends State<TareasP> {
  String nameA = "NAME OF ACTIVITY/TASK";
//campos para elegir el año y la seccion
String _seleccionada2 = 'Año';
    String _seleccionada = 'Seccion';
  //generar validacion de formularios
  GlobalKey<FormState> valueupdateimg = GlobalKey<FormState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formchangeask = GlobalKey<FormState>();
  GlobalKey<FormState> nameact = GlobalKey<FormState>();
  GlobalKey<FormState> aniosec = GlobalKey<FormState>();
  File? imagen;
//future para buscar y almacenar imagen
  Future setimage(var ask) async {
    var picturefile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (picturefile != null) {
        imagen = File(picturefile.path);
        agregarImg(ask, imagen, widget.cod);
      } else {
        setState(() {
          final snackBar =
              SnackBar(content: Text("No se agrego ninguna imagen"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      }
    });
  }

//funcion para actualizar una imagen en la base datos
  Future updateimage(var ask, var cod) async {
    var picturefile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (picturefile != null) {
        imagen = File(picturefile.path);
        updateImg(cod, ask, imagen);
      } else {
        setState(() {
          final snackBar =
              SnackBar(content: Text("No se agrego ninguna imagen"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      }
    });
  }

  final usuariob = TextEditingController();
  final contrab = TextEditingController();
  final nameac = TextEditingController();
  final changeask = TextEditingController();
  final cod_changeask = TextEditingController();
  final nameask = TextEditingController();
  final anio = TextEditingController();
  final seccion = TextEditingController();
  int opactual = 0;
  var i = 0;
  String cod_ask = "";
  String usuariobd = "";
  String contrabd = "";

  int number = 1;
  String ask = "Escribe tu pregunta aqui";
  var reslt;
  List preguntas = [];
  List imagenes = [];
  List images = [];
  List cod_p = [];

  @override
  void initState() {
    super.initState();
    obtenerpreguntas();
  }

  Future<void> obtenerpreguntas() async {
    print(widget.cod_p);
    reslt = await mostrarAct(widget.cod);

    setState(() {
      preguntas.clear();
      imagenes.clear();
      images.clear();
      cod_p.clear(); // Limpiar la lista antes de agregar las nuevas preguntas

      if (reslt != "noExisten") {
        for (var i = 0; i < reslt.length; i++) {
          var dato = reslt[i];
          var nombreAct = dato["nombre"];

          var nom_tem = dato["pregunta"];
          var cod = dato["cod_p_a"];
          var img = dato["img"];
          print(img);
          preguntas.add(nom_tem);
          imagenes.add(img);
          if (nombreAct != "") {
            nameA = nombreAct;
          } else {
            nameA = "Name of activity";
          }

          print(nameA);
          cod_p.add(cod);
          if (img != null) {
            Uint8List bytes = base64.decode(img);

            images.add(bytes);
          } else {
            images.add("no e se puede");
          }

          // Agregar las nuevas preguntas a la lista
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondop.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          
          appBar: AppBar(
            leading: MaterialButton(onPressed: (){
              if(nameA == "NAME OF ACTIVITY/TASK") {
                              final snackBar = SnackBar(
                                    content:
                                        Text("Es necesario cambiar el nombre"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                _changename(context);                                                   
                            }else  {
                               
                            }
            },
            child: SizedBox(width: 30,height: 30,child: Icon(Icons.arrow_back_outlined),),),
            title: Center(child: Text("Crear Actividad o tarea")),
            elevation: 0,
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          ),
          backgroundColor: Colors.transparent,
          body: RefreshIndicator(
            onRefresh: obtenerpreguntas,
            child: ListView(children: [
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 250,
                          height: 60,
                          child: Text(
                            nameA,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            _op_askimage(context);
                          },
                          child: Container(
                            width: 210,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 185, 160, 209),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Editar una pregunta/imagen"),
                                Padding(padding: EdgeInsets.all(5)),
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                      ],
                    ),

                    Padding(padding: EdgeInsets.all(10)),

                    for (i = 0; i < preguntas.length; i++)
                      Column(
                        children: [
                          imagenes[i] == null
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 330,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 167, 137, 194),
                                          border: Border.all(width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${i}  -  ${preguntas[i]}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color.fromARGB(
                                                    255, 238, 234, 234)),
                                          ),
                                          Text("${cod_p[i]}"),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 330,
                                      height: 300,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 167, 137, 194),
                                          border: Border.all(width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${i}  -  ${preguntas[i]}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color.fromARGB(
                                                        255, 238, 234, 234)),
                                              ),
                                              Text("${cod_p[i]}"),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          if (i < images.length)
                                            Container(
                                              width: 300,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image:
                                                        MemoryImage(images[i]),
                                                    fit: BoxFit.cover),
                                              ),
                                            )
                                          else
                                            Container(
                                              width: 300,
                                              height: 200,
                                              child: Center(
                                                  child: Text(
                                                      "No se puede mostrar la imagen")),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),

                    const SizedBox(
                      height: 40,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MaterialButton(
                          onPressed: ()  {
                            if(nameA == "NAME OF ACTIVITY/TASK") {
                              final snackBar = SnackBar(
                                    content:
                                        Text("Es necesario cambiar el nombre"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                _changename(context);
                               
                              
                            }else if (i < 2) {
                               final snackBar = SnackBar(
                                    content: Text(
                                        "Debes contener almenos 10 preguntas"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                
                               }else {
                                _addcodSG(context);
                               
                              }
                            
                          },
                          child: Container(
                            width: 70,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 225, 204, 243),
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text("Guardar"),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 20))
                      ],
                    )

                    //edicion de patalla
                  ],
                ),
              )
            ]),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                heroTag: 'tag1',
                onPressed: () async {
                  setState(() {
                    _nameask(context);
                  });
                },
                child: Icon(Icons.add_comment_outlined),
              ),
              FloatingActionButton(
                heroTag: 'tag2',
                onPressed: () {
                  _elegirImg(context);
                },
                child: Icon(Icons.add_photo_alternate_outlined),
              ),
              FloatingActionButton(
                heroTag: 'tag3',
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
                      child: Form(
                        key: nameact,
                        child: TextFormField(
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Campo requerido";
                            }
                          },
                          controller: nameac,
                          textCapitalization: TextCapitalization.characters,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.black,
                          maxLength: 40,
                          maxLines: 2,
                          decoration: const InputDecoration.collapsed(
                              hintText: "Nombre de la actividad",
                              hintStyle: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            if (nameact.currentState!.validate()) {
                              Navigator.pop(context);
                              var nombre = nameac.text;
                              editname(nombre, widget.cod);
                            }
                          },
                          child: const Text(
                            'Aceptar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
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
        barrierDismissible: false,
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
                      height: 158,
                      child: Form(
                        key: formchangeask,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Campo requerido";
                                }
                              },
                              controller: cod_changeask,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              maxLength: 4,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  hintText: "Escribe el codigo de la pregunta",
                                  hintStyle: TextStyle(fontSize: 15)),
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            TextFormField(
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Campo requerido";
                                }
                              },
                              controller: changeask,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              maxLength: 40,
                              maxLines: 2,
                              decoration: const InputDecoration(
                                  hintText: "Escribe la pregunta aqui",
                                  hintStyle: TextStyle(fontSize: 15)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            if (formchangeask.currentState!.validate()) {
                              ask = changeask.text;
                              cod_ask = cod_changeask.text;
                              editAsk(ask, cod_ask);
                              final snackBar = SnackBar(
                                  content: Text(
                                      "Cambio exitoso.\nRefresca la pantalla "));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              changeask.text = "";
                              cod_changeask.text = "";
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            'Aceptar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              changeask.text = "";
                              cod_changeask.text = "";
                              Navigator.pop(context);
                            },
                            child: Text("Cancelar",
                                style: TextStyle(color: Colors.white)))
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }

  //espacio para añadir imagen con titulo

  void _elegirImg(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Seleccionar una imagen"),
            content: Container(
              width: 100,
              height: 150,
              child: Column(
                children: [
                  Container(
                      width: 150,
                      height: 50,
                      child: Form(
                        key: formKey,
                        child: TextFormField(
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "campo requerido";
                            }
                          },
                          controller: nameask,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.black,
                          maxLines: 2,
                          decoration: const InputDecoration.collapsed(
                              hintText: "Escribe la pregunta aqui",
                              hintStyle: TextStyle(fontSize: 15)),
                        ),
                      )),
                  MaterialButton(
                    onPressed: () {
                      var ask = nameask.text;
                      if (formKey.currentState!.validate()) {
                        setimage(ask);
                        nameask.text = "";
                        Navigator.pop(context);
                      }
                    },
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
                ],
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

  //para agregar pregunta
  void _nameask(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("Agregar pregunta"),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              if (nameask.text == "") {
                                ask = "Escribe tu pregunta aqui";
                              } else {
                                ask = nameask.text;
                                agregarAskActivity(ask, widget.cod);
                                nameask.text = "";
                              }
                            });
                          },
                          child: const Text(
                            'Aceptar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }

//espacio para elegir una opcion , si elegir una imagen o una pregunta
  void _op_askimage(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Cambiar imagen o pregunta"),
              content: Container(
                  width: 400,
                  height: 188,
                  child: Column(children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          _changeask(context);
                        });
                      },
                      minWidth: 25,
                      height: 70,
                      child: SizedBox(
                        width: 190,
                        height: 50,
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Actualizar pregunta"),
                            const SizedBox(
                              width: 30,
                            ),
                            Icon(Icons.edit)
                          ],
                        )),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          _updateImg(context);
                        });
                      },
                      minWidth: 25,
                      height: 70,
                      child: SizedBox(
                        width: 190,
                        height: 50,
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Actualizar imagen"),
                            const SizedBox(
                              width: 30,
                            ),
                            Icon(Icons.post_add_rounded)
                          ],
                        )),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: Text("Cancelar"),
                        ))
                  ])));
        });
  }

  void _updateImg(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Seleccionar una imagen"),
            content: Container(
              width: 100,
              height: 180,
              child: Column(
                children: [
                  Form(
                      key: valueupdateimg,
                      child: Column(
                        children: [
                          Container(
                            width: 150,
                            height: 50,
                            child: TextFormField(
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Campo requerido";
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: cod_changeask,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              maxLines: 2,
                              decoration: const InputDecoration(
                                  hintText:
                                      "Escribe el codigo de la pregunta aqui",
                                  hintStyle: TextStyle(fontSize: 15)),
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 50,
                            child: TextFormField(
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Campo requerido";
                                }
                              },
                              controller: nameask,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              maxLines: 2,
                              decoration: const InputDecoration(
                                  hintText: "Escribe la pregunta aqui",
                                  hintStyle: TextStyle(fontSize: 15)),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    color: Color.fromARGB(255, 209, 200, 218),
                    onPressed: () {
                      var ask = nameask.text;
                      var cod = cod_changeask.text;
                      if (valueupdateimg.currentState!.validate()) {
                        updateimage(ask, cod);
                        Navigator.pop(context);
                      }
                      cod_changeask.text = "";
                      nameask.text = "";
                    },
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
                ],
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
  void _addcodSG(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Color.fromARGB(255, 170, 63, 233),
            backgroundColor: Color.fromARGB(255, 196, 158, 218),
            title: const Text("Agregar pregunta"),
            actions: [
              Column(
                children: [
                  Center(
                    child: Container(
                      width: 250,
                      height: 80,
                      child :Form(
                        key: aniosec,
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 80,
                            height: 30,
                            child: TextFormField(
                              validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "Campo requerido";
                                  }
                                },
                                controller: anio,
                                textAlign: TextAlign.center,
                                cursorColor: Colors.black,
                                
                                decoration: const InputDecoration(
                                    hintText: "1",
                                    hintStyle: TextStyle(fontSize: 15),
                                    helperText: "Escribe el año"
                                    ), 
                            ),
                          ),
                          Container(
                            width: 90,
                            height: 30,
                            child: TextFormField(
                              validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "Campo requerido";
                                  }
                                },
                                controller:seccion,
                                textAlign: TextAlign.center,
                                cursorColor: Colors.black,
                                
                                decoration: const InputDecoration(
                                    hintText: "K",
                                    hintStyle: TextStyle(fontSize: 15),
                                    helperText: "Escribe la seccion"
                                    ),           
                            ),
                          ),
                          
                        ],
                      )),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            
                            if (aniosec.currentState!.validate()) {
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  ProfeOp(cod_p: widget.cod_p,) ),
                            ); 
                            }
                            
                          },
                          child: const Text(
                            'Aceptar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
  void wishExit(BuildContext context) {
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
                      child: Text("¿Estas seguro de salir?")
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                           
                          },
                          child: const Text(
                            'Aceptar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}
