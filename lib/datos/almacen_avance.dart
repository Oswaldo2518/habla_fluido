
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../dominio/almacen.dart';

class AlmacenAvanceMemoria implements AlmacenAvance {
  Map<String, Object?>? _datos;

  @override
  Future<Map<String, Object?>?> cargar() async => _datos;

  @override
  Future<void> guardar(Map<String, Object?> datos) async {
    _datos = (jsonDecode(jsonEncode(datos)) as Map)
        .cast<String, Object?>();
  }
}

class AlmacenAvancePrefs implements AlmacenAvance {
  static const _clave = 'avance_v1';

  @override
  Future<Map<String, Object?>?> cargar() async {
    final prefs = await SharedPreferences.getInstance();
    final texto = prefs.getString(_clave);

    if (texto == null) return null;

    try {
      return (jsonDecode(texto) as Map)
          .cast<String, Object?>();
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> guardar(
    Map<String, Object?> datos,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_clave, jsonEncode(datos));
  }
}
