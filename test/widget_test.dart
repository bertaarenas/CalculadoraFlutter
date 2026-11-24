// =============================================================================
// TESTS — NO HACE FALTA TOCAR ESTE ARCHIVO
// =============================================================================
// Los tests comprueban tu código de forma automática. Ejecútalos con:
//     flutter test
//
// Al principio fallarán casi todos. Cada test lleva en su nombre el número
// del TODO que comprueba. Cuando termines todos los TODO, deben pasar.
// Si uno falla, lee el mensaje: "Expected" es lo que debería salir y
// "Actual" es lo que sale con tu código.
// =============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calc/calculator.dart';
import 'package:calc/main.dart';

// Pulsa las teclas separadas por espacios y devuelve la calculadora.
// Ejemplo: run('2 + 3 =') pulsa '2', '+', '3' y '='.
Calculator run(String keys) {
  final calculator = Calculator();
  for (final key in keys.split(' ')) {
    calculator.press(key);
  }
  return calculator;
}

void main() {
  test('TODO 1, 3 y 4: escribir números', () {
    expect(run('1 2').first, '12');
    expect(run('1 . 5 .').first, '1.5');
  });

  test('TODO 2: borrar', () {
    expect(run('1 2 C').first, '');
  });

  test('TODO 5a: elegir operador', () {
    expect(run('+').operator, '');
    expect(run('2 +').operator, '+');
    expect(run('2 + ×').operator, '×');
    expect(run('1 + 2 3').second, '23');
  });

  test('TODO 6: calcular', () {
    expect(run('2 + 3 =').result, '5');
    expect(run('9 - 1 2 =').result, '-3');
    expect(run('4 × 2 . 5 =').result, '10');
    expect(run('1 ÷ 4 =').result, '0.25');
    expect(run('5 ÷ 0 =').result, 'Error');
    expect(run('5 ÷ 0 = 7').first, '7');
    expect(run('2 + 3 = 7').first, '7');
  });

  test('TODO 5b y 5c: seguir con el resultado', () {
    expect(run('2 + 3 = × 4 =').result, '20');
    expect(run('2 + 3 × 4 =').result, '20');
  });

  test('TODO 7: operación completa', () {
    expect(run('1 2 + 3').operation, '12 + 3');
    expect(run('1 2 + 3 =').operation, '12 + 3 =');
    expect(run('2 + 3 = 7').operation, '7');
  });

  testWidgets('TODO 8 a 12: la app completa', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CalculatorScreen()));
    for (final key in ['7', '×', '6', '=']) {
      await tester.tap(find.widgetWithText(ElevatedButton, key));
    }
    await tester.pump();
    expect(find.text('42'), findsOneWidget);
    expect(find.text('7 × 6 ='), findsOneWidget);
  });
}
