// ignore: file_names
import 'package:flutter/material.dart';
import 'package:ingles/screens/vertarea.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: UseURL(
      cod_act: '',
      cod_p: '',
    ),
  ));
}

class UseURL extends StatefulWidget {
  String cod_act;
  String cod_p;
  UseURL({super.key, required this.cod_act, required this.cod_p});

  @override
  State<UseURL> createState() => _UseURLState();
}

class _UseURLState extends State<UseURL> {
  String a = "";
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondop.jpg'), fit: BoxFit.fill),
        ),
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "USO DE URL/ENLACE DIRECTO",
                textAlign: TextAlign.center,
              ),
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(20)),
                  Text("¿Como obtener una URL/enlace Directo?",style: TextStyle(fontSize: 22,fontStyle:FontStyle.italic),),
                  Padding(padding: EdgeInsets.all(20)),
                  Text("1.Sube la Canción a Google Drive:",style: TextStyle(fontSize: 18,fontStyle:FontStyle.italic)),
                  Padding(padding: EdgeInsets.all(5)),
                  Center(child: Text(style: TextStyle(fontSize: 15),"Sube la canción que deseas reproducir a tu cuenta\nde Google Drive.Puedes hacerlo arrastrando y\nsoltando el archivo en la interfaz web de Google Drive.")),
                  Padding(padding: EdgeInsets.all(10)),
                  Text("2.Comparte el Archivo:",style: TextStyle(fontSize: 18,fontStyle:FontStyle.italic)),
                  Padding(padding: EdgeInsets.all(5)),
                  Center(child: Text(style: TextStyle(fontSize: 15),"Una vez que el archivo esté en tu Google Drive, haz clic\nderecho sobre él y selecciona 'Obtener enlace\ncompartido' o 'Compartir'. Asegúrate de configurar\nel enlace para que cualquier persona con el enlace\npueda acceder al archivo."),),
                  Padding(padding: EdgeInsets.all(10)),
                  Text("3.Obtener el Enlace Directo:",style: TextStyle(fontSize: 18,fontStyle:FontStyle.italic)),
                  Padding(padding: EdgeInsets.all(5)),
                  Center(child:Text(style: TextStyle(fontSize: 15),"Después de compartir el archivo, obtendrás un enlace\ncompartido. Sin embargo, este enlacepuede no\nser directo.Para obtener un enlace directo,\nmodifica la URL reemplazando /view por /uc."),),
                  Padding(padding: EdgeInsets.all(10)),
                  Text("Por Ejemplo:",style: TextStyle(fontSize: 18,fontStyle:FontStyle.italic)),
                  Padding(padding: EdgeInsets.all(10)),
                  Text("Original:",style: TextStyle(fontSize: 18,fontStyle:FontStyle.italic)),
                  Padding(padding: EdgeInsets.all(5)),
                  Text("https://drive.google.com/file/d/ID_DEL_ARCHIVO/view.",style: TextStyle(fontSize: 15)),
                  Padding(padding: EdgeInsets.all(10)),
                  Text("Enlace Directo:",style: TextStyle(fontSize: 18,fontStyle:FontStyle.italic)),
                  Padding(padding: EdgeInsets.all(5)),
                  Text("https://drive.google.com/uc?id=ID_DEL_ARCHIVO",style: TextStyle(fontSize: 15)),
                  Padding(padding: EdgeInsets.all(20)),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerTarea(cod: widget.cod_act, cod_p: widget.cod_p)),
                        );
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.arrow_back),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
                //cuerpo del formulario
                )));
  }
}
