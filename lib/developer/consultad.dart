// ignore_for_file: non_constant_identifier_names, unused_local_variable, unused_impor, avoid_print, unused_import, prefer_const_declarations

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

Future<dynamic> registro(String nnie, String nom, String apell, String g, dynamic grado, dynamic seccionb, String usu, String contra) async {
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/registro.php'),
    body: <String, dynamic>{
      "nnie": nnie,
      "nom": nom,
      "apell": apell,
      "g": g,
      "grado": grado,
      "seccionb": seccionb,
      "usu": usu,
      "contra": contra,
    },
  );
  print(enviar.body);
}

Future<dynamic> historialestu(String usuariobd ,String contrabd) async{
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/historialES.php'),
    body: <String, dynamic>{
      "usu": usuariobd,
      "contra": contrabd,
    },
    );
    print(enviar.body);
    var resultado = jsonDecode(enviar.body);
      if (enviar.statusCode == 201) {
      return "error";
    } else {
      return resultado;
    }
}

