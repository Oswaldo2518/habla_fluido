abstract class Voz {
  Future<void> hablar(String texto, {double velocidad = 1.0});

  Future<String?> escuchar({Duration limite = const Duration(seconds: 8)});

  Future<void> detener();
}
