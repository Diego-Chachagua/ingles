
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin confirmacion = FlutterLocalNotificationsPlugin();

Future<void> comprobacion() async {
  // Inicializar Flutter Local Notifications
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('logo'); // Cambia 'logo' por el nombre de tu recurso de imagen en la carpeta 'drawable'

  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await confirmacion.initialize(initializationSettings);

  // ... Otras configuraciones o acciones adicionales que desees realizar
}

// Si tienes más código, continúa desde aquí
