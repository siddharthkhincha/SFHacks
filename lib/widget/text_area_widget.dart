import 'package:flutter/material.dart';

class TextAreaWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClickedCopy;

  const TextAreaWidget({
    @required this.text,
    @required this.onClickedCopy,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 100,
            decoration: BoxDecoration(border: Border.all()),
            padding: EdgeInsets.all(8),
            alignment: Alignment.center,
            child: SelectableText(
              text.isEmpty ? 'Scan an Image to get text' : text,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
          icon: Icon(Icons.copy),
          onPressed: onClickedCopy,
          color: Colors.grey[200],
        ),
      ],
    );
  }
}
