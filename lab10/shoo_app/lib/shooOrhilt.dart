import 'dart:math';
import 'package:flutter/material.dart';

final randomizer = Random();

class ShooOrhilt extends StatefulWidget {
  const ShooOrhilt({super.key});

  @override
  State<ShooOrhilt> createState() => _ShooOrhiltState();
}

class _ShooOrhiltState extends State<ShooOrhilt> {
  int? guess1, guess2;
  int currentDiceRoll = 2;
  String result = '';

  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
      if (guess1 == currentDiceRoll && guess2 == currentDiceRoll) {
        result = 'Хоёулаа зөв таалаа';
      } else if (guess1 == currentDiceRoll) {
        result = '1-р тоглогч яллаа';
      } else if (guess2 == currentDiceRoll) {
        result = '2-р тоглогч яллаа';
      } else {
        result = 'Хэн ч таасангүй';
      }
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Шоо: $currentDiceRoll → $result')));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.rotate(
          angle: pi,
          child: Column(
            children: [
              TextButton(
                onPressed: rollDice,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 28),
                ),
                child: const Text('Шоог орхих'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (i) {
                  final num = i + 1;
                  final selected = guess1 == num;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: TextButton(
                      onPressed: () => setState(() => guess1 = num),
                      style: TextButton.styleFrom(
                        foregroundColor: selected ? Colors.blue : Colors.white,
                        textStyle: const TextStyle(fontSize: 30),
                      ),
                      child: Text('$num'),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        Image.asset('assets/images/dice-$currentDiceRoll.png', width: 200),

        const SizedBox(height: 20),

        Column(
          children: [
            TextButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 28),
              ),
              child: const Text('Шоог орхих'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (i) {
                final num = i + 1;
                final selected = guess2 == num;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: TextButton(
                    onPressed: () => setState(() => guess2 = num),
                    style: TextButton.styleFrom(
                      foregroundColor: selected ? Colors.blue : Colors.white,
                      textStyle: const TextStyle(fontSize: 30),
                    ),
                    child: Text('$num'),
                  ),
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}
