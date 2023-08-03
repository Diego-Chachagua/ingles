// ignore: file_names
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: SaveAct(),
  ));
}

class SaveAct extends StatefulWidget {
  const SaveAct({super.key});

  @override
  State<SaveAct> createState() => _SaveActState();
}

class _SaveActState extends State<SaveAct> {
  String _seleccionada = 'Año';
  List anios = ['Año', '1', '2'];
  String _seleccionada2 = 'Seccion';
  List seccion = ['Seccion', 'A', 'F', 'E', 'H', 'G', 'D'];

   var selectDate = DateTime.now();
  var selectTime= TimeOfDay.now();
  
  void callDataPicker() async {
    var selectedDate = await getDatePickerWidget();
    setState(() {
      selectDate = selectedDate!;
    });
  }

  void callTimePicker() async {
    var selectTimes = await getDateTime();
    setState(() {
      selectTime = selectTimes!;
    });
  }

  Future<DateTime?> getDatePickerWidget() {
    return showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
      initialEntryMode:DatePickerEntryMode.calendar,
      );
     
    
  }
//tiempo
  Future<TimeOfDay?> getDateTime() {
    return showTimePicker(
      context: context, 
      initialTime: selectTime
    );
     
    
  }

  String a = "";
  @override
  Widget build(BuildContext context) {
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
                  'Selecciona año y sección a enviar la actividad',
                  style: TextStyle(color: Colors.white, fontSize: 20),
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
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(10),
                            dropdownColor: Color.fromARGB(255, 208, 171, 241),
                            value: _seleccionada,
                            items: GetOptionsDropDownButton(),
                            onChanged: (value) {
                              setState(() {
                                _seleccionada = value.toString();
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
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(10),
                            dropdownColor: Color.fromARGB(255, 208, 171, 241),
                            value: _seleccionada2,
                            items: GetOptionsDropDownButton2(),
                            onChanged: (value) {
                              setState(() {
                                _seleccionada2 = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                    ]),
                    Padding(padding: EdgeInsets.all(20)),
                    Text(
                  'Seleccione una hora y fecha limite\n                      de entrega',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Padding(padding: EdgeInsets.all(20)),
                selectDate==null && selectTime==null?
                Text('Fecha')
                :
                Text("$selectDate"),
                Text("$selectTime"),
                Padding(padding: EdgeInsets.all(20)),
                SafeArea(child: 
                 MaterialButton(onPressed: callDataPicker,
                      child: Container(child: 
                      Text('Agregar fecha'),
                      ),)
                ),
                Padding(padding: EdgeInsets.all(20)),
                SafeArea(child: 
                 MaterialButton(onPressed: callTimePicker,
                      child: Container(child: 
                      Text('Agregar hora'),
                      ),)
                ),
               
                
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
