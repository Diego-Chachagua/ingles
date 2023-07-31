import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Importa el paquete para seleccionar imágenes
import 'dart:io';

import 'package:simple_gradient_text/simple_gradient_text.dart';

class Unidades extends StatelessWidget {
  const Unidades({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: examen(),
    );
  }
}

class examen extends StatefulWidget {
  @override
  _examenState createState() => _examenState();
}

class _examenState extends State<examen> {
  final TextEditingController pregunta1 = TextEditingController();
  final TextEditingController respuesta1 = TextEditingController();
  bool expanded1 = false;
  bool expanded2 = false;
  bool expanded3 = false;
  bool expanded4 = false;

  String textValue1 = '';
  String audioPath1 = '';
  File? imageFile1;

  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fondop.jpg'), fit: BoxFit.cover),
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
          const SizedBox(height: 15),
          titulo2(),
          SizedBox(height: 30),
          acordeon()
        ],
      ),
    );
  }

  Widget titulo2() {
    return GradientText(
      'EXAMEN',
      style: const TextStyle(
        fontSize: 36.0,
      ),
      gradientType: GradientType.linear,
      gradientDirection: GradientDirection.ttb,
      radius: 2.5,
      colors: const [
        Color.fromARGB(255, 170, 63, 233),
        Color.fromARGB(255, 66, 91, 233),
        Color.fromARGB(255, 60, 135, 221),
      ],
    );
  }

  Widget acordeon() {
    return Column(
      children: [
        _buildAccordion(1, '', expanded1, [
          TextField(
            onChanged: (value) {
              setState(() {
                textValue1 = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Escribe la respuesta...',
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // Lógica para grabar audio
                  // Puedes usar un paquete de grabación de audio o implementar tu propia lógica
                  // y actualizar el estado de 'audioPath1' con la ruta del archivo de audio grabado.
                },
                child: Text('Grabar Audio'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final image =
                      await _imagePicker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      imageFile1 = File(image.path);
                    });
                  }
                },
                child: Text('Subir Imagen'),
              ),
            ],
          ),
          if (audioPath1.isNotEmpty) Text('Audio grabado 1: $audioPath1'),
          if (imageFile1 != null)
            AspectRatio(
              aspectRatio: 16 /
                  20, // Ajusta la relación de aspecto según tus necesidades
              child: Image.file(
                imageFile1!,
                fit: BoxFit.cover,
              ),
            ),
        ]),
      ],
    );
  }

  Widget _buildAccordion(
      int index, String title, bool expanded, List<Widget> content) {
    return GestureDetector(
      onTap: () {
        setState(() {
          switch (index) {
            case 1:
              expanded1 = !expanded1;
              break;
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.all(8.0),
        child: Card(
          color: expanded
              ? Color.fromARGB(255, 235, 234, 237)
              : Color.fromARGB(255, 129, 129, 233),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: expanded
                            ? Color.fromARGB(255, 242, 238, 238)
                            : Color.fromARGB(255, 9, 9, 9),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      expanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
              if (expanded)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: content,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
