// ignore_for_file: non_constant_identifier_names, unused_local_variable, unused_impor, avoid_print, unused_import, prefer_const_declarations

import 'package:http/http.dart' as http;

import 'dart:async';

import 'dart:convert';

import 'dart:collection';

import 'dart:io';


Future<dynamic> eliminarUsu(var usu ,String usu2) async{
  print(usu);
  print(usu2);
  http.Response enviar = await http.post(
    Uri.parse('https://incas.site/Speak_Up/eliminar.php'),
    body: <String, dynamic>{
      "usu": usu,
      "usu2": usu2,
    },
    );
}

Future<dynamic> registro(String nnie, String nom, String apell, String g, dynamic grado, dynamic seccionb, String usu, String contra) async {
  http.Response enviar = await http.post(
    Uri.parse('https://incas.site/Speak_Up/registro.php'),
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
    Uri.parse('https://incas.site/Speak_Up/historialES.php'),
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

Future<dynamic> historialestu2(String usuariobd ,String contrabd) async{
  http.Response enviar = await http.post(
    Uri.parse('https://incas.site/Speak_Up/historialact.php'),
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

