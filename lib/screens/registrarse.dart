// ignore: file_names
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import '../developer/consultaso.dart';
import 'form_es.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: Registro(),
  ));
}

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  bool _obscureText = true;
  final usuariob = TextEditingController();
  final contrab = TextEditingController();
  final nombre = TextEditingController();
  final apellido = TextEditingController();

  String usuariobd = "";
  String contrabd = "";

  String _seleccionada = 'Año';
  List anios = [
    'Año',
    '1',
    '2',
  ];
  String _seleccionada2 = 'Seccion';
  List seccion = ['Seccion', 'A', 'F', 'E', 'H', 'G', 'D'];
  String _seleccionada3 = 'Genero';
  List gene = ['Genero', 'Masculino', 'Femenino'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fondof.jpg'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          title: Center(
            child: GradientText(
              'WELCOME',
              style: const TextStyle(
                fontSize: 50.0,
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
              Cuerpo(),
              Row(
                children: [
                  const SizedBox(
                    width: 76,
                  ),
                  const SizedBox(
                    height: 210,
                  ),
                  MaterialButton(
                    color: const Color.fromARGB(255, 135, 8, 160),
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => const Formes()),
                      );
                    },
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  MaterialButton(
                    color: const Color.fromARGB(255, 135, 8, 160),
                    onPressed: () async {},
                    child: const Text(
                      'Iniciar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

// ignore: non_constant_identifier_names
  Widget Cuerpo() {
    return Center(
      child: Column(children: <Widget>[
        espacio(),
        const SizedBox(
          height: 10,
        ),
        control(),
        const SizedBox(
          height: 10,
        ),
        crearDropdDownButton(),
        const SizedBox(
          height: 20,
        ),
        nombrea(),
        const SizedBox(
          height: 10,
        ),
        apellidoa(),
        const SizedBox(
          height: 10,
        ),
        usuario(),
        const SizedBox(
          height: 10,
        ),
        contrasena(),
        Row(
          children: [],
        )
      ]),
    );
  }

  Widget control() {
    return GradientText(
      'REGISTRO DE NUEVO USUARIO',
      style: const TextStyle(
        fontSize: 25.0,
      ),
      gradientType: GradientType.linear,
      gradientDirection: GradientDirection.ttb,
      radius: 2.5,
      colors: const [
        Color.fromARGB(255, 130, 0, 206),
        Color.fromARGB(255, 70, 119, 255),
        Color.fromARGB(255, 0, 80, 172),
      ],
    );
  }

  Widget espacio() {
    return const SizedBox(
      height: 40,
    );
  }

  Widget apellidoa() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: apellido,
        decoration: const InputDecoration(
          counterStyle: TextStyle(color: Colors.white),
          hintText: "Escriba su apellido completo",
        ),
      ),
    );
  }

  Widget nombrea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: nombre,
        decoration: const InputDecoration(
          counterStyle: TextStyle(color: Colors.white),
          hintText: "Escriba su nombre completo",
        ),
      ),
    );
  }

  Widget usuario() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: usuariob,
        decoration: const InputDecoration(
          counterStyle: TextStyle(color: Colors.white),
          hintText: "Escriba el usuario que desea usar:",
        ),
      ),
    );
  }

  Widget contrasena() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: TextField(
          controller: contrab,
          obscureText: _obscureText,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            ),
            counterStyle: const TextStyle(color: Colors.white),
            hintText: "Escriba la contraseña que desea usar:",
          ),
        ));
  }

  void _mensajeUsu(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Usuario no existe"),
            content: const Text(
                'Los datos ingresados no coinciden con alguna cuenta de usuario'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    usuariob.clear();
                    contrab.clear();
                  },
                  child: const Text('Aceptar'),
                ),
              )
            ],
          );
        });
  }

  void _mensaje(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error de conexión"),
            content:
                const Text('Ocurrió un error al conectar con la base de datos'
                    'o consulta errónea.'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                      usuariob.clear();
                      contrab.clear();
                    });
                  },
                  child: const Text('Aceptar'),
                ),
              )
            ],
          );
        });
  }

  List<DropdownMenuItem<String>> getOptionsDropDownButton() {
    List<DropdownMenuItem<String>> annios = [];
    anios.forEach((element) {
      annios.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
    return annios;
  }

  List<DropdownMenuItem<String>> getOptionsDropDownButton2() {
    List<DropdownMenuItem<String>> secciones = [];
    seccion.forEach((element) {
      secciones.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
    return secciones;
  }

  List<DropdownMenuItem<String>> getOptionsDropDownButton3() {
    List<DropdownMenuItem<String>> genero = [];
    gene.forEach((element) {
      genero.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
    return genero;
  }

  Widget crearDropdDownButton() {
    return Row(
      children: <Widget>[
        const SizedBox(width: 23),
        DropdownButton(
          value: _seleccionada,
          items: getOptionsDropDownButton(),
          onChanged: (value) {
            setState(() {
              _seleccionada = value.toString();
            });
          },
        ),
        const SizedBox(width: 39),
        DropdownButton(
          value: _seleccionada2,
          items: getOptionsDropDownButton2(),
          onChanged: (value) {
            _seleccionada2 = value.toString();

            setState(() {});
          },
        ),
        const SizedBox(width: 39),
        DropdownButton(
          value: _seleccionada3,
          items: getOptionsDropDownButton3(),
          onChanged: (value) {
            setState(() {});
          },
        ),
      ],
    );
  }
}
