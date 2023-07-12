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