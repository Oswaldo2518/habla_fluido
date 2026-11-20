import 'nivel.dart';

class Frase {
  final String id;
  final String ingles;
  final String espanol;
  final NivelCefr nivel;
  final String foco;
  final String consejo;

  const Frase(
    this.id,
    this.ingles,
    this.espanol,
    this.nivel,
    this.foco,
    this.consejo,
  );
}

const catalogoFrases = <Frase>[
  Frase(
    'a1-01',
    'Nice to meet you.',
    'Mucho gusto.',
    NivelCefr.a1,
    'Ritmo',
    'Alarga el sonido de las vocales en "meet".',
  ),
  Frase(
    'a1-02',
    'Where is the bathroom?',
    '¿Dónde está el baño?',
    NivelCefr.a1,
    'Entonación',
    'Practica la entonación descendente al preguntar.',
  ),
  Frase(
    'a1-03',
    'I live in Dolores Hidalgo.',
    'Vivo en Dolores Hidalgo.',
    NivelCefr.a1,
    'Sonido "v"',
    'Pronuncia la "v" con dientes y labio inferior.',
  ),
  Frase(
    'a1-04',
    'I would like a coffee, please.',
    'Quisiera un café, por favor.',
    NivelCefr.a1,
    'Contracciones',
    'Practica la contracción "I would" a "I\'d".',
  ),
  Frase(
    'a1-05',
    'The ship is big.',
    'El barco es grande.',
    NivelCefr.a1,
    'Par mínimo ship/sheep',
    'Distingue la vocal corta de "ship" y la larga de "sheep".',
  ),
  Frase(
    'a2-01',
    'I think this is a good idea.',
    'Creo que es una buena idea.',
    NivelCefr.a2,
    'Sonido "th"',
    'Practica la posición de la lengua en "think".',
  ),
  Frase(
    'a2-02',
    'Could you speak more slowly?',
    '¿Podría hablar más despacio?',
    NivelCefr.a2,
    'Palabras funcionales',
    'Une "could you" al hablar de forma natural.',
  ),
  Frase(
    'a2-03',
    'I went to the market yesterday.',
    'Ayer fui al mercado.',
    NivelCefr.a2,
    'Pasado simple',
    'Practica la pronunciación de los verbos en pasado.',
  ),
  Frase(
    'a2-04',
    'She doesn\'t like spicy food.',
    'No le gusta la comida picante.',
    NivelCefr.a2,
    'Tercera persona',
    'Identifica la contracción "doesn\'t".',
  ),
  Frase(
    'b1-01',
    'If I had more time, I would study every day.',
    'Si tuviera más tiempo, estudiaría todos los días.',
    NivelCefr.b1,
    'Condicional',
    'Haz una pausa natural después de la primera idea.',
  ),
  Frase(
    'b1-02',
    'I have been learning English for two years.',
    'He estado aprendiendo inglés por dos años.',
    NivelCefr.b1,
    'Presente perfecto continuo',
    'Practica la unión de "have been" al hablar.',
  ),
  Frase(
    'b1-03',
    'Despite the rain, we enjoyed the festival.',
    'A pesar de la lluvia, disfrutamos el festival.',
    NivelCefr.b1,
    'Conectores',
    'Destaca las sílabas acentuadas de cada palabra.',
  ),
];

List<Frase> frasesDeNivel(NivelCefr n) =>
    catalogoFrases.where((f) => f.nivel == n).toList();
