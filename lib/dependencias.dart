
import 'package:http/http.dart' as http;

import 'datos/almacen_avance.dart';
import 'datos/tutor_http.dart';
import 'datos/tutor_simulado.dart';
import 'datos/voz_real.dart';

import 'dominio/almacen.dart';
import 'dominio/tutor.dart';
import 'dominio/voz.dart';

import 'presentacion/vm/aprendizaje_vm.dart';

const _urlTutor = String.fromEnvironment('TUTOR_URL');
const _tokenTutor = String.fromEnvironment('TUTOR_TOKEN');

class Dependencias {
  final TutorIA tutor;
  final Voz voz;
  final AprendizajeViewModel aprendizaje;

  Dependencias(
    this.tutor,
    this.voz,
    this.aprendizaje,
  );

  factory Dependencias.crear({
    TutorIA? tutor,
    Voz? voz,
    AlmacenAvance? almacen,
  }) {
    final TutorIA t = tutor ??
        (_urlTutor.isEmpty
            ? TutorSimulado()
            : TutorHttp(
                Uri.parse(_urlTutor),
                http.Client(),
                tokenApp: _tokenTutor.isEmpty
                    ? null
                    : _tokenTutor,
              ));

    return Dependencias(
      t,
      voz ?? VozReal(),
      AprendizajeViewModel(
        almacen ?? AlmacenAvancePrefs(),
      ),
    );
  }
}
