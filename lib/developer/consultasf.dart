import 'package:http/http.dart' as http;
//Libreria que nos permitira usar funciones async
import 'dart:async';
//Libreria que nos permitira decodificar los archivos JSON
import 'dart:convert';
//Libreria que nos permitira usar Colecciones (array y MAP)
import 'dart:collection';

import 'dart:io';

Future<dynamic> agregarAskActivity(var pregunta) async{
  print(pregunta);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_ask_act.php'),
    body: <String, dynamic>{
      "ask": pregunta,
      
      
    },
    );
}

Future<void> agregarImg(var pregunta, File? imagen) async {
  print(pregunta);

  if (imagen == null) {
    print("No image selected");
    return;
  }

  List<int> imageBytes = await imagen.readAsBytes();
  String base64Image = base64Encode(imageBytes);

  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_ask_img.php'),
    body: <String, String>{
      "ask": pregunta,
      "img": base64Image,
    },
  );

  // Handle the response here if needed
}



Future<dynamic> mostrarAct() async{
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_ask_act.php'),
    body: <String, dynamic>{

    },
  );
  var resultado = jsonDecode(enviar.body);
  

    return resultado;
  
}

Future<dynamic> editAsk(var pregunta) async{
  print(pregunta);
  
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/edit_ask_act.php'),
    body: <String, dynamic>{
      "ask": pregunta,
      
      
    },
    );
}
