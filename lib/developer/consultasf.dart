import 'package:http/http.dart' as http;
//Libreria que nos permitira usar funciones async
import 'dart:async';
//Libreria que nos permitira decodificar los archivos JSON
import 'dart:convert';
//Libreria que nos permitira usar Colecciones (array y MAP)
import 'dart:collection';

import 'dart:io';

Future<dynamic> agregarAskActivity(var pregunta, var cod) async{
  print(pregunta);
  print(cod);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_ask_act.php'),
    body: <String, dynamic>{
      "ask": pregunta,
      "cod":cod,
      
      
    },
    );
}

Future<void> agregarImg(var pregunta, File? imagen,var cod) async {
  print(pregunta);
  print(cod);
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
      "cod":cod,
    },
  );

  // Handle the response here if needed
}



Future<dynamic> mostrarAct(var cod) async{
  print(cod);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_ask_act.php'),
    body: <String, dynamic>{
      "cod":cod,

    },
  );
  var resultado = jsonDecode(enviar.body);
  
print(resultado);
    return resultado;
  
}

Future<dynamic> editAsk(var pregunta,var cod) async{
  print(pregunta);
  print(cod);
  
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/edit_ask_act.php'),
    body: <String, dynamic>{
      "ask": pregunta,
      "cod":cod,   
    },
    );
    return enviar.body;
}
//actualizar imagen
Future<void> updateImg(var cod,var pregunta, File? imagen) async {
  print(pregunta);
  print(cod);
;

  if (imagen == null) {
    print("No image selected");
    return;
  }

  List<int> imageBytes = await imagen.readAsBytes();
  String base64Image = base64Encode(imageBytes);

  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/update_ask_img.php'),
    body: <String, String>{
      "cod":cod,
      "ask": pregunta,
      "img": base64Image,
    },
  );

  // Handle the response here if needed
}

//crear nueva actividad
Future<dynamic> addTask(var name) async{
  print(name);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_Task.php'),
    body: <String, dynamic>{  
      "name":name,
    },
  
    );
    var resultado = jsonDecode(enviar.body);
   print(resultado);
   return resultado;
    
}
//extraer codigo de actividad


Future<dynamic> editname(var nombre,var cod) async{
  print(nombre);
  print(cod);
  
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/change_name_act.php'),
    body: <String, dynamic>{
      "name": nombre,
      "cod":cod,
    
      
      
    },

    );
    return enviar.body;
}



Future<dynamic> insertcodes(var grado,var seccion) async{
  print(grado);
  print(seccion);
  
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/change_name_act.php'),
    body: <String, dynamic>{
      "grado": grado,
      "secc":seccion,
    },

    );
    return enviar.body;
}
Future<dynamic> showActs(var cod) async{
  print(cod);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_name_act.php'),
    body: <String, dynamic>{
      "cod":cod,

    },
  );
  var resultado = jsonDecode(enviar.body);
  
print(resultado);
    return resultado;
  

}
