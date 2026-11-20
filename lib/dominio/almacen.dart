abstract class AlmacenAvance {
  Future<Map<String, Object?>?> cargar();

  Future<void> guardar(Map<String, Object?> datos);
}
