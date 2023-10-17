// ignore: file_names
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../main.dart';
import 'package:ingles/developer/consultad.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: VerNotasA(usuario: '', contra: '',),
  ));
}

class VerNotasA extends StatefulWidget {
  final String contra;
  final String usuario;
  const VerNotasA({super.key, required this.contra, required this.usuario, });

  @override
  State<VerNotasA> createState() => _VerNotasAEState();
}

class _VerNotasAEState extends State<VerNotasA> {
  final usuariob = TextEditingController();
  final contrab = TextEditingController();

  String usuariobd = "";
  String contrabd = "";
  var resultado;
  bool isLoading=true;
  String info="";
  var dato;
  List<String> nombre = [];
  List<String> nota = [];

@override
void initState() {
  super.initState();
  getActivitys();

}
Future<void> getActivitys()async{
usuariobd = widget.usuario;
    contrabd = widget.contra;
    resultado = await historialestu2(usuariobd, contrabd);
    print(resultado);
    if(resultado !="Error"){
      for (var i=0; i<resultado.length;i++) {
        dato=resultado[i];
        var nombre_p = dato['nombre'];
        var nota_p = dato['nota'];
        setState(() {
        if(nombre_p!=null){
        nombre.add(nombre_p);
        }else{
        nombre.add("Aun no hay actividades");
        }

        if(nota_p!=null){
        nota.add(nota_p);
        }else{
          nota.add("0");
        }
          isLoading=false;
          
         
        });
      }
    }else{
      setState(() {
        isLoading=false;
        info="Error";
      });
    }
}

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;//contenedores
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth < 340 ? 8.00 : screenWidth >=600? 30.00 : 25.00;//titulos
    double textSize2 = screenWidth < 340 ? 8.00 : screenWidth >=600? 30.00 : 20.00;//subtitulos
     double textSize3 = screenWidth < 340 ? 8.00 : screenWidth >=600? 30.00 : 15.00;//texto
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondo_v.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              title: Center(
                child: Column(
                  children: [
                    GradientText(
                      'HOMEWORK GRADES',
                      style:  TextStyle(
                        fontSize: textSize,
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
                      style:  TextStyle(
                        fontSize: textSize2,
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
                 SizedBox(
                  height: screenSize.height*0.05,
                ),
                Container(
                  width: screenSize.width*1,
                  color: Colors.black,
                  height: screenSize.height*0.003,
                ),
                 isLoading
                          ? Column(
                              children: [
                                SizedBox(
                                  height: screenSize.height * 0.3,
                                ),
                                const FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: CircularProgressIndicator(
                                    color: Color.fromARGB(255, 70, 35, 224),
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Cargando",
                                  style: TextStyle(
                                      fontSize: textSize,
                                      fontStyle: FontStyle.italic),
                                )
                              ],
                            )
                          : info == "Error"
                              ? Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: screenSize.height * 0.3,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(width: screenSize.width*0.003),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: MaterialButton(
                                              onPressed: () {
                                                setState(() {
                                                  info = "";
                                                  isLoading=true;
                                                  getActivitys();
                                                });
                                              },
                                              child: Row(children: [
                                                Text("Reintentar",style: TextStyle(fontSize: textSize),),
                                                Icon(Icons.error)
                                              ]),
                                            ),
                                          ),
                                          Padding(padding: EdgeInsets.all(10)),
                                          Text(
                                              "Error en la red o no estas conectado",style: TextStyle(fontSize: textSize),),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : 
                SizedBox(
                  height: screenSize.height*0.05,
                ),
                for (var i = 0; i < nombre.length; i++)
                Container(
                    margin: EdgeInsets.only(top: 20),
                    width: screenSize.width*0.9,
                    height: screenSize.height*0.08,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color: Color.fromARGB(255, 249, 249, 249),
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 30,
                          top: 20,
                          child: Text(nombre[i], style: TextStyle(fontSize: textSize3)),
                        ),
                        Positioned(
                          left: 255,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 2,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 270,
                          top: 20,
                          child: Text(nota[i] + "/10",style: TextStyle(fontSize: textSize3),),
                        ),
                      ],
                    ),
                  ),
              ],
            ))));
  }

}
