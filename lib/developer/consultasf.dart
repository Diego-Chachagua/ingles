import 'package:http/http.dart' as http;
//Libreria que nos permitira usar funciones async
import 'dart:async';
//Libreria que nos permitira decodificar los archivos JSON
import 'dart:convert';
//Libreria que nos permitira usar Colecciones (array y MAP)
import 'dart:collection';

import 'dart:io';

Future<dynamic> agregarAskActivity(var pregunta, var cod) async {
  print(pregunta);
  print(cod);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_ask_act.php'),
    body: <String, dynamic>{
      "ask": pregunta,
      "cod": cod,
    },
  );
}

Future<void> agregarImg(var pregunta, File? imagen, var cod) async {
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
      "cod": cod,
    },
  );

  // Handle the response here if needed
}

Future<dynamic> mostrarAct(var cod) async {
  print(cod);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_ask_act.php'),
    body: <String, dynamic>{
      "cod": cod,
    },
  );
  var resultado = jsonDecode(enviar.body);


  return resultado;
}

Future<dynamic> editAsk(var pregunta, var cod) async {
  print(pregunta);
  print(cod);

  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/edit_ask_act.php'),
    body: <String, dynamic>{
      "ask": pregunta,
      "cod": cod,
    },
  );
  return enviar.body;
}

//actualizar imagen


//crear nueva actividad
Future<dynamic> addTask(var name,var cod_p) async {
  print(name);
  print(cod_p);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_Task.php'),
    body: <String, dynamic>{
      "name": name,
      "cod_p":cod_p,
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
}
//extraer codigo de actividad

Future<dynamic> editname(var nombre, var cod) async {
  print(nombre);
  print(cod);

  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/change_name_act.php'),
    body: <String, dynamic>{
      "name": nombre,
      "cod": cod,
    },
  );
  return enviar.body;
}
//guardar año y seccion
Future<dynamic> insertcodes(var grado, var seccion,var anio, var tiempo,var cod) async {
  print(grado);
  print(seccion);
  var date = anio+" "+tiempo;
  print(date);
  print(cod);

  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_dates_activity.php'),
    body: <String, dynamic>{
      "grado": grado,
      "secc": seccion,
      "date": date,
      "cod": cod,
    },
  );
  return enviar.body;
}

//extraer actividades
Future<dynamic> showActivitys(var cod) async {
  print(cod);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_name_act.php'),
    body: <String, dynamic>{
      "cod": cod,
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
}

//eliminar pregunta
Future<dynamic> deleteAsk(var cod,cod_a) async {
  
  print(cod);
  print(cod_a);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/delete_ask.php'),
    body: <String, dynamic>{
      "cod":cod,
      "cod_a":cod_a,
    },
  );
  return enviar.body;
}

//mostrar resultados segun filtros
Future<dynamic> showActivitysgrade(var cod,var grade) async {
  print(cod);
  print(grade);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_activitygrade.php'),
    body: <String, dynamic>{
      "cod": cod,
      "grade":grade,
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
}

Future<dynamic> showActivityssection(var cod,var section) async {
  print(cod);
  print(section);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_activitysection.php'),
    body: <String, dynamic>{
      "cod": cod,
      "section":section,
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
}
Future<dynamic> showActivitysSG(var cod,var section,var grade) async {
  print(cod);
  print(section);
  print(grade);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_activitySG.php'),
    body: <String, dynamic>{
      "cod": cod,
      "section":section,
      "grade":grade,
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
}

//borrar actividades
Future<dynamic> deleteTask(var cod_a,var cod_p) async {
  print(cod_a);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/deleteTask.php'),
    body: <String, dynamic>{
      "cod":cod_a,
      "cod_a":cod_p,
    },
  );
  return enviar.body;
}
//agregar imagen a pregunta

Future<void> addImg(var cod_p, File? imagen, var cod) async {
  print(cod_p);
  print(cod);
  if (imagen == null) {
    print("No image selected");
    return;
  }
  List<int> imageBytes = await imagen.readAsBytes();
  String base64Image = base64Encode(imageBytes);

  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_imagen.php'),
    body: <String, String>{
      "cod_p": cod_p,
      "img": base64Image,
      "cod": cod,
    },
  );
}

//subir un archivo de sonido
Future<dynamic> upSound(var cod_a,var sound, var ask) async {
  print(cod_a);
  if(sound==null){
    print("no se imprime adui");
  }
  print(sound);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_sound.php'),
    body: <String, dynamic>{
      "cod":cod_a,
      "sound":sound,
      "ask":ask,
    },
  );
  return enviar.body;
}

