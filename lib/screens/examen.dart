import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Importa el paquete para seleccionar imágenes
import 'package:flutter_sound/flutter_sound.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'dart:io';

class Examenes extends StatelessWidget {
  const Examenes({super.key});

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
  FlutterSoundRecorder? _audioRecorder; // Objeto para grabar audio
  bool _isRecording = false;


  String textValue1 = '';
  String audioPath1 = '';
  File? imageFile1;

  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _audioRecorder = FlutterSoundRecorder(); // Inicializar el objeto para grabar audio
  }

  @override
  void dispose() {
    _audioRecorder?.closeRecorder(); // Cerrar la sesión de grabación de audio al salir de la pantalla
    super.dispose();
  }

  Future<void> _startRecording() async {
    try {
      await _audioRecorder?.openRecorder();
      await _audioRecorder?.startRecorder(toFile: 'audio_recording.aac', codec: Codec.aacMP4);
      setState(() {
        _isRecording = true;
      });
    } catch (e) {
      // Manejar el error en caso de que la grabación falle
    }
  }

  Future<void> _stopRecording() async {
    try {
      String? audioFilePath = await _audioRecorder?.stopRecorder();
      setState(() {
        _isRecording = false;
        audioPath1 = audioFilePath ?? '';
      });
    } catch (e) {
      // Manejar el error en caso de que detener la grabación falle
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
                onPressed: _isRecording ? _stopRecording : _startRecording,
                child: Text(_isRecording ? 'Detener Grabación' : 'Grabar Audio'),
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
