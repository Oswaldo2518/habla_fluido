import 'nivel.dart';

class PreguntaLectura {
  final String enunciado;
  final List<String> opciones;
  final int correcta;

  const PreguntaLectura(this.enunciado, this.opciones, this.correcta);
}

class TextoLectura {
  final String id;
  final String titulo;
  final String texto;
  final NivelCefr nivel;
  final List<PreguntaLectura> preguntas;

  const TextoLectura(
    this.id,
    this.titulo,
    this.texto,
    this.nivel,
    this.preguntas,
  );
}

const catalogoLecturas = <TextoLectura>[
  TextoLectura(
    'l-a1-01',
    'My Morning',
    'Ana lives in Dolores Hidalgo. Every morning she wakes '
        'up at six and drinks coffee. Later, she walks to '
        'school with her friend Luis.',
    NivelCefr.a1,
    [
      PreguntaLectura('What time does Ana wake up?', [
        'At five',
        'At six',
        'At seven',
      ], 1),
      PreguntaLectura('What does Ana drink?', ['Coffee', 'Milk', 'Juice'], 0),
      PreguntaLectura('Who walks with Ana?', [
        'Her mother',
        'Her teacher',
        'Her friend Luis',
      ], 2),
    ],
  ),
  TextoLectura(
    'l-a2-01',
    'A Weekend in Guanajuato',
    'Carlos visited Guanajuato with his family last weekend. '
        'On Sunday, they stayed in a cafe because it rained. '
        'Carlos hopes to return during the summer.',
    NivelCefr.a2,
    [
      PreguntaLectura('Who did Carlos travel with?', [
        'His family',
        'His classmates',
        'Alone',
      ], 0),
      PreguntaLectura('Why did they stay in a cafe?', [
        'They were hungry',
        'It rained',
        'They were tired',
      ], 1),
      PreguntaLectura('When does Carlos want to return?', [
        'In winter',
        'Next week',
        'In the summer',
      ], 2),
    ],
  ),
];

List<TextoLectura> lecturasDeNivel(NivelCefr n) =>
    catalogoLecturas.where((t) => t.nivel == n).toList();
