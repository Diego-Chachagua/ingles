// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:ingles/developer/consultase.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: Registro_Profe(),
  ));
}
String nombre = "";
String apellido = ""; 
TextEditingController _controller = TextEditingController();
TextEditingController _controller2 = TextEditingController();
class Registro_Profe extends StatelessWidget{
  const Registro_Profe({super.key});

  @override
  Widget build (BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/lila.jpg'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          title: Center(
            child: GradientText(
              'Registro Profesor',
              style: const TextStyle(
                fontSize: 40.0,
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
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Alineación del campo de entrada a la izquierda
    children: [
      SizedBox(height: 60),
      Padding(
        padding: const EdgeInsets.all(10.0),
       child: TextField(
          textCapitalization: TextCapitalization.sentences,
          controller: _controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            fillColor: Color.fromARGB(0, 238, 238, 238),
            filled: true,
            hintText: 'Nombre del Docente',
            hintStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,

            )

          )
       )
       
    ),
      SizedBox(height: 30),
      Padding(
        padding: const EdgeInsets.all(10.0),
       child: TextField(
          textCapitalization: TextCapitalization.sentences,
          controller: _controller2,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            fillColor: Color.fromARGB(0, 238, 238, 238),
            filled: true,
            hintText: 'Apellido del docente',
            hintStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )
          )
       )
      ),

    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(height: 120),
      ElevatedButton(
        onPressed: () async {
          // Lógica que se ejecutará cuando se presione el botón "Eliminar"
          nombre = _controller.text;
          _controller.text = "";
          apellido = _controller2.text;
          _controller2.text = "";
          print(nombre);
          print(apellido);
          guardarprofesor(nombre, apellido);
        
          
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
  ),

    ]
      )

    )
    
    );
    
        
        
    
      
    

}
}
