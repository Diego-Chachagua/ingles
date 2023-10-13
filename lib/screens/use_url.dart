// ignore: file_names
import 'package:flutter/material.dart';
import 'package:ingles/screens/vertarea.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: UseURL(
    ),
  ));
}

class UseURL extends StatefulWidget {

  UseURL({super.key});

  @override
  State<UseURL> createState() => _UseURLState();
}

class _UseURLState extends State<UseURL> {
  String a = "";
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size; //contenedores
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth < 340? 8.00: screenWidth > 600? 28.00: 18.00; //titulos
    double textSize2 = screenWidth < 340? 10.0 : screenWidth > 600? 25.00: 15.00; //boton de guardado
    double textSize3 = screenWidth < 340? 10.0 : screenWidth > 600? 20.00: 10.00;
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondop.jpg'), fit: BoxFit.fill),
        ),
        child: Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(
                  "USO DE URL/\nENLACE DIRECTO",
                  textAlign: TextAlign.center,
                ),
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
                  Padding(padding: EdgeInsets.all(screenSize.height*0.02)),
                  Text("¿Como obtener una URL/\nenlace Directo?",style: TextStyle(fontSize: 22,fontStyle:FontStyle.italic),),
                  Padding(padding: EdgeInsets.all(screenSize.height*0.02)),
                  Text("1.Sube la Canción a Google Drive:",style: TextStyle(fontSize: 18,fontStyle:FontStyle.italic)),
                  Padding(padding: EdgeInsets.all(screenSize.height*0.005)),
                  Center(child: Text(style: TextStyle(fontSize: 15),"Sube la canción que deseas reproducir a tu\ncuenta de Google Drive.Puedes hacerlo\narrastrando y soltando el archivo en\nla interfaz web de Google Drive.")),
                  Padding(padding: EdgeInsets.all(screenSize.height*0.01)),
                  Text("2.Comparte el Archivo:",style: TextStyle(fontSize: 18,fontStyle:FontStyle.italic)),
                  Padding(padding: EdgeInsets.all(screenSize.height*0.005)),
                  Center(child: Text(style: TextStyle(fontSize: 15),"Una vez que el archivo esté en tu Google\nDrive, haz clic derecho sobre él y\nselecciona 'Obtener enlace compartido'\no 'Compartir'. Asegúrate de configurar\nel enlace para que cualquier persona\ncon el enlace pueda acceder al archivo."),),
                  Padding(padding: EdgeInsets.all(screenSize.height*0.01)),
                  Text("3.Obtener el Enlace Directo:",style: TextStyle(fontSize: 18,fontStyle:FontStyle.italic)),
                  Padding(padding: EdgeInsets.all(screenSize.height*0.005)),
                  Center(child:Text(style: TextStyle(fontSize: 15),"Después de compartir el archivo, obtendrás\nun enlace compartido. Sin embargo,\neste enlacepuede no ser directo.\nPara obtener un enlace directo,\nmodifica la URL reemplazando /view por /uc."),),
                  Padding(padding: EdgeInsets.all(screenSize.height*0.01)),
                  Text("Por Ejemplo:",style: TextStyle(fontSize: 18,fontStyle:FontStyle.italic)),
                  Padding(padding: EdgeInsets.all(screenSize.height*0.01)),
                  Text("Original:",style: TextStyle(fontSize: 18,fontStyle:FontStyle.italic)),
                  Padding(padding: EdgeInsets.all(screenSize.height*0.005)),
                  Text("https://drive.google.com/file/d/\nID_DEL_ARCHIVO/view.",style: TextStyle(fontSize: 15)),
                  Padding(padding: EdgeInsets.all(screenSize.height*0.01)),
                  Text("Enlace Directo:",style: TextStyle(fontSize: 18,fontStyle:FontStyle.italic)),
                  Padding(padding: EdgeInsets.all(screenSize.height*0.005)),
                  Text("https://drive.google.com/uc?id=ID_DEL_ARCHIVO",style: TextStyle(fontSize: 15)),
                  Padding(padding: EdgeInsets.all(screenSize.height*0.03)),
                  
                ],
              ),
            )
                //cuerpo del formulario
                )));
  }
}
