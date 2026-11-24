// =============================================================================
// PRÁCTICA: CALCULADORA
// =============================================================================
// La app tiene tres archivos:
//   - main.dart        -> la pantalla (este archivo)
//   - buttons.dart     -> los botones
//   - calculator.dart  -> la lógica matemática
//
// Busca los comentarios "TODO" y hazlos en orden, del 1 al 12:
//
//   calculator.dart  TODO 1 a 7     -> hacer que calcule
//   buttons.dart     TODO 8, 9, 10  -> ver el teclado completo
//   main.dart        TODO 11, 12    -> conectar los botones con la pantalla
//

// Cada test lleva el número del TODO que comprueba.
// Al terminar todos los TODO, deben pasar todos los tests.
//
// Para ver la app: elige "Chrome (web)" en "Select device" y pulsa F5.
// =============================================================================

import 'package:flutter/material.dart';
import 'buttons.dart';
import 'calculator.dart';

// main() es lo primero que se ejecuta. runApp() arranca la app.
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CalculatorScreen(),
  ));
}

// Un widget "Stateful" puede cambiar mientras la app está abierta.
// Lo necesitamos porque los números de la pantalla cambian al pulsar botones.
class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Un objeto de la clase Calculator (calculator.dart). Guarda la operación.
  final Calculator calculator = Calculator();


  void onButtonPressed(String label) {
    setState(() {
      calculator.press(label);
    });
  }

  // build() dibuja la pantalla. Flutter lo vuelve a llamar después de setState.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // Center + ConstrainedBox: en un navegador ancho, la calculadora no
      // pasa de 400 píxeles de ancho y se queda centrada.
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                // La pantalla ocupa 2 partes de altura y el teclado 5 (flex).
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // -----------------------------------------------------
                        // TODO 12 — Mostrar la operación y el resultado 
                        // -----------------------------------------------------
                        // Ahora los dos textos están vacíos ('').
                        //   - El gris debe mostrar calculator.operation
                        //   - El blanco debe mostrar calculator.result
                        // Prueba también a cambiar tamaños y colores.
                        // -----------------------------------------------------
                        Text(
                          calculator.operation,
                          style: const TextStyle(fontSize: 24, color: Colors.grey),
                        ),
                        // FittedBox: si el número es muy largo, lo hace más
                        // pequeño para que quepa.
                        FittedBox(
                          child: Text(
                            calculator.result,
                            style: TextStyle(fontSize: 48, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  // Le damos al teclado la función que debe llamar al pulsar.
                  child: ButtonPad(onPressed: onButtonPressed),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
