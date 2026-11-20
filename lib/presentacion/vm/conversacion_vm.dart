
import 'package:flutter/foundation.dart';

import '../../dominio/excepciones.dart';
import '../../dominio/nivel.dart';
import '../../dominio/tutor.dart';
import '../../dominio/voz.dart';
import 'aprendizaje_vm.dart';

class ConversacionViewModel extends ChangeNotifier {
  static const int maxCaracteres = 500;

  final TutorIA _tutor;
  final Voz _voz;
  final AprendizajeViewModel _aprendizaje;

  ConversacionViewModel(
    this._tutor,
    this._voz,
    this._aprendizaje,
  );

  final List<Mensaje> historial = [];
  List<Correccion> ultimasCorrecciones = [];

  bool ocupado = false;
  bool autoVoz = true;

  String? error;
  String? textoNoEnviado;

  void iniciar() {
    if (historial.isEmpty) {
      historial.add(
        const Mensaje(
          false,
          "Hi! I'm your English tutor. How was your day?",
        ),
      );

      notifyListeners();
    }
  }

  void alternarAutoVoz() {
    autoVoz = !autoVoz;
    notifyListeners();
  }

  static double puntajeTurno(int correcciones) =>
      (1 - 0.25 * correcciones)
          .clamp(0.0, 1.0)
          .toDouble();

  Future<void> enviar(String texto) async {
    if (ocupado) return;

    final t = texto.trim();

    if (t.isEmpty) return;

    if (t.length > maxCaracteres) {
      error =
          'Escribe un mensaje más corto (máximo $maxCaracteres caracteres).';
      notifyListeners();
      return;
    }

    ocupado = true;
    error = null;
    textoNoEnviado = null;

    historial.add(Mensaje(true, t));
    notifyListeners();

    try {
      final r = await _tutor.conversar(
        nivel: _aprendizaje.nivel,
        historial: List.unmodifiable(historial),
      );

      final pregunta = r.siguientePregunta;

      final dicho = pregunta == null
          ? r.respuesta
          : '${r.respuesta} $pregunta';

      historial.add(Mensaje(false, dicho));

      ultimasCorrecciones = r.correcciones;

      await _aprendizaje.registrarIntento(
        Habilidad.conversacion,
        puntajeTurno(r.correcciones.length),
      );

      if (autoVoz) {
        try {
          await _voz.hablar(dicho);
        } catch (_) {
          // Si falla la voz, la respuesta textual permanece.
        }
      }
    } catch (e) {
      historial.removeLast();
      textoNoEnviado = t;
      error = mensajeSeguro(e);
    }

    ocupado = false;
    notifyListeners();
  }

  Future<void> dictar() async {
    if (ocupado) return;

    try {
      final dicho = await _voz.escuchar();

      if (dicho == null || dicho.trim().isEmpty) {
        error = 'No te escuché. Inténtalo de nuevo.';
        notifyListeners();
        return;
      }

      await enviar(dicho);
    } catch (e) {
      error = mensajeSeguro(e);
      notifyListeners();
    }
  }
}
