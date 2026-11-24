// =============================================================================
// buttons.dart — LOS BOTONES
// =============================================================================
// Aquí se crean TODOS los botones de la calculadora. Hay dos piezas:
//
//   - CalcButton: UN botón. Es reutilizable: le pasas el texto, el color y
//     qué hacer al pulsarlo, y sirve para cualquier botón.
//
//   - ButtonPad: el teclado completo. Lee la lista "rows" y crea un
//     CalcButton por cada texto de la lista.
// =============================================================================

import 'package:flutter/material.dart';

// Un widget "Stateless" no cambia por sí solo: siempre se dibuja igual con los
// mismos datos.
class CalcButton extends StatelessWidget {
  final String label;
  final Color color;

  // Una función que recibe un String. El botón no sabe qué hace la calculadora:
  // solo avisa "me han pulsado" y entrega su texto.
  final void Function(String) onPressed;

  const CalcButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Expanded: el botón ocupa todo el hueco que le toca en la fila.
    return Expanded(
      // Padding: deja un pequeño espacio alrededor del botón.
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          // () => ... es una función corta que se ejecuta al pulsar.
          onPressed: () => onPressed(label),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Text(label, style: const TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}

class ButtonPad extends StatelessWidget {
  final void Function(String) onPressed;

  const ButtonPad({super.key, required this.onPressed});

  
  final List<List<String>> rows = const [
    ['7', '8', '9', '÷'],
    ['4', '5', '6', '×'],
    ['1', '2', '3', '-'],
    ['C', '0', '.', '+'],
    ['='],
  ];

    Color colorFor(String label) {
    if (label == 'C') {
      return const Color.fromARGB(255, 236, 90, 204);
    } else if (label == '+' || label == '-' || label == '×' ||
        label == '÷' || label == '=') {
      return const Color.fromARGB(255, 206, 132, 216);
    } else {
      return Colors.blueGrey.shade800;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final row in rows)
          // Expanded: cada fila ocupa la misma altura.
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final label in row)
                  CalcButton(
                    label: label,
                    color: colorFor(label),
                    onPressed: onPressed,
                  ),
              ],
            ),
          ),
      ],
    );
  }
}