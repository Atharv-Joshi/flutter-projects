import 'package:flutter/material.dart';

class DocumentationTemplate extends StatelessWidget {
  final String label;
  final int? value;
  final String descriptor;
  const DocumentationTemplate({Key? key , required this.label, required this.value, required this.descriptor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              color: Colors.white
          ),
        ),
        Row(
          children: [
            Text(
              value.toString(),
              style: const TextStyle(
                  color: Colors.white
              ),
            ),
            Text(
              descriptor,
              style: const TextStyle(
                  color: Colors.white
              ),
            )
          ],
        ),
      ],
    );
  }
}
