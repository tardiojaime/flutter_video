import 'package:flutter/material.dart';

class AppTheme {
  //ThemeData es una clase en Flutter que define la configuración visual del tema
  // de la aplicación, como colores, fuentes y otros estilos.
  // Brightness es una propiedad que define el brillo general de la interfaz,
  // es decir, si el tema es claro o oscuro
  ThemeData getTheme() => ThemeData(brightness: Brightness.dark);
}
