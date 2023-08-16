import 'package:flutter/material.dart';
import 'package:quick_recipe/model/Recipe.dart';

class InstructionItem extends StatelessWidget {
  const InstructionItem({super.key, required this.instruction});

  final Instruction instruction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3),
            child: Text(
              instruction.content,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3),
            child: Text(
              'isOptional? ${instruction.optional ? 'Yes.' : 'No.'}',
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
