import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Importa el paquete para seleccionar imágenes
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'dart:io';
import '../developer/consultasj.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: Examene(
      codp: '',
    ),
  ));
}

class Examene extends StatelessWidget {
  final String codp;
  const Examene({
    super.key,
    required this.codp,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: examen(codp: '',),
    );
  }
}

class examen extends StatefulWidget {
  final String codp;

  const examen({super.key, required this.codp});

  @override
  _examenState createState() => _examenState();
}

class _examenState extends State<examen> {
  bool expanded1 = false;
  String textValue1 = '';
  String codd = "";
  int numberOfAccordions =
      20; // Cambia esto según la cantidad de acordeones que tengas

  final ImagePicker _imagePicker = ImagePicker();
  late List<File?> imageFiles;
  List<String> pregunta = []; // Inicializar con una lista vacía
  List<String> codi = [];
  List<bool> expandedStates = []; // Lista de estados de expansión
  var result;
  var dato;

  @override
  void initState() {
    super.initState();
    codd = widget.codp;
    print(codd);
    imageFiles = List.generate(pregunta as int, (index) => null);
    expandedStates = List.generate(pregunta as int, (index) => false);
    (() async {
      result = await fetchAllTextsFromDatabase(codd);
      if (result != null) {
        for (var dato in result) {
          print(dato);
          var preguntas = dato['pregunta'];
          var cod = dato['cod_pr'];

          setState(() {
            pregunta.add(preguntas);
            codi.add(cod);
          });
        }
      } else {
        print('no se encontraron las preguntas');
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
            for (var i = 0; i < pregunta.length; i++)
              Column(
                children: [
                  _buildAccordion(i, pregunta[i], expandedStates[i], [
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
                            _pickImage(i);
                          },
                          child: Text('Subir Imagen'),
                        ),
                      ],
                    ),
                    if (imageFiles[i] != null)
                      Image.file(
                        imageFiles[i]!,
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
          // Cambia el estado de expansión del acordeón actual
          expandedStates[index] = !expandedStates[index];
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.all(8.0),
        child: Card(
          color: expandedStates[index]
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
