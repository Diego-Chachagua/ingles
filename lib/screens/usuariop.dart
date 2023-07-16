// ignore: file_names
import 'package:ingles/screens/registrarse.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import '../developer/consultaso.dart';
import '../main.dart';
import 'form_p.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: UsuarioP(),
  ));
}

class UsuarioP extends StatefulWidget {
  const UsuarioP({super.key});

  @override
  State<UsuarioP> createState() => _UsuarioPState();
}

class _UsuarioPState extends State<UsuarioP> {
List<String> usup = [];
List<String> contrap = [];
List<String> nombrep= [];
var reslt;

@override
void initState(){
  super.initState();
  (() async{
    reslt = await consultarup();
    if (reslt!="noExisten"){
      for (var i = 0; i < reslt.length; i++){
    var dato =reslt[i];
    print(dato["nombre_p"]);
    print(dato["usu_p"]);
    print(dato["contra_p"]);

  // ignore: non_constant_identifier_names
          var nom_tem = dato["nombre_p"];
     

          // ignore: non_constant_identifier_names
          var id_tem = dato["usu_p"];

          // ignore: non_constant_identifier_names
          var i_tem = dato["contra_p"];
         

setState(() {
  // Actualizar las listas con los datos obtenidos
  nombrep.add(nom_tem);
  usup.add(id_tem);
  contrap.add(i_tem);
});
  }
    }
  })();
}

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
                  'INFORMACIÓN DE PROFESORES',
                  style: const TextStyle(
                      fontSize: 20.0,
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
            child:  Padding(
              padding: const EdgeInsets.all(7.0),
            child: Table(
              columnWidths: const {0: FractionColumnWidth(0.3)},
              border: TableBorder.all(),
              children:  [
                TableRow(
                  children: [
                    nombrepr(),
                    usuario(),
                    contra(),
                  ]
                ),
                 for (var i = 0; i < nombrep.length; i++)
                 TableRow(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255)
                  ),
                  children: [
                     Center(child: Text(nombrep[i], style: const TextStyle(fontSize: 20))),
                     Center(child: Text(usup[i], style: const TextStyle(fontSize: 20))),
                     Center(child: Text(contrap[i], style: const TextStyle(fontSize: 20))),
                  ]
                 )
              ],
            ),
            ),
          ),
    
          ),
    );
  }

    Widget usuario() {
    return Container(
        color: const Color.fromARGB(255, 150, 70, 255),
        child: const Center(
            child: Text('Usuario',style: TextStyle(fontSize: 20, color: Colors.white),
        )));
  }

      Widget nombrepr() {
    return Container(
        color: const Color.fromARGB(255, 150, 70, 255),
        child: const Center(
            child: Text('Nombre',style: TextStyle(fontSize: 20, color: Colors.white),
        )));
  }

       Widget contra() {
    return Container(
        color: const Color.fromARGB(255, 150, 70, 255),
        child: const Center(
            child: Text('Contraseña',style: TextStyle(fontSize: 20, color: Colors.white),
        )));
  }











}