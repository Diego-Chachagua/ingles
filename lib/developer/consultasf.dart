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
  try{
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_ask_act.php'),
    body: <String, dynamic>{
      "cod": cod,
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
  }catch(e){
  return "Error";
  }
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
//crear nueva actividad
Future<dynamic> addTask(var name,var cod_p, var anio,var hora) async {
  print(name);
  var date=anio+" "+hora;
  print(cod_p);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_Task.php'),
    body: <String, dynamic>{
      "name": name,
      "cod_p":cod_p,
      "date":date,
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
try{
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/change_name_act.php'),
    body: <String, dynamic>{
      "name": nombre,
      "cod": cod,
    },
  );
  return enviar.body;
}catch(e){
  return "Error";
}
}
//guardar año y seccion
Future<dynamic> insertcodes(var grado, var seccion,var cod, var hora, var anio) async {
  print(grado);
  print(seccion);
  var date = anio+" "+hora;
  print(cod);
  print(date);

  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_dates_activity.php'),
    body: <String, dynamic>{
      "grado": grado,
      "secc": seccion,
      "cod": cod,
      "date":date,
    },
  );
  return enviar.body;
}

//extraer actividades
Future<dynamic> showActivitys(var cod) async {
  print(cod);
  try{
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_name_act.php'),
    body: <String, dynamic>{
      "cod": cod,
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
  }catch(e){
    return "Error";
  }
}

//eliminar pregunta
Future<dynamic> deleteAsk(var cod,cod_a) async {
  
  print(cod);
  print(cod_a);
  try{
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/delete_ask.php'),
    body: <String, dynamic>{
      "cod":cod,
      "cod_a":cod_a,
    },
  );
  return enviar.body;
  }catch(e){
    return  "Error";
  }
}

//mostrar resultados segun filtros
Future<dynamic> showActivitysgrade(var cod,var grade) async {
  print(cod);
  print(grade);
  try{
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
  }catch(e){
    return "Error";
  }
}

Future<dynamic> showActivityssection(var cod,var section) async {
  print(cod);
  print(section);
  try{
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
  }catch(e){
    return "Error";
  }
}
Future<dynamic> showActivitysSG(var cod,var section,var grade) async {
  print(cod);
  print(section);
  print(grade);
  try{
    
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
  }catch(e){
    return "Error";
  }
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


//añadir juegito
Future<dynamic> upGame(var cod_a,var request, var ask) async {
  print(cod_a);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_game.php'),
    body: <String, dynamic>{
      "cod":cod_a,
      "request":request,
      "ask":ask,
    },
  );
  return enviar.body;
}
Future<dynamic> editRespuesta(var cod_a,var cod_p, var request) async {
  
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/edit_respuesta_game.php'),
    body: <String, dynamic>{
      "cod_a":cod_a,
      "request":request,
      "cod_p":cod_p,
    },
  );
  return enviar.body;
}




//inicio de consultas para la pantalla examenes

Future<dynamic> addExam(var name,var cod_p, var anio, var hora) async {
  print(name);
  print(cod_p);
  var date = anio+" "+hora;
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_Exam.php'),
    body: <String, dynamic>{
      "name": name,
      "cod_p":cod_p,
      "date":date
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
}

Future<dynamic> mostrarExam(var cod) async {
  print(cod);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_exam.php'),
    body: <String, dynamic>{
      "cod": cod,
    },
  );
  var resultado = jsonDecode(enviar.body);


  return resultado;
}

Future<dynamic> editnameE(var nombre, var cod) async {
  print(nombre);
  print(cod);

  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/change_name_E.php'),
    body: <String, dynamic>{
      "name": nombre,
      "cod": cod,
    },
  );
  return enviar.body;
}

Future<dynamic> deleteAskE(var cod,cod_a) async {
  
  print(cod);
  print(cod_a);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/delete_askE.php'),
    body: <String, dynamic>{
      "cod":cod,
      "cod_a":cod_a,
    },
  );
  return enviar.body;
}

