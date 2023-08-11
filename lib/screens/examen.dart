import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Importa el paquete para seleccionar imágenes
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'dart:io';
import '../developer/consultasj.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: Examene(),
  ));
}

class Examene extends StatelessWidget {
  const Examene({super.key});

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
  bool expanded1 = false;
  String textValue1 = '';
  int numberOfAccordions =
      20; // Cambia esto según la cantidad de acordeones que tengas

  final ImagePicker _imagePicker = ImagePicker();
  late List<File?> imageFiles;
  List<String> textsFromDatabase = []; // Inicializar con una lista vacía

  @override
  void initState() {
    super.initState();
    imageFiles = List.generate(numberOfAccordions, (index) => null);
    _loadTexts();
  }

  Future<void> _loadTexts() async {
    try {
      final texts = await fetchAllTextsFromDatabase();
      setState(() {
        textsFromDatabase = texts;
      });
    } catch (e) {
      // Manejar errores aquí
    }
  }

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
          children: [
            const SizedBox(height: 15),
            Center(
              child: GradientText(
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
              ),
            ),
            const SizedBox(height: 30),
            for (int index = 0; index < textsFromDatabase.length; index++)
              Column(
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
                            _pickImage(index);
                          },
                          child: Text('Subir Imagen'),
                        ),
                      ],
                    ),
                    if (imageFiles[index] != null)
                      Image.file(
                        imageFiles[index]!,
                        fit: BoxFit.cover,
                      ),
                  ]),
                ],
              ),
            SizedBox(height: 20),
            boton()
          ],
        ),
      ),
    );
  }

  Widget boton() {
    return ElevatedButton(
      onPressed: () async {},
      child: Text('Enviar'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(
            255, 140, 156, 226)), // Establece el color de fondo del botón
        minimumSize: MaterialStateProperty.all<Size>(
            const Size(100, 45)), // Establece el ancho y alto del botón
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
              fontSize: 26,
              color: Color.fromARGB(
                  255, 12, 7, 167)), // Establece el tamaño y color del texto
        ),
      ),
    );
  }

  Future<void> _pickImage(int index) async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imageFiles[index] = File(pickedImage.path);
      });
    }
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