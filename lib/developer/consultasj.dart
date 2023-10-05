// ignore_for_file: non_constant_identifier_names, unused_local_variable, unused_impor, avoid_print, unused_import, prefer_const_declarations

import 'package:http/http.dart' as http;

import 'dart:async';

import 'dart:convert';

import 'dart:collection';

import 'dart:io';

Future<List<String>> fetchAllTextsFromDatabase(var codd) async {
  http.Response pre = await http.post(
    Uri.parse('https://incas.site/Speak_Up/examenes.php'),
    body: <String, List>{
      "codd": codd,
    },
  );
  if (pre.statusCode == 200) {
    print(pre);
    var resultado = jsonDecode(pre.body);
    final List<String> responseData = json.decode(pre.body);
    responseData.shuffle(); // Mezclar los textos aleatoriamente
    return responseData;
  } else {
    throw Exception('Failed to load texts from database');
  }
}
