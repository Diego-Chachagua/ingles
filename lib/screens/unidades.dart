import 'package:flutter/material.dart';

class Unidades extends StatelessWidget {
  const Unidades({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Unidad(),
    );
  }
}

class Unidad extends StatefulWidget {
  const Unidad({super.key});

  @override
  State<Unidad> createState() => _UnidadState();
}

class _UnidadState extends State<Unidad> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fondoa.jpg'), fit: BoxFit.cover),
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
          boton1y2(),
          espacio(),
          boton3y4(),
          espacio(),
          boton5y6(),
          espacio(),
          boton7y8(),
        ],
      ),
    );
  }

  Widget espa() {
    return SizedBox(height: 10);
  }

  Widget titulo() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(0),
        child: const Text(
          'Seleccione',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 174, 70, 215),
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
          'la unidad',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 174, 70, 215),
          ),
        ),
      ),
    );
  }

  Widget espacio() {
    return const SizedBox(height: 16);
  }

  Widget boton1y2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                  8.0), // Margen alrededor del botón completo
              child: IconButton(
                iconSize: 98,
                icon: Image.asset('assets/unidad1.png'),
                onPressed: () {
                  // Lógica cuando se presiona el primer botón
                },
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                  8.0), // Margen alrededor del botón completo
              child: IconButton(
                iconSize: 98,
                icon: Image.asset('assets/unidad2.png'),
                onPressed: () {
                  // Lógica cuando se presiona el segundo botón
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget boton3y4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                  8.0), // Margen alrededor del botón completo
              child: IconButton(
                iconSize: 98,
                icon: Image.asset('assets/unidad3.png'),
                onPressed: () {
                  // Lógica cuando se presiona el primer botón
                },
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                  8.0), // Margen alrededor del botón completo
              child: IconButton(
                iconSize: 98,
                icon: Image.asset('assets/unidad4.png'),
                onPressed: () {
                  // Lógica cuando se presiona el segundo botón
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget boton5y6() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                  8.0), // Margen alrededor del botón completo
              child: IconButton(
                iconSize: 98,
                icon: Image.asset('assets/unidad5.png'),
                onPressed: () {
                  // Lógica cuando se presiona el primer botón
                },
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                  8.0), // Margen alrededor del botón completo
              child: IconButton(
                iconSize: 98,
                icon: Image.asset('assets/unidad6.png'),
                onPressed: () {
                  // Lógica cuando se presiona el segundo botón
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget boton7y8() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                  8.0), // Margen alrededor del botón completo
              child: IconButton(
                iconSize: 98,
                icon: Image.asset('assets/unidad7.png'),
                onPressed: () {
                  // Lógica cuando se presiona el primer botón
                },
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                  8.0), // Margen alrededor del botón completo
              child: IconButton(
                iconSize: 98,
                icon: Image.asset('assets/unidad8.png'),
                onPressed: () {
                  // Lógica cuando se presiona el segundo botón
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
