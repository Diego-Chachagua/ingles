import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Ayuda extends StatelessWidget {
  const Ayuda({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Manual());
  }
}

class Manual extends StatefulWidget {
  const Manual({super.key});

  @override
  State<Manual> createState() => _ManualState();
}

class _ManualState extends State<Manual> {
  bool expanded1 = false;
  bool expanded2 = false;
  bool expanded3 = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fondom.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: GradientText(
            '¿Como ingresar?',
            style: TextStyle(fontSize: 24),
            colors: [
              Color.fromARGB(255, 170, 63, 233),
              Color.fromARGB(255, 66, 91, 233),
              Color.fromARGB(255, 60, 135, 221),
            ],
          ),
          backgroundColor: const Color(0x00E8E2E2),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          children: <Widget>[Cuerpo()],
        ),
      ),
    );
  }

  Widget Cuerpo() {
    return Container(
      child: Column(children: <Widget>[
        titulo1(),
        espacio(),
        espacio(),
        espacio(),
        titulo2(),
        espacio(),
        acordeon(),
      ]),
    );
  }

  Widget espacio() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget titulo1() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientText(
                  'ATENCION',
                  style: TextStyle(fontSize: 16),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: 2.5,
                  colors: [
                    Color.fromARGB(255, 170, 63, 233),
                    Color.fromARGB(255, 66, 91, 233),
                    Color.fromARGB(255, 60, 135, 221),
                  ],
                ),
                SizedBox(height: 8.0),
                GradientText(
                  'BIENVENIDOS',
                  style: TextStyle(fontSize: 16),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: 2.5,
                  colors: [
                    Color.fromARGB(255, 170, 63, 233),
                    Color.fromARGB(255, 66, 91, 233),
                    Color.fromARGB(255, 60, 135, 221),
                  ],
                ),
                SizedBox(height: 8.0),
                GradientText(
                  'a nuesta aplicacion de ingles,',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: 2.5,
                  colors: [
                    Color.fromARGB(255, 170, 63, 233),
                    Color.fromARGB(255, 66, 91, 233),
                    Color.fromARGB(255, 60, 135, 221),
                  ],
                ),
                SizedBox(height: 8.0),
                GradientText(
                  'Ayuda y atencion al personal docente',
                  style: TextStyle(fontSize: 10),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: 2.5,
                  colors: [
                    Color.fromARGB(255, 170, 63, 233),
                    Color.fromARGB(255, 66, 91, 233),
                    Color.fromARGB(255, 60, 135, 221),
                  ],
                ),
                SizedBox(height: 8.0),
                GradientText(
                  'y estudiante, toda la ayuda que ',
                  style: TextStyle(fontSize: 10),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: 2.5,
                  colors: [
                    Color.fromARGB(255, 170, 63, 233),
                    Color.fromARGB(255, 66, 91, 233),
                    Color.fromARGB(255, 60, 135, 221),
                  ],
                ),
                SizedBox(height: 8.0),
                GradientText(
                  'necesita se encuentra aqui!',
                  style: TextStyle(fontSize: 10),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: 2.5,
                  colors: [
                    Color.fromARGB(255, 170, 63, 233),
                    Color.fromARGB(255, 66, 91, 233),
                    Color.fromARGB(255, 60, 135, 221),
                  ],
                ),
                SizedBox(height: 8.0),
                GradientText(
                  'NO SABES COMO INICIAR SESION',
                  style: TextStyle(fontSize: 10),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: 2.5,
                  colors: [
                    Color.fromARGB(255, 170, 63, 233),
                    Color.fromARGB(255, 66, 91, 233),
                    Color.fromARGB(255, 60, 135, 221),
                  ],
                ),
                SizedBox(height: 8.0),
                GradientText(
                  'COMO ESTUDIANTE,',
                  style: TextStyle(fontSize: 10),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: 2.5,
                  colors: [
                    Color.fromARGB(255, 170, 63, 233),
                    Color.fromARGB(255, 66, 91, 233),
                    Color.fromARGB(255, 60, 135, 221),
                  ],
                ),
                SizedBox(height: 8.0),
                GradientText(
                  'ADMINITRADOR O DOCENTE?,',
                  style: TextStyle(fontSize: 10),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: 2.5,
                  colors: [
                    Color.fromARGB(255, 170, 63, 233),
                    Color.fromARGB(255, 66, 91, 233),
                    Color.fromARGB(255, 60, 135, 221),
                  ],
                ),
                SizedBox(height: 8.0),
                GradientText(
                  'MUY FACIL CON ESTE SIMPLE',
                  style: TextStyle(fontSize: 10),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: 2.5,
                  colors: [
                    Color.fromARGB(255, 170, 63, 233),
                    Color.fromARGB(255, 66, 91, 233),
                    Color.fromARGB(255, 60, 135, 221),
                  ],
                ),
                SizedBox(height: 8.0),
                GradientText(
                  ' MANUAL DE GUIA LO SABRAS RAPIDO',
                  style: TextStyle(fontSize: 10),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: 2.5,
                  colors: [
                    Color.fromARGB(255, 170, 63, 233),
                    Color.fromARGB(255, 66, 91, 233),
                    Color.fromARGB(255, 60, 135, 221),
                  ],
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/manual.png',
            width: 130,
            height: 150,
          ),
        ],
      ),
    );
  }

  Widget titulo2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GradientText(
          'MANUAL DE USUARIO',
          style: TextStyle(fontSize: 24.0),
          gradientType: GradientType.linear,
          gradientDirection: GradientDirection.ttb,
          radius: 2.5,
          colors: [
            Color.fromARGB(255, 170, 63, 233),
            Color.fromARGB(255, 66, 91, 233),
            Color.fromARGB(255, 60, 135, 221),
          ],
        ),
      ],
    );
  }

  Widget acordeon() {
    return Column(
      children: [
        _buildAccordion(1, '¿Eres estudiante?', expanded1, [
          const Text(
              '1-Si eres estudiante te apareceran 3 opciones y deberas presionar el de Alumno'),
          Image.asset(
            'assets/login.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const Text(
              '3-Te llevara al formulario para iniciar sesion pero si no estas registrado le das en no poseo un usuario y  te registras'),
          Image.asset(
            'assets/log_e.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/regi_e.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '4-ya te hayas registrado puedes iniciar sesion y deespues te apareceran estas 5 opciones',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/op_estu.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '5-En esas 5 opciones podras hacer tus tareas y examenes pero con fecha limite si no ya no podras acceder a la prueba o tarea, ver tus notas de tus examenes y tareas, copiar elnces de video en ver mas y ver las unidades pordas ver todos los temas que lleva cada unidad',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/act.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/acty.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/ex.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/exam.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/enlace.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/his_estu.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/his_tare.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ]),
        _buildAccordion(2, '¿Eres el docente?', expanded2, [
          const Text(
              '1-Si eres docente te aparecceran 3 opciones para iniciar sesion pero sleccionara el de profesor',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/login.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '2-Despues de eso lo dirigira a un formulario donde pondra su usuario y contraseña, su usuario y contraseña ',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/login_admin.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text('3-Despues de iniciar sesion se le mostrara 4 opciones:',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          const Text('a)crear una nueva tarea  b) crear un nuevo examen',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          const Text('c)Ver historial de tareas y exámenes creados',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          const Text(
              'd)ver  las actividades o exámenes respondidos por los estudiantes.',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/op_prof.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '4-Al darle Tareas, Al momento presionar la opción se le muestra una pantalla en la cual podrá crear una lista de preguntas, las preguntas pueden contener una imagen o un audio, como adicional se puede agregar un solo juego de ahorcado. Para agregar una nueva pregunta se me muestran 3 opciones en la barra inferior , la primera opción de la izquierda le ofrece crear una pregunta simple , en la opción de en medio se   le ofrece agregar una pregunta con una imagen ( la pregunta es de carácter obligatorio), y en la última opción se da por agregar un audio, la forma correcta de agregar un audio es por medio de URL DIRECTA, en la misma opción se muestra un botón el cual le mostrará una pantalla con los pasos a seguir para obtener una URL directa . ( Se recomienda que los audios estén en GOOGLE DRIVE) , El primer campo ( en la opción de agregar Audio) se le presenta para agregar una descripción o una pregunta, en el segundo campo se introduce la URL DIRECTA, y por último solo queda presionar el botón "Añadir"',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/add_act.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/add_preg.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/add_img_act.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/add_sound_act.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '5-También se da la oportunidad de poder editar una pregunta, simplemente pulsando encima de la pregunta que desea editar, al momento de presionar se da la una pequeña lista de opciones a poder hacer , en cualquier opción que elija se necesita un código que fue asignado a su pregunta (el código se puede observar en la parte derecha de su pregunta ) ejemplo : ( su pregunta  , código #)',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/edit_preg_act.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/rename_preg.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '6-Aunque tambien puede agregarle una imagen a la pregunta',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/edit_preg_act.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/edit_preg_img_act.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '7-Se da la posibilidad de eliminar una pregunta, simplemente pulsando un botón ( para la eliminación será necesario el código de su pregunta) . (Si no se llegan a observar cambios o que su pregunta aún no desaparece, se soluciona únicamente refrescando la pantalla)',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/delete_preg.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '8-Para agregar un juego de el ahorcado se necesita la pregunta o referencia como tal y la respuesta de su pregunta',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/add_game_act.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '9-Se da la opción de "guardar", que como tal es la opción para asignar la tarea o examen , para continuar o poder guardar se necesita un mínimo de 10 preguntas . También se necesita asignar un nombre a la actividad. ( Para cambiar el nombre de la actividad, se le presenta un botón en la esquina inferior derecha de dónde se encuentra el nombre de la actividad) Luego de cambiarlo, se le muestra una pantalla en la que seleccionara un año y una sección a asignar la actividad o examen, también será necesario selecciónar una fecha y una hora límite a entregar. ',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/nom_act_rename.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/save_exam.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '10-Para crear un nuevo examen es exactamente lo mismo excepción del juego del ahorcado que no está disponible',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/add_exam.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/add_preg_exam.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/add_img_exam.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/add_sound_exam.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/edit_preg_exam.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/edit_preg_img_exam.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/save_exam.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '11-Tambien hay un historial de las actividades y examenes asignadas que podra borrar si desea',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/history_act.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/history_exam.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '12- Para el apartado de calificar al momento de presiónar en la opción, se muestra una pantalla donde debe elegir un año y una sección de la cual desea ver actividades,  junto a que desea ver , si calificar actividades o exámenes , luego de elegir se muestra una una lista con todos los estudiantes de ese año y sección ,  cuando presione sobre el nombre o el contenedor de algún estudiante , se le mostraran las actividades asignadas que contiene ese alumno, junto a un estado los estados de las actividades pueden ser"sin responder" , "en proceso" y "finalizado".Cuando se presione sobre la actividad se lo mostrará su pregunta y se le mostrara un código con el cual podrá calificar la pregunta, y también se le mostrara la respuesta . Cuanto termine de calificar simplemente podrá salirse ( Se esperan mejoras y mejores funcionalidades en un futuro)',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/elec_dat_califi.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/elec_dat_califi_exam.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/most_act.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/most_exam.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/mos_estu.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/most_act_estu.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/most_exam_estu.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ]),
        _buildAccordion(3, '¿Eres el administrador?', expanded3, [
          const Text(
            '1-Si es el administrador te apareceran 3 opciones para iniciar session pero seleccionara el de administrador',
            style: TextStyle(color: Color.fromARGB(253, 246, 246, 234)),
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/login.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '2-Despues de eso lo dirigira a un formulario donde pondra su usuario y contraseña, su usuario y contraseña',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/login_admin.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '3-Despues de iniciar sesion se le presentaran unos 3 botones  un bton es para que pueda ver los usuarios de los estudiantes por secciones y todos los usuarios de los profesores, el boton de eliminar podra eliminar los estudiantes y profesores, y el boton de profesor podra ingresarlos',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/op_admin.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '4-Si da en el boton de consultar llo llevara a esta pantalla donde puede ver los usuarios de los estudiantes por secciones y todos los profesores',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/consulta.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '5-Si desea ver los usuarios de los estudiantes lo llevara a esta pantalla',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/usu_estu.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '6-Pero si quiere ver el de los profesores lo llevara a esta otra pantalla',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/usu_prof.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '7-Pero si usted escoge el boton de eliminar lo llevara a esta pantalla',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/elimina.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '8-Pero si presiona el boton del profesor lo enviara a esta pantalla',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
          SizedBox(height: 10),
          Image.asset(
            'assets/regi_prof.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          const Text(
              '9-Aqui podra registrar el profesor ingresando solo el nombre del docente y su apellido',
              style: TextStyle(color: Color.fromARGB(253, 246, 246, 234))),
        ]),
      ],
    );
  }

  Widget _buildAccordion(
      int index, String title, bool expanded, List<Widget> content) {
    return GestureDetector(
        onTap: () {
          setState(() {
            switch (index) {
              case 1:
                expanded1 = !expanded1;
                break;
              case 2:
                expanded2 = !expanded2;
                break;
              case 3:
                expanded3 = !expanded3;
                break;
            }
          });
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 170, 63, 233),
                    Color.fromARGB(255, 66, 91, 233),
                    Color.fromARGB(255, 60, 135, 221),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Card(
                color: Colors
                    .transparent, // Fondo transparente para que el degradado sea visible
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              color: expanded
                                  ? Color.fromARGB(255, 242, 238, 238)
                                  : Color.fromARGB(255, 9, 9, 9),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            expanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                    if (expanded)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: content,
                        ),
                      ),
                  ],
                ),
              ),
            )));
  }
}
