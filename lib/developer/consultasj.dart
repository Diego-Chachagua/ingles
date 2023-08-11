// ignore_for_file: non_constant_identifier_names, unused_local_variable, unused_impor, avoid_print, unused_import, prefer_const_declarations

import 'package:http/http.dart' as http;

import 'dart:async';

import 'dart:convert';

import 'dart:collection';

import 'dart:io';

Future<List<String>> fetchAllTextsFromDatabase() async {
  final response = await http
      .get(Uri.parse('https://incasingles.000webhostapp.com/examenes.php'));
  if (response.statusCode == 200) {
    final List<dynamic> responseData = json.decode(response.body);
    final List<String> texts = List<String>.from(responseData);
    texts.shuffle(); // Mezclar los textos aleatoriamente
    return texts;
  } else {
    throw Exception('Failed to load texts from database');
  }
}