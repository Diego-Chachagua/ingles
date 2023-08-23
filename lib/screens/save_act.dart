// ignore: file_names

import 'package:ingles/screens/show_act.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../developer/consultasf.dart';
import 'elec_op_p.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: SaveAct(
      nombre_act: '',
      cod_act: '',
      cod_p: '',
    ),
  ));
}

class SaveAct extends StatefulWidget {
  String nombre_act;
  String cod_act;
  String cod_p;
  SaveAct(
      {super.key,
      required this.nombre_act,
      required this.cod_act,
      required this.cod_p});

  @override
  State<SaveAct> createState() => _SaveActState();
}

class _SaveActState extends State<SaveAct> {
  String seleccionada = 'Año';
  List anios = ['Año', '1', '2', '3'];
  String seleccionada2 = 'Seccion';
  List seccion = ['Seccion', 'A', 'E', 'K', 'G', 'D', 'O', 'L', 'M', 'N', 'F'];
  String formattedDate = "YYYY-MM-DD";
  var selectDate = DateTime.now();
  var selectTime = TimeOfDay.now();
  //variable de uso de comparacion
  var timenow = TimeOfDay.now();

  void callDataPicker() async {
    var selectedDate = await getDatePickerWidget();
    setState(() {
      if (selectedDate != null) {
        selectDate =
            DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
      }
    });
  }

  void callTimePicker() async {
    var selectTimes = await getDateTime();
    setState(() {
      if (selectTimes != null) {
        selectTime = selectTimes;
      }
    });
  }

  Future<DateTime?> getDatePickerWidget() {
    return showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
      initialEntryMode: DatePickerEntryMode.calendar,
    );
  }

//tiempo
  Future<TimeOfDay?> getDateTime() {
    return showTimePicker(context: context, initialTime: selectTime);
  }

  String a = "";
  @override
  Widget build(BuildContext context) {
    formattedDate = DateFormat('yyyy-MM-dd').format(selectDate);
    String formateTime = selectTime.format(context);
    String nowtime = timenow.format(context);
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondop.jpg'), fit: BoxFit.fill),
        ),
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Column(
              children: [
                Center(
                  child: GradientText(
                    'Do you want to save?',
                    style: const TextStyle(
                      fontSize: 40.0,
                    ),
                    gradientType: GradientType.linear,
                    gradientDirection: GradientDirection.ttb,
                    radius: 2.5,
                    colors: const [
                      Color.fromARGB(255, 170, 63, 233),
                      Color.fromARGB(255, 66, 91, 233),
                      Color.fromARGB(255, 60, 135, 221),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(20)),
                Text(
                  "Nombre de la actividad:",
                  style: TextStyle(fontSize: 15),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  widget.nombre_act,
                  style: TextStyle(fontSize: 20),
                ),
                Padding(padding: EdgeInsets.all(20)),
                Text(
                  'Selecciona año y sección a enviar\nla actividad',
                  style: TextStyle(fontSize: 20),
                ),
                Padding(padding: EdgeInsets.all(20)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 70,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 208, 171, 241),
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(10),
                            dropdownColor: Color.fromARGB(255, 208, 171, 241),
                            value: seleccionada,
                            items: GetOptionsDropDownButton(),
                            onChanged: (value) {
                              setState(() {
                                seleccionada = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 208, 171, 241),
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(10),
                            dropdownColor: Color.fromARGB(255, 208, 171, 241),
                            value: seleccionada2,
                            items: GetOptionsDropDownButton2(),
                            onChanged: (value) {
                              setState(() {
                                seleccionada2 = value.toString();
                                if (seleccionada2 == "A") {
                                  a = "1";
                                } else if (seleccionada2 == "E") {
                                  a = "2";
                                } else if (seleccionada2 == "K") {
                                  a = "3";
                                } else if (seleccionada2 == "G") {
                                  a = "4";
                                } else if (seleccionada2 == "D") {
                                  a = "5";
                                } else if (seleccionada2 == "O") {
                                  a = "6";
                                } else if (seleccionada2 == "L") {
                                  a = "7";
                                } else if (seleccionada2 == "M") {
                                  a = "8";
                                } else if (seleccionada2 == "N") {
                                  a = "9";
                                } else if (seleccionada2 == "F") {
                                  a = "10";
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ]),
                Padding(padding: EdgeInsets.all(20)),
                 Container(
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Seleccione una hora y fecha limite\n                      de entrega',
                        style: TextStyle(fontSize: 20,color: Colors.black38),
                        
                      ),
                       Padding(padding: EdgeInsets.all(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Text('Fecha:',style: TextStyle(color: Colors.black38),),
                          Text(
                            "$formattedDate",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black38,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Text("Hora:",style: TextStyle(color: Colors.black38)),
                          Text("$formateTime",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black38,
                                fontSize: 15),),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SafeArea(
                        child: MaterialButton(
                      onPressed: null,
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 206, 200, 200),
                            border: Border.all(width: 0.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(child: Text('Agregar fecha')),
                      ),
                    )),
                    SafeArea(
                        child: MaterialButton(
                          enableFeedback: false,
                      onPressed: null,
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 206, 200, 200),
                            border: Border.all(width: 0.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(child: Text('Agregar hora')),
                      ),
                    )),
                  ],
                ),
                Text("¡COMING SOON!",style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic),),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(40)),
                MaterialButton(
                  onPressed: () {
                   
                      final snackBar = SnackBar(
                          content: Text("Actividad Guardada con exito"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      insertcodes(seleccionada, a, widget.cod_act);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfeOp(
                                  cod_p: widget.cod_p,
                                )),
                      );
                    
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 191, 143, 236),
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text("Aceptar")),
                  ),
                )
              ],
            )
                //cuerpo del formulario
                )));
  }

  List<DropdownMenuItem<String>> GetOptionsDropDownButton() {
    List<DropdownMenuItem<String>> annios = [];
    anios.forEach((element) {
      annios.add(DropdownMenuItem(
        value: element,
        child: Text(element),
      ));
    });
    return annios;
  }

  List<DropdownMenuItem<String>> GetOptionsDropDownButton2() {
    List<DropdownMenuItem<String>> secciones = [];
    seccion.forEach((element) {
      secciones.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
    return secciones;
  }
}
