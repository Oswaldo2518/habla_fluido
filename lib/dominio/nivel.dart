
enum NivelCefr {
  a1, a2, b1, b2, c1;

  String get etiqueta => name.toUpperCase();

  NivelCefr? get siguiente =>
      index + 1 < NivelCefr.values.length
          ? NivelCefr.values[index + 1]
          : null;
}

enum Habilidad {
  escucha('Oído'),
  pronunciacion('Pronunciación'),
  lectura('Lectura'),
  escritura('Escritura'),
  conversacion('Conversación');

  final String nombre;
  const Habilidad(this.nombre);
}
