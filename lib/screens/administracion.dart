import 'package:flutter/material.dart';
import 'package:ingles/screens/verusu.dart';

import 'eliminar.dart';


class Admin extends StatelessWidget {
  const Admin({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Administracion(),
    );
  }
}

class Administracion extends StatefulWidget {
  const Administracion({super.key});

  @override
  State<Administracion> createState() => _AdministracionState();
}

class _AdministracionState extends State<Administracion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fondoc.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          children: <Widget>[cuerpo()],
        ),
      ),
    );
  }

  Widget cuerpo() {
    return Container(
      child: Column(
        children: <Widget>[
          espa(),
          titulo(),
          titulo1(),
          espacio(),
          espacio(),
          espacio(),
          espacio(),
          espacio(),
          consultas(),
          espacio(),
          espacio(),
          espacio(),
          espacio(),
          eliminar(),
          espacio(),
          espacio(),
          espacio(),
          espacio(),
          profe()
        ],
      ),
    );
  }

  Widget espa() {
    return const SizedBox(height: 10);
  }

  Widget titulo() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(0),
        child: const Text(
          'Administración',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 12, 26, 111),
          ),
        ),
      ),
    );
  }

  Widget titulo1() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(0),
        child: const Text(
          'de General',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 12, 26, 111),
          ),
        ),
      ),
    );
  }

  Widget espacio() {
    return const SizedBox(height: 24);
  }

  Widget consultas() {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        // Acción al presionar el botón
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VerUsuarios()),
                   );
      },
      child: Text('Consultar'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(
            255, 140, 156, 226)), // Establece el color de fondo del botón
        minimumSize: MaterialStateProperty.all<Size>(
            const Size(180, 50)), // Establece el ancho y alto del botón
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
              fontSize: 26,
              color: Colors.blue), // Establece el tamaño y color del texto
        ),
      ),
    ));
  }

  Widget eliminar() {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        // Acción al presionar el botón
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EliminarDatos()),
                   );
      },
      child: Text('Eliminar'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(
            255, 140, 156, 226)), // Establece el color de fondo del botón
        minimumSize: MaterialStateProperty.all<Size>(
            const Size(180, 50)), // Establece el ancho y alto del botón
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
              fontSize: 26,
              color: Colors.blue), // Establece el tamaño y color del texto
        ),
      ),
    ));
  }

  Widget profe() {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        // Acción al presionar el botón
        
      },
      child: Text('Profesor'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(
            255, 140, 156, 226)), // Establece el color de fondo del botón
        minimumSize: MaterialStateProperty.all<Size>(
            const Size(180, 50)), // Establece el ancho y alto del botón
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
              fontSize: 26,
              color: Color.fromARGB(
                  255, 12, 7, 167)), // Establece el tamaño y color del texto
        ),
      ),
    ));
  }
}
