import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  const StyleText(this.text, {super.key});

  final String text;
  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28.0),
      textAlign: TextAlign.center,
    );
  }
}


//   final String text;
//   @override
//   Widget build(context) {
//     return Column(
//       children: [
//         Text(
//           text,
//           textAlign: TextAlign.left,
//           style: const TextStyle(
//               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28.0),
//         ),
//         // const SizedBox(height: 8),
//         Image.asset('assets/images/dice-1.png'),
//       ],
//     );
//   }
// }
