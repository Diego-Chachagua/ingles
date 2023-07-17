// ignore_for_file: sort_child_properties_last, deprecated_member_use, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:ingles/screens/usuariop.dart';
import 'package:ingles/screens/verusualu.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VerUsuarios(),
      
    
    );
  }
}

class VerUsuarios extends StatefulWidget {
  const VerUsuarios({super.key});

  @override
  State<VerUsuarios> createState() => _VerUsuariosState();
  
}

class _VerUsuariosState extends State<VerUsuarios> {
  TextEditingController textField1Controller = TextEditingController();
  TextEditingController textField2Controller = TextEditingController();
  TextEditingController textField3Controller = TextEditingController();
  TextEditingController textField4Controller = TextEditingController();
  TextEditingController textField5Controller = TextEditingController();
  TextEditingController textField6Controller = TextEditingController();
  TextEditingController textField7Controller = TextEditingController();
  String seccionprofe = '';
  String gradoprofe = '';
  String seccione = '';
  String gradoe = '';
  String seccionu = '';
  String gradou = '';

  @override
  void dispose() {
    textField1Controller.dispose();
    textField2Controller.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/13.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          
          toolbarHeight: 130,
          title: const Text('         \n         Consultar \n             Datos',
          style: TextStyle(
            fontSize: 40,
            color: Color.fromARGB(255, 73, 75, 175), // Establecer el color del texto
          ),
          ),
          elevation: 0,
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
          espacio(),
          titulo1(),
          espacio(),
          estudiantes(),
          espacio(),
          titulo3(),
          espacio(),
          botonProfe(),
          espacio(),
          espacio(),
          espacio(),
          espacio(),
          botonAyuda()
        ],
      ),
    );
  }

  Widget espacio() {
    return const SizedBox(
      height: 20,
    );
  }


  Widget titulo1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Ver Estudiantes',
            style: TextStyle(fontSize: 24.0, 
            color: Color.fromARGB(255, 73, 75, 175),
            fontWeight: FontWeight.bold,
            )),
      ],
    );
  }

  Widget titulo2() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Perfil de Estudiantes:',
            style: TextStyle(fontSize: 24.0, 
            color: Color.fromARGB(255, 73, 75, 175),
            fontWeight: FontWeight.bold,
            )),
      ],
    );
  }

  Widget titulo3() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Ver Profesores',
            style: TextStyle(fontSize: 24.0, 
            color: Color.fromARGB(255, 73, 75, 175),
            fontWeight: FontWeight.bold,
            )),
      ],
    );
  }


  Widget estudiantes() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: TextField(
                maxLength: 1,
                textAlign: TextAlign.center,
                controller: textField6Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: Color.fromARGB(0, 238, 238, 238),
                  filled: true,
                  hintText: 'Grado',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(97, 73, 75, 175),
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'Grado',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 73, 75, 175),
                    fontWeight: FontWeight.bold,
                  ),
                  helperText: 'solo el año',
                  helperStyle: TextStyle(
                    color: Color.fromARGB(255, 73, 75, 175),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
                width: 16.0), // Espacio entre los campos de texto y el botón
            Expanded(
              flex: 2,
              child: TextField(
                controller: textField2Controller,
                maxLength: 1,
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: Color.fromARGB(0, 238, 238, 238),
                  filled: true,
                  hintText: 'Seccion',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(97, 73, 75, 175),
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'Seccion',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 73, 75, 175),
                    fontWeight: FontWeight.bold,
                  ),
                  helperText: 'solo la seccion',
                  helperStyle: TextStyle(
                    color: Color.fromARGB(255, 73, 75, 175),
                    fontWeight: FontWeight.bold,
                  )
                ),
              ),
            ),
            const SizedBox(
                width: 28.0), // Espacio entre los campos de texto y el botón
            ElevatedButton(
              onPressed: () async{
                seccione = textField2Controller.text;
                gradoe = textField6Controller.text;

                Navigator.push(context, MaterialPageRoute(builder: (context)=> UsuarioAL(seccione2: seccione, gradoe2: gradoe)));
              },
              child: const Text(
                'Ver',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                
              ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 150, 62, 231),
                minimumSize: const Size(70, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.0),
                  side: const BorderSide(color: Colors.black)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 



  Widget botonProfe() {
    return Row(children: [
      ElevatedButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UsuarioP()),
                   );
          setState(() {});
        },
        child: const Text(
          'Ver',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 150, 62, 231),
          minimumSize: const Size(70, 50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.0),
              side: const BorderSide(color: Colors.black)
          ),
        ),
      ),
    ]);
  }

  Widget botonAyuda() {
    return Row(children: [
      ElevatedButton(
        onPressed: () {
          // Lógica que se ejecutará cuando se presione el botón "Guardar"
        },
        child: const Text(
          'Ayuda',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          ),
        style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 150, 62, 231),
                minimumSize: const Size(60, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.0),
                  side: const BorderSide(color: Colors.black)
                ),
              ),
            ),
    ]);
  }

}