Future<dynamic> agregarAskExam(var pregunta, var cod) async {
  print(pregunta);
  print(cod);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_ask_E.php'),
    body: <String, dynamic>{
      "ask": pregunta,
      "cod": cod,
    },
  );
}

Future<void> agregarImgEx(var pregunta, File? imagen, var cod) async {
  print(pregunta);
  print(cod);
  if (imagen == null) {
    print("No image selected");
    return;
  }
  List<int> imageBytes = await imagen.readAsBytes();
  String base64Image = base64Encode(imageBytes);

  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_askImg_E.php'),
    body: <String, String>{
      "ask": pregunta,
      "img": base64Image,
      "cod": cod,
    },
  );

  // Handle the response here if needed
}

Future<void> addImgEx(var cod_p, File? imagen, var cod) async {
  print(cod_p);
  print(cod);
  if (imagen == null) {
    print("No image selected");
    return;
  }
  List<int> imageBytes = await imagen.readAsBytes();
  String base64Image = base64Encode(imageBytes);

  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_img_E.php'),
    body: <String, String>{
      "cod_p": cod_p,
      "img": base64Image,
      "cod": cod,
    },
  );
}

Future<dynamic> upSound_E(var cod_a,var sound, var ask) async {
  print(cod_a);
  if(sound==null){
    print("no se imprime adui");
  }
  print(sound);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_sound_E.php'),
    body: <String, dynamic>{
      "cod":cod_a,
      "sound":sound,
      "ask":ask,
    },
  );
  return enviar.body;
}

Future<dynamic> editAskE(var pregunta, var cod) async {
  print(pregunta);
  print(cod);

  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/edit_ask_E.php'),
    body: <String, dynamic>{
      "ask": pregunta,
      "cod": cod,
    },
  );
  return enviar.body;
}

Future<dynamic> insertcodesE(var grado, var seccion,var cod) async {
  print(grado);
  print(seccion);
  print(cod);

  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_dates_Exam.php'),
    body: <String, dynamic>{
      "grado": grado,
      "secc": seccion,
      "cod": cod,
    },
  );
  return enviar.body;
}

