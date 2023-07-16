// ignore_for_file: avoid_print, unnecessary_string_escapes, avoid_function_literals_in_foreach_calls, sort_child_properties_last, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../developer/consultad.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp( 
        debugShowCheckedModeBanner: false, home: EliminarDatos());
  }
}

class EliminarDatos extends StatefulWidget {
  const EliminarDatos({super.key});

  @override
  State<EliminarDatos> createState() => _EliminarDatosState();
}

class _EliminarDatosState extends State<EliminarDatos> {
  String usu = '';
  String usu2 = '';
  String _seleccionada = 'Seleccione una opcion';
  List opcion = ['Seleccione una opcion', 'Maestro', 'Estudiante'];
  TextEditingController _controller = TextEditingController();
  final _numberOnlyFormatter = FilteringTextInputFormatter.digitsOnly;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/10.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 130,
          elevation: 0,
          title:  const Text(
            '        \n  Eliminación \n  de Usuarios',
          style: TextStyle(
            fontSize: 40,
            color: Color.fromARGB(255, 73, 75, 175), // Establecer el color del texto
          ),
          
          ),
            backgroundColor: const Color(0x00E8E2E2),

        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          children: <Widget>[cuerpo()],
        ),
      ),
    );
  }

  Widget cuerpo() {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        children: <Widget>[
          dropdDown(),
          espacio(),
          espacio(),
          _createInput2(),
          espacio(),
          espacio(),
          boton(),
          _createInput(),
          boton2()
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> getOptionsDropDownButton() {
    List<DropdownMenuItem<String>> opciones = [];
    opcion.forEach((element) {
      opciones.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
    return opciones;
  }

  Widget dropdDown() {
    return Row(children: <Widget>[
     const SizedBox(width: 1),
      DropdownButton(
        value: _seleccionada,
        items: getOptionsDropDownButton(),
        onChanged: (value) {
          setState(() {
            usu2 = _seleccionada = value.toString();
          });
        },
      ),
    ]);
  }

  Widget espacio() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget _createInput2() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        controller: _controller,
        inputFormatters: [_numberOnlyFormatter],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          fillColor: Color.fromARGB(0, 238, 238, 238),
          filled: true,
          hintText:
              'Escriba el nie codigo del docente que deseas eliminar',
          labelText: 'NIE/CODIGO',
          labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),
          hintStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          ),
          helperText: 'Escriba el nie o codigo del docente solamente',
          helperStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        ),
        style: const TextStyle(fontSize: 12.0),
      ),
    );
  }

  Widget boton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        onPressed: () async {
          // Lógica que se ejecutará cuando se presione el botón "Eliminar"
          usu = _controller.text;
          usu2;
          print(usu);
          print(usu2);
          _controller.text = '';
          eliminarUsu(usu, usu2);
          setState(() {});
        },
        child: const Text(
          'Eliminar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 135, 8, 160),
          minimumSize: Size(100, 40),
        ),
      ),
      SizedBox(width: 60), // Espacio entre los botones
      ElevatedButton(
        onPressed: () async {
          // Lógica que se ejecutará cuando se presione el botón "Cancelar"
          _controller.text = '';
          setState(() {});
        },
        child: const Text(
          'Cancelar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 135, 8, 160),
          minimumSize: Size(100, 40),
        ),
      ),
    ],
  );
}

Widget _createInput() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start, // Alineación del campo de entrada a la izquierda
    children: [
      SizedBox(height: 60),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          textCapitalization: TextCapitalization.sentences,
          controller: _controller,
          inputFormatters: [_numberOnlyFormatter],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            fillColor: Color.fromARGB(0, 238, 238, 238),
            filled: true,
            hintText: 'Introduzca la contraseña:',
            hintStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            helperText: 'Esta acción eliminará todos los estudiantes',
            helperStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          style: const TextStyle(fontSize: 12.0),
        ),
      ),
    ],
  );
}

Widget boton2() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(height: 120),
      ElevatedButton(
        onPressed: () async {
          // Lógica que se ejecutará cuando se presione el botón "Eliminar"
        },
        child: const Text(
          'Aceptar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 135, 8, 160),
          minimumSize: Size(100, 40),
        ),
      ),
      SizedBox(width: 60), // Espacio entre los botones
      ElevatedButton(
        onPressed: () async {
          // Lógica que se ejecutará cuando se presione el botón "Cancelar"
          _controller.text = '';
          setState(() {});
        },
        child: const Text(
          'Cancelar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 135, 8, 160),
          minimumSize: Size(100, 40),
        ),
      ),
    ],
  );
}

}
