import 'package:http/http.dart' as http;

import 'dart:async';
//Libreria que nos permitira decodificar los archivos JSON
import 'dart:convert';
//Libreria que nos permitira usar Colecciones (array y MAP)
// ignore: unused_import
import 'dart:collection';

// ignore: unused_import
import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<dynamic> comprobara(String usuariobd, String contrabd) async {
  http.Response enviar = await http.post(
    Uri.parse('https://incas.site/Speak_Up/forma.php'),
    body: <String, dynamic>{
      "usuario": usuariobd,
      "contra": contrabd,
    },
  );
  if (enviar.statusCode == 201) {
    return "error";
  } else {
    return enviar.body;
  }
}

Future<dynamic> comprobare(String usuariobd, String contrabd) async {
  http.Response enviar = await http.post(
    Uri.parse('https://incas.site/Speak_Up/forme.php'),
    body: <String, dynamic>{
      "usuario": usuariobd,
      "contra": contrabd,
    },
  );
  if (enviar.statusCode == 201) {
    return "error";
  } else {
    return enviar.body;
  }
}

Future<dynamic> comprobarp(String usuariobd, String contrabd) async {
  try{
  http.Response enviar = await http.post(
    Uri.parse('https://incas.site/Speak_Up/formp.php'),
    body: <String, dynamic>{
      "usuario": usuariobd,
      "contra": contrabd,
    },
  );
    var resultado = jsonDecode(enviar.body);
    print(resultado);
    return resultado;
  }catch(e){
    print(e);
    return "Error";
  }
}

Future<dynamic> consultarup() async {
  http.Response enviar = await http.post(
    Uri.parse('https://incas.site/Speak_Up/consultarup.php'),
    body: <String, dynamic>{},
  );
  var resultado = jsonDecode(enviar.body);
  if (enviar.statusCode == 201) {
    return "error";
  } else {
    return resultado;
  }
}

Future<dynamic> enviarusu(String seccione2, String gradoe2) async {
  http.Response enviar = await http.post(
    Uri.parse('https://incas.site/Speak_Up/usuycontra.php'),
    body: <String, dynamic>{
      "seccion": seccione2,
      "grado": gradoe2,
    },
  );
  var resultado = jsonDecode(enviar.body);
  if (enviar.statusCode == 201) {
    return "error";
  } else {
    return resultado;
  }
}

Future<dynamic> anosec(String usuario, String contra) async {
  try{
  http.Response enviar = await http.post(
    Uri.parse('https://incas.site/Speak_Up/grasecc.php'),
    body: <String, dynamic>{
      "usu": usuario,
      "contra": contra,
    },
  );
  var resultado = jsonDecode(enviar.body);
  if (enviar.statusCode == 201) {
    return "error";
  } else {
    return resultado;
  }
  }catch(e){
    return "Error";
  }
}

Future<dynamic> tareasd(var nie) async {
  print(nie);
  try{
  http.Response enviar = await http.post(
    Uri.parse('https://incas.site/Speak_Up/tareas.php'),
    body: <String, dynamic>{
      "nie":nie,
    },
  );
  var resultado = jsonDecode(enviar.body);
  if (enviar.statusCode == 201) {
    return "error";
  } else {
    return resultado;
  }
  }catch(e){
    return "Error";
  }
}

Future<dynamic> comprobartarea(var nombret, var nie) async {
  try{
    Future.delayed(Duration(seconds: 120));
  http.Response enviar = await http.post(
    Uri.parse('https://incas.site/Speak_Up/comprobart.php'),
    body: <String, dynamic>{
      "tarea": nombret,
      "nie": nie,
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
  }catch(e){
    return "Error";
  }
}

Future<dynamic> examenes(String grado, String seccion) async {
  try{
  http.Response enviar = await http.post(
    Uri.parse('https://incas.site/Speak_Up/examen.php'),
    body: <String, dynamic>{
      "grado": grado,
      "seccion": seccion,
    },
  );
  var resultado = jsonDecode(enviar.body);
  if (enviar.statusCode == 201) {
    return "error";
  } else {
    return resultado;
  }
  }catch(e){
    return "Error";
  }
}

Future<dynamic> comprobarexamen(String nombret, String nie) async {
  http.Response enviar = await http.post(
    Uri.parse('https://incas.site/Speak_Up/comprobare.php'),
    body: <String, dynamic>{
      "tarea": nombret,
      "nie": nie,
    },
  );
     var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
  
}
