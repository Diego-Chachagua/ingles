// ignore: file_names
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import '../developer/consultaso.dart';
import '../main.dart';
import 'administracion.dart';
import 'elec_op_p.dart';
import 'tareasM.dart';
import 'unidades.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FormA(),
  ));
}

class FormA extends StatefulWidget {
  const FormA({super.key});

  @override
  State<FormA> createState() => _FormAState();
}

class _FormAState extends State<FormA> {

   bool _obscureText = true;
final usuariob =TextEditingController();
final contrab =TextEditingController();
var reslt;
var cod;

  String usuariobd = "";
  String contrabd = "";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth < 340 ? 8.00 : screenWidth > 600? 30.00 : 15.00;//para  botones
    double textSize2 = screenWidth < 340 ? 20.0 : screenWidth >600 ? 70.00 : 40.00;//para titulos
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fondof.jpg'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          title: Center(
            child: GradientText(
              'WELCOME',
              style: TextStyle(
                fontSize:textSize2,
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
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //cuerpo del formulario
              Cuerpo(context),
              Row(
                children: [
                  SizedBox(
                    width: screenSize.width * 0.15,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.3,
                  ),
                  Container(
                    width: screenSize.width*0.25,
                    height: screenSize.height*0.045,
                    child: MaterialButton(
                      color: const Color.fromARGB(255, 135, 8, 160),
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FirstRoute()),
                        );
                      },
                      child:  Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.white,fontSize: textSize),
                      ),
                    ),
                  ),
                   SizedBox(
                    width: screenSize.width * 0.2,
                  ),
                  Container(
                    width: screenSize.width*0.25,
                    height: screenSize.height*0.045,
                    child: MaterialButton(
                    color: const Color.fromARGB(255, 135, 8, 160),
                    onPressed: () async{
                       usuariobd = usuariob.text;
                    contrabd = contrab.text;
                    //comprobacion de usuario y contraseña
                    if (usuariobd.isNotEmpty || contrabd.isNotEmpty) {
                    dynamic respuesta = await comprobara(usuariobd,contrabd);
                    if (respuesta == "Error") {
                        _mensaje(context);

                      //se produjo un error
                    }
                    if (respuesta == "noExiste") {
                      //no hay usuario con ese nombre
                      _mensajeUsu(context);
                    } else {
                         if(respuesta == "admin"){
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Administracion()),
                   );
                      }
                    }
                    }
                    
                    },
                    child:  Text('Iniciar', style: TextStyle(color: Colors.white,fontSize: textSize),),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
//widgets que forman la aplicacion
// ignore: non_constant_identifier_names
  Widget Cuerpo(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Center(
      child: Column(children: <Widget>[
        SizedBox(
      height: screenSize.height * 0.05,
    ),
        control(context),
         SizedBox(
          height: screenSize.height * 0.05,
        ),
        usuario(context),
         SizedBox(
          height: screenSize.height * 0.05,
        ),
        contrasena(context),
      ]),
    );
  }

  Widget control(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth < 340 ? 15.00 : screenWidth > 600? 45.00 : 25.00;//subtitulo
    return GradientText(
      'INICIO DE SESIÓN',
      style:  TextStyle(
        fontSize: textSize,
      ),
      gradientType: GradientType.linear,
      gradientDirection: GradientDirection.ttb,
      radius: 2.5,
      colors: const [
        Color.fromARGB(255, 130, 0, 206),
        Color.fromARGB(255, 70, 119, 255),
        Color.fromARGB(255, 0, 80, 172),
      ],
    );
  }


  Widget usuario(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
     double textSize = screenWidth < 340 ? 8.00 : screenWidth > 600? 30.00 : 16.00;//para  botones
     Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: screenSize.width * 0.05, vertical: screenSize.height * 0.01 ),
      child: TextField(
        style: TextStyle(fontSize: textSize),
        controller: usuariob,
        decoration:  InputDecoration(
          counterStyle: TextStyle(color: Colors.white),
          hintText: "Usuario",
          hintStyle: TextStyle(fontSize:textSize)
        ),
      ),
    );
  }

Widget contrasena(BuildContext context){
   double screenWidth = MediaQuery.of(context).size.width;
  double textSize = screenWidth < 340 ? 8.00 : screenWidth > 600? 30.00 : 16.00;//para  botones
   Size screenSize = MediaQuery.of(context).size;
  return Container(
    padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05, vertical: screenSize.height * 0.01 ),
    child: TextField(
      style: TextStyle(fontSize: textSize),
      controller: contrab,
      obscureText: _obscureText,
      decoration:  InputDecoration(
        suffixIcon: GestureDetector(onTap: (){
          setState(() {
            _obscureText=!_obscureText;
          });
        },
        child: Icon(_obscureText ?Icons.visibility : Icons.visibility_off),
        ),
        counterStyle: TextStyle(color: Colors.white),
        hintText: "contraseña",
        hintStyle: TextStyle(fontSize: textSize)
      ),
    ));
  }

  void _mensajeUsu(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Usuario no existe"),
            content: const Text(
                'Los datos ingresados no coinciden con alguna cuenta de usuario'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    usuariob.clear();
                    contrab.clear();
                  },
                  child: const Text('Aceptar'),
                ),
              )
            ],
          );
        });
  }

  void _mensaje(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error de conexión"),
            content:
                const Text('La conexion es lenta\nIntentalo de nuevo mas tarde o conectate a una red WIFI'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text('Aceptar'),
                ),
              )
            ],
          );
        });
  }
}
