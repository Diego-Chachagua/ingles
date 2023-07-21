import 'package:http/http.dart' as http;

import 'dart:async';
//Libreria que nos permitira decodificar los archivos JSON
import 'dart:convert';
//Libreria que nos permitira usar Colecciones (array y MAP)
// ignore: unused_import
import 'dart:collection';

// ignore: unused_import
import 'dart:io';

Future<dynamic> comprobara(String usuariobd, String contrabd) async{
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/forma.php'),
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

Future<dynamic> comprobare(String usuariobd, String contrabd) async{
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/forme.php'),
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

Future<dynamic> comprobarp(String usuariobd, String contrabd) async{
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/formp.php'),
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

Future<dynamic> consultarup() async{
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/consultarup.php'),
    body: <String, dynamic>{

    },
  );
  var resultado = jsonDecode(enviar.body);
   if (enviar.statusCode == 201) {
    return "error";
  } else {

    return resultado;
  }
}

Future<dynamic> enviarusu(String seccione2,String gradoe2) async{
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/usuycontra.php'),
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

Future<dynamic> anosec(String usuario,String contra) async{
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/grasecc.php'),
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
}