// ignore: file_names
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import '../developer/consultaso.dart';
import '../main.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: Formes(),
  ));
}

class Formes extends StatefulWidget {
  const Formes({super.key});

  @override
  State<Formes> createState() => _FormesState();
}

class _FormesState extends State<Formes> {
  bool _obscureText = true;
final usuariob =TextEditingController();
final contrab =TextEditingController();

String usuariobd = "";
String contrabd = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondof.jpg'),
            fit: BoxFit.fill
          ),
        ),
      child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              
              title: Center(
                child: GradientText(
                  'WELCOME',
                  style: const TextStyle(
                      fontSize: 50.0,
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
                Cuerpo(),
                Row(
                children: [
              
              const SizedBox(
                width: 76,
              ),
              const SizedBox(
                height: 210,
              ),
                  MaterialButton(
                  color: const Color.fromARGB(255, 135, 8, 160),
                  onPressed: (){
            Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => const FirstRoute()),
                        );
                  },
                  child: const Text('Cancelar', style: TextStyle(color: Colors.white),),
                  ),
              
              const SizedBox(
                width: 30,
              ),
              
                  MaterialButton(
                  color: const Color.fromARGB(255, 135, 8, 160),
                  onPressed: () async{
                     usuariobd = usuariob.text;
                    contrabd = contrab.text;
                    if (usuariobd.isNotEmpty || contrabd.isNotEmpty) {
                    dynamic respuesta = await comprobare(usuariobd,contrabd);
                    if (respuesta == "error") {
                        _mensaje(context);

                      //se produjo un error
                    }
                    if (respuesta == "noExiste") {
                      //no hay usuario con ese nombre
                      _mensajeUsu(context);
                    } else {
                         if(respuesta == "estudiante"){
                        // ignore: use_build_context_synchronously
                         Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FirstRoute()),
                   );
                      }
                    }
                    }
                    
                  },
                  child: const Text('Iniciar', style: TextStyle(color: Colors.white),),
                  ),

                  const SizedBox(
                height: 50,
              ),
                ],
                ),
                   MaterialButton(
                color: Colors.transparent,
                elevation: 0,
                onPressed: (){
                  
                },
              child: const Text('¡NO POSEE USUARIO REGISTRATE AQUI!', style: TextStyle(color: Colors.blue),),
              ),
              ],
            ),
          ),
    
          ),
    );
  }


// ignore: non_constant_identifier_names
Widget  Cuerpo(){
 return  Center(
   child: Column(children:  <Widget> [
     espacio(),
     control(),
     const SizedBox(
      height: 40,
     ),
     usuario(),
     const SizedBox(
      height: 10,
     ),
     contrasena(),
     

   ]),
 );
}

Widget control(){
  return GradientText(
                'INICIO DE SESIÓN',
                style: const TextStyle(
                    fontSize: 25.0,
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

Widget espacio(){
  return const SizedBox(
    height: 40,
  );
}



Widget usuario(){
  return  Container(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
    child: TextField(
      controller: usuariob,
      decoration: const InputDecoration(
        counterStyle: TextStyle(color: Colors.white),
        hintText: "Usuario",
      ),
    ),
  );
}

Widget contrasena(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
    child: TextField(
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
        counterStyle: const TextStyle(color: Colors.white),
        hintText: "contraseña",
      ),
    ),
  );
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
                const Text('Ocurrió un error al conectar con la base de datos'
                    'o consulta errónea.'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    usuariob.clear();
                    contrab.clear();
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