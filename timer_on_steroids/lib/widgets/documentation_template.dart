import 'package:flutter/material.dart';

class DocumentationTemplate extends StatelessWidget {
  final String label;
  final int? value;
  final String descriptor;
  const DocumentationTemplate({Key? key , required this.label, required this.value, required this.descriptor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              color: Colors.pinkAccent,
              fontSize: 22,
              letterSpacing: 1,
              fontWeight: FontWeight.bold
          ),
        ),
        Row(
          children: [
            Text(
              value.toString(),
              style: theme.textTheme.subtitle1
            ),
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: Text(
                descriptor,
                style: const TextStyle(
                    color: Colors.grey,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
