// ignore: file_names
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../main.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: VerNotasA(),
  ));
}

class VerNotasA extends StatefulWidget {
  const VerNotasA({super.key});

  @override
  State<VerNotasA> createState() => _VerNotasAEState();
}

class _VerNotasAEState extends State<VerNotasA> {
  final usuariob = TextEditingController();
  final contrab = TextEditingController();

  String usuariobd = "";
  String contrabd = "";
    String _seleccionada2 = 'Año';
    String _seleccionada = 'Seccion';
    String _seleccionada3 = 'Unidad';
  List anio = ['Año', '1', '2', '3'];
  List seccion = ['Seccion','A','B','D','E','F','G','H','K','L','M','N','O'];
  List unidad = ['Unidad','U1','U2','U3','U4'];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondo_v.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              title: Center(
                child: Column(
                  children: [
                    GradientText(
                      'HOMEWORK GRADES',
                      style: const TextStyle(
                        fontSize: 30.0,
                      ),
                      gradientType: GradientType.linear,
                      gradientDirection: GradientDirection.ttb,
                      radius: 3.5,
                      colors: const [
                        Color.fromARGB(255, 170, 63, 233),
                        Color.fromARGB(255, 66, 91, 233),
                        Color.fromARGB(255, 60, 135, 221),
                      ],
                    ),
                    GradientText(
                      '(Calificaciones de tarea)',
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                      gradientType: GradientType.linear,
                      gradientDirection: GradientDirection.ttb,
                      radius: 3.5,
                      colors: const [
                        Color.fromARGB(255, 170, 63, 233),
                        Color.fromARGB(255, 66, 91, 233),
                        Color.fromARGB(255, 60, 135, 221),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Filtros:",
                      style: TextStyle(
                        color: Color.fromARGB(255, 87, 51, 235),
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //definicion de menu desplegabe para año
                   Container(
                      width: 70,
                      height: 31,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 135, 114, 216),
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: DropdownButton(items: GetOptionsDropDownButton2(),
                   value: _seleccionada2,
                   onChanged: (value){
                    setState(() {
                      _seleccionada2 = value.toString();

                    });
                   },
                   style: TextStyle(color: Colors.white,fontSize: 20,),
                   dropdownColor: Color.fromARGB(255, 135, 114, 216),
                   borderRadius: BorderRadius.circular(10),
                   ),
                      )
                    ),
                      //fin de definicion de menu desplegable de año
                      //inicio de definicion de menu desplegable de secciones
                     Container(
                      width: 94,
                      height: 31,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 135, 114, 216),
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: DropdownButton(items: GetOptionsDropDownButton(),
                   value: _seleccionada,
                   onChanged: (value){
                    setState(() {
                      _seleccionada = value.toString();

                    });
                   },
                   style: TextStyle(color: Colors.white,fontSize: 20,),
                   dropdownColor: Color.fromARGB(255, 135, 114, 216),
                   borderRadius: BorderRadius.circular(10),
                   ),
                      )
                    ), 
                    //fin de definicion de menu desplegable de secciones
                    Container(
                      width: 90,
                      height: 31,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 135, 114, 216),
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: DropdownButton(items: GetOptionsDropDownButton3(),
                   value: _seleccionada3,
                   onChanged: (value){
                    setState(() {
                      _seleccionada3 = value.toString();

                    });
                   },
                   style: TextStyle(color: Colors.white,fontSize: 20,),
                   dropdownColor: Color.fromARGB(255, 135, 114, 216),
                   borderRadius: BorderRadius.circular(10),
                   ),
                      )
                    ),
                    //espacio para edificion de boton de busqueda
                    MaterialButton(
                      onPressed: () {},
                      child: const SizedBox(
                          height: 35,
                          width: 35,
                          child: Image(image: AssetImage('assets/lupa.png'))),
                          minWidth: 35,

                    ),
                    //fin de espacio para edición de boton de busqueda
                  ],
                ),
                //espacio para definicion de linea
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 1000,
                  color: Colors.black,
                  height: 2,
                ),
                //fin de espacio para definicion de linea
                const SizedBox(
                  height: 20,
                ),
                //espacio para definición de contenedor para mostrar historial
                MaterialButton(onPressed:(){

                } ,
                child: Container(
                  width: 320,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color: Colors.grey,
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row( 
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          const Text("Name of Activity",style: TextStyle(fontSize: 15),),
                          const SizedBox(
                            width: 110,
                          ),
                          Column(
                            children: const[
                               SizedBox(
                            height: 40,
                          ),
                              Text("U1",style: TextStyle(fontSize: 15),),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),

                          //espacio para definición de linea horizontal
                          Container(
                            width: 2,
                            height: 76,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black)
                                //fin de espacio de linea horizontal
                                ),
                          ),
                          const SizedBox(width:10),
                          const Text("0/10",style: TextStyle(fontSize: 15),),
                        ],
                      ),
                    ],
                  ),
                ),
                )
                //fin de definición de contenedor 

              ],
            ))));
  }

  List<DropdownMenuItem<String>> GetOptionsDropDownButton2() {
    List<DropdownMenuItem<String>> anios = [];
    anio.forEach((element) {
      
      anios.add(DropdownMenuItem(
        child: Text(element),
        
        value: element,
      ));
    });
    return anios;
  }
  List<DropdownMenuItem<String>> GetOptionsDropDownButton() {
    List<DropdownMenuItem<String>> secciones = [];
    seccion.forEach((element) {
      
      secciones.add(DropdownMenuItem(
        child: Text(element),
        
        value: element,
      ));
    });
    return secciones;
  }
  List<DropdownMenuItem<String>> GetOptionsDropDownButton3() {
    List<DropdownMenuItem<String>> unidades = [];
    unidad.forEach((element) {
      
      unidades.add(DropdownMenuItem(
        child: Text(element),
        
        value: element,
      ));
    });
    return unidades;
  }

}
