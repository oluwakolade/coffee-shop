import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Function()? onTap;

  const AppButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFC67C4E),
          ),
          child: Text(
            text,
            style: GoogleFonts.sora(
                color: const Color(0xFFF9F9F9),
                fontWeight: FontWeight.bold,
                fontSize: 16),
            textAlign: TextAlign.center,
          )),
    );
  }
}
