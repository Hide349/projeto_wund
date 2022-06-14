import 'package:flutter/material.dart';

headerWidget(String nome) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    const CircleAvatar(
      radius: 50,
    ),
    const SizedBox(
      width: 20,
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nome,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  ]);
}
