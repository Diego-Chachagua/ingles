// ignore: file_names
import 'package:flutter/material.dart';
import '../main.dart';
import 'op_alumno.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FormE(),
  ));
}

class FormE extends StatefulWidget {
  const FormE({super.key});

  @override
  State<FormE> createState() => _FormEState();
}

class _FormEState extends State<FormE> {
final usuariob =TextEditingController();
final contrab =TextEditingController();

String usuariobd = "";
String contrabd = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondop.jpg'),
            fit: BoxFit.cover
          ),
        ),
      child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              
              title: const Center(child:  Text('CONTROL DE NOTAS', style: TextStyle(fontSize: 30),)),
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
              
                  MaterialButton(
                  color: Colors.red,
                  onPressed: (){
            Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => const FirstRoute()),
                        );
                  },
                  child: const Text('Cancelar'),
                  ),
              
              const SizedBox(
                width: 30,
              ),
              
                  MaterialButton(
                  color: const Color.fromARGB(255, 20, 250, 28),
                  onPressed: () async{
                    usuariobd = usuariob.text;
                    contrabd = contrab.text;
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const OpAlum()));
                  },
                  child: const Text('Iniciar'),
                  ),
                ],
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
     linea(),
     espacio(),
     usuario(),
     contrasena(),
     

   ]),
 );
}

Widget control(){
  return const Text("Inicio de sesión", style: TextStyle(color: Colors.black, fontSize: 40),);
}

Widget espacio(){
  return const SizedBox(
    height: 30,
  );
}

Widget linea(){
  return const Text('___________________________________________________', style: TextStyle(color: Color.fromARGB(255, 5, 5, 5)),);
}

Widget usuario(){
  return  Container(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
    child: TextField(
      controller: usuariob,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counterStyle: const TextStyle(color: Colors.white),
        hintText: "Usuario",
      ),
    ),
  );
}

Widget contrasena(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
    child: TextField(
      controller: contrab,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
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