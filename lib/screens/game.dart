// ignore: file_names
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import '../developer/consultasf.dart';
import '../developer/consultaso.dart';
import '../main.dart';
import 'elec_op_p.dart';
import 'tareasM.dart';
import 'unidades.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Game(
      game: '',
      ask: '',
      cod: '',
    ),
  ));
}

class Game extends StatefulWidget {
  var game;
  String ask;
  var cod;
  Game({super.key,required this.game,required this.ask,required this.cod});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {

   bool _obscureText = true;
final usuariob =TextEditingController();
final contrab =TextEditingController();
var reslt;
final respuestaG= TextEditingController();
var cod;
var contador=0;
  var n1;
    bool valor=false;
  bool valor2=false;
  bool valor3=false;
  bool valor4=false;
  var n3;
    

  String usuariobd = "";
  String contrabd = "";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;//contenedores
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth < 340 ? 8.00 : screenWidth >=600? 30.00 : 18.00;//titulos
    double textSize2 = screenWidth < 340 ? 10.0 : screenWidth >=600 ? 40.00 : 15.00;//subtitulos
    double textSize3 = screenWidth < 340 ? 10.0 : screenWidth >=600 ? 30.00 : 17.00;//preguntas
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fondof.jpg'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
         
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: screenSize.width*0.9,
              height: screenSize.height*1,
              child: Column(
                children: [
                  Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [ 
                                            Container(
                                              width: screenSize.width*0.9,
                                              decoration: BoxDecoration(
                                                   color: Color.fromARGB(255, 199, 157, 236),
                                                  border: Border.all(width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 5),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                    children: [
                                                       Container(
                                                    width: screenSize.width*0.7,
                                                    child: TextField(
                                                      enabled: false,
                                                      maxLines: 3,
                                                      decoration:
                                                          InputDecoration.collapsed(
                                                              hintText:
                                                                  "${widget.ask}"),
                                                    ),
                                                  ),
                                                    ],
                                                  ),
                                                  Padding(padding: EdgeInsets.all(5)),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Container(
                                                        width: screenSize.width*0.4,
                                                        child: 
                                                        TextField(controller: respuestaG ,
                                                        enabled: widget.game!=null?
                                                        true: false,
                                                        decoration: InputDecoration(
                                                          hintText: "Respuesta",
                                                          border:OutlineInputBorder() ),),
                                                      ),
                                                      TextButton(onPressed: (){
                                                        setState(() {
                                                           var respuestas= respuestaG.text;
                                                        print(respuestas);
                                                        if(widget.game!=respuestas){
                                                          contador++;
                                                          if(contador==1){
                                                            setState(() {
                                                              
                                                            
                                                            n1=Border.all(width: 2);
                                                            });
                                                          }
                                                          if(contador==2){
                                                            setState(() {
                                                            n3=Colors.black;
                                                            });
                                                          }
                                                          if(contador==3){
                                                            setState(() {
                                                            valor=true;//brazo izquierdo
                                                            });
                                                          }
                                                          if(contador==4){
                                                            setState(() {    
                                                            valor2=true;
                                                            });
                                                          }
                                                          if(contador==5){
                                                            setState(() {
                                                            valor3=true;
                                                            });
                                                          }
                                                          if(contador==6){
                                                            setState(() {
                                                            valor4=true;
                                                            });
                                                            addrequestGame(widget.cod,respuestas);
                                                            Navigator.pop(context);
                                                             final snackBar = SnackBar(
                                                            backgroundColor: Color.fromARGB(255, 155, 118, 214),
                                                            shape: Border.all(width: 1),
                                                            closeIconColor: Color.fromARGB(255, 230, 230, 230),
                                                            content: Row(
                                                            children: [
                                                              Text("La respuesta fue incorrecta\n¡Respuesta guardada con exito!\nEs necesario refrescar la pantalla"),
                                                            ],
                                                          ));
                                                           ScaffoldMessenger.of(context).showSnackBar(snackBar);
            
                                                          }   
                                                           
                                                        }else{
                                                          addrequestGame(widget.cod,respuestas);
                                                           Navigator.pop(context);
                                                            final snackBar = SnackBar(
                                                            backgroundColor: Color.fromARGB(255, 155, 118, 214),
                                                            shape: Border.all(width: 1),
                                                            closeIconColor: Color.fromARGB(255, 230, 230, 230),
                                                            content: Row(
                                                            children: [
                                                              Text("Respuesta Acertada,\n¡guardada con exito!\nEs necesario refrescar la pantalla"),
                                                            ],
                                                          ));
                                                           ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                        }
                                                        });
                                                        respuestaG.text="";
                                                      }, child: Container(
                                                        width: 100,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                          border: Border.all(width: 1),
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        child: Center(child: Text("Comprobar",style: TextStyle(color: Colors.black),))))
                                                    ],
                                                  ),
                                                   Padding(padding: EdgeInsets.all(10)),
                                                   //caja de muñeco
                                                   //si aun no se responde
                                                  widget.game!=null?
                                                  Container(
                                                    height: 350,
                                                    decoration: BoxDecoration(
                                                      border:Border.all(width: 1),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Padding(padding: EdgeInsets.all(10)),
                                                        Container(width: 150,height: 2,color: Colors.black,),
                                                        Row(
                                                          crossAxisAlignment:CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(width: 60,),
                                                      Column(
                                                        children: [
                                                          Container(width: 2,height: 30,color: Colors.black,),
                                                          //cabeza
                                                           Container(width: 30,height:30 ,decoration: BoxDecoration(
                                                            border: n1,
                                                            borderRadius: BorderRadius.circular(50),
                                                           ),),
                                                           Row(
                                                             children: [
                                                              //brazo izquierdo
                                                              Container(width: 10,height: 60,
                                                              child: CustomPaint(
                                                                painter:valor==false?
                                                                DiagonalPainter3():
                                                                DiagonalPainter()
                                                                
                                                              ),),
                                                              //cuerpo
                                                               Container(width: 2,height: 100,color: n3,),
                                                               //brazo derecho
                                                               Container(width: 10,height: 60,
                                                              child: CustomPaint(
                                                                painter:  valor2==false?
                                                                DiagonalPainter3():
                                                                DiagonalPainter2()
                                                              ),),
                                                             ],
                                                           ),
                                                           //piernas
                                                           Row(
                                                            children: [
                                                              //pierna izquierda
                                                              Container(width: 10,height: 60,
                                                              child: CustomPaint(
                                                                painter: valor3==false?
                                                                DiagonalPainter3():
                                                                DiagonalPainter()
                                                              ),),
                                                              //pierna derecha
                                                               Container(width: 10,height: 60,
                                                              child: CustomPaint(
                                                                painter: valor4==false?
                                                                DiagonalPainter3():
                                                                DiagonalPainter2()
                                                              ),),
                                                            ],
                                                           )
                                                        ],
                                                      ),
                                                     
                                                      SizedBox(width: 120,),
                                                    Container(width: 2,height: 300,color: Colors.black,),
                                                    
                                                  ],),
                                                  Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 185,
                                                        ),
                                                        Container(
                                                          width: 50,
                                                          height: 2,
                                                          color: Colors.black,
                                                        )
                                                      ],
                                                    )
                                                      ],
                                                      
                                                    ),
                                                  ):
                                                  Padding(padding: EdgeInsets.all(0))
                                                ]
                  )
                )
                                          ]
                  ),
                ],
              ),
            ),
          ),
        )
      )
    );
  }
//widgets que forman la aplicacion
// ignore: non_constant_identifier_names
}
class DiagonalPainter extends CustomPainter {
   @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    
    canvas.drawLine(Offset(size.width, 0), Offset(-30, 30), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}
//brazo derecho y pierna derecha
class DiagonalPainter2 extends CustomPainter {
   @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    
   canvas.drawLine(Offset(0, 0), Offset(40, 30), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}

//no mostrar
class DiagonalPainter3 extends CustomPainter {
   @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}