Future<dynamic> showExam(var cod) async {
  print(cod);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_name_E.php'),
    body: <String, dynamic>{
      "cod": cod,
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
}
Future<dynamic> showExamgrade(var cod,var grade) async {
  print(cod);
  print(grade);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_examgrade.php'),
    body: <String, dynamic>{
      "cod": cod,
      "grade":grade,
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
}

Future<dynamic> showExamsection(var cod,var section) async {
  print(cod);
  print(section);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_examsection.php'),
    body: <String, dynamic>{
      "cod": cod,
      "section":section,
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
}
Future<dynamic> showExamsSG(var cod,var section,var grade) async {
  print(cod);
  print(section);
  print(grade);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_examSG.php'),
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


//consultas para la calificacion de actividades

//mostrar alumnos segun año seccion
Future<dynamic> shownieAlum(var anio, var seccion) async {
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_alum_act.php'),
    body: <String, dynamic>{
      "anio": anio,
      "seccion":seccion,
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
}

//mostrar actividades del alumno
Future<dynamic> showactAlum(var nie) async {
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_activitys_A.php'),
    body: <String, dynamic>{
      "nie": nie,
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
}


//mostrar preguntas y respuestas de actividades
Future<dynamic> showAskAlum(var cod_act, var nie) async {
  print(cod_act);
  print(nie);
  //mostrar las preguntas
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_preguntasR_alum.php'),
    body: <String, dynamic>{
      "cod_act": cod_act,
      "nie":nie,
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
}


//borrar examen
Future<dynamic> deleteExam(var cod_a,var cod_p) async {
  print(cod_a);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/DeleteExam.php'),
    body: <String, dynamic>{
      "cod":cod_a,
      "cod_a":cod_p,
    },
  );
  return enviar.body;
}
//añadir nota a respuesta
Future<dynamic> addNotas(var nota, var cod_r, var cod_a , var nie) async {
  print(cod_a);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_nota_Res.php'),
    body: <String, dynamic>{
      "cod_a":cod_a,
      "nota":nota,
      "nie":nie,
      "cod_r":cod_r,
    },
  );
  return enviar.body;
}


//comprobar actividades
Future<dynamic> comprobarAct(var cod_a) async {
  print(cod_a);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/comprobate_asksofTask.php'),
    body: <String, dynamic>{
      "cod_act":cod_a,
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
}

//ver las actividades de un alumno
Future<dynamic> showExamAlum(var nie) async {
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_exams_A.php'),
    body: <String, dynamic>{
      "nie": nie,
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
}

//mostrar preguntas  y respuestas de examen
Future<dynamic> showAskExamAlum(var cod_pr, var nie) async {
  //mostrar las preguntas
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/show_preguntasR_exam.php'),
    body: <String, dynamic>{
      "cod_pr": cod_pr,
      "nie":nie,
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
}

Future<dynamic> comprobarExam(var cod_a) async {
  print(cod_a);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/comprobrar_askOf_Exams.php'),
    body: <String, dynamic>{
      "cod_act":cod_a,
    },
  );
  var resultado = jsonDecode(enviar.body);
  print(resultado);
  return resultado;
}

Future<dynamic> addrequestGame(var cod, var respuesta) async {
  print(cod);
  print(respuesta);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_request_game.php'),
    body: <String, dynamic>{
      "cod":cod,
      "request":respuesta,
    },
  );
  return enviar.body;
}

Future<dynamic> addrequestAsk(var cod, var respuesta, var nie) async {
  print(cod);
  print(respuesta);
  print(nie);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_dates_reques.php'),
    body: <String, dynamic>{
      "cod":cod,
      "request":respuesta,
      "nie":nie,
    },
  );
  return enviar.body;
}

Future<dynamic> addrequestImagen(var cod, var respuesta, var nie) async {

  print(cod);
  List<int> imageBytes = await respuesta.readAsBytes();
  String base64Image = base64Encode(imageBytes);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_dates_resquest_img.php'),
    body: <String, dynamic>{
      "cod":cod,
      "request":base64Image,
      "nie":nie,
    },
  );
  return enviar.body;
}

Future<dynamic> addrequestsound(var cod, var respuesta, var nie) async {
  print(cod);
  print(respuesta);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_dates_request_sound.php'),
    body: <String, dynamic>{
      "cod":cod,
      "request":respuesta,
      "nie":nie,
    },
  );
  return enviar.body;
}
Future<dynamic> changeState(var cod, var estado, var nie) async {
  print(cod);
  print(estado);
  print(nie);

  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/changeState.php'),
    body: <String, dynamic>{
      "cod":cod,
      "estado":estado,
      "nie":nie,
    },
  );
  return enviar.body;
}

Future<dynamic> changeStateExam(var cod, var estado, var nie) async {
  print(cod);
  print(estado);
  print(nie);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/changeStateExam.php'),
    body: <String, dynamic>{
      "cod":cod,
      "estado":estado,
      "nie":nie,
    },
  );
  return enviar.body;
}

//responder examen
Future<dynamic> addrequestAskExam(var cod, var respuesta, var nie) async {
  print(cod);
  print(respuesta);
  print(nie);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/add_dates_reques.php'),
    body: <String, dynamic>{
      "cod":cod,
      "request":respuesta,
      "nie":nie,
    },
  );
  return enviar.body;
}
Future<dynamic> addDateAct(var cod, var anio, var hora, var nie) async {
  print(cod);
 var date = anio+" "+hora;
  print(nie);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/addDateAct.php'),
    body: <String, dynamic>{
      "cod":cod,
      "date":date,
      "nie":nie,
    },
  );
  return enviar.body;
}

Future<dynamic> addDateExam(var cod, var anio, var hora, var nie) async {
  print(cod);
 var date = anio+" "+hora;
  print(nie);
  http.Response enviar = await http.post(
    Uri.parse('https://incasingles.000webhostapp.com/addDateExam.php'),
    body: <String, dynamic>{
      "cod":cod,
      "date":date,
      "nie":nie,
    },
  );
  return enviar.body;
}