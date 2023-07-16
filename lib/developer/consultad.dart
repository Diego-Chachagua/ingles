// ignore_for_file: non_constant_identifier_names, unused_local_variable, unused_impor, avoid_print, unused_import

import 'package:http/http.dart' as http;
//Libreria que nos permitira usar funciones async
import 'dart:async';
//Libreria que nos permitira decodificar los archivos JSON
import 'dart:convert';
//Libreria que nos permitira usar Colecciones (array y MAP)
import 'dart:collection';

import 'dart:io';

Future<dynamic> eliminarUsu(var usu ,String usu2) async{
  print(usu);
  print(usu2);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/eliminar.php'),
    body: <String, dynamic>{
      "usu": usu,
      "usu2": usu2,
    },
    );
}