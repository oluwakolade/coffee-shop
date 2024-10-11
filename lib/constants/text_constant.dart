import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sora(
          color: const Color(0xFF000000),
          fontWeight: FontWeight.bold,
          fontSize: 16),
    );
  }
}

class BodyText extends StatelessWidget {
  final String text;
  const BodyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sora(
          color: const Color(0xFFA2A2A2),
          fontWeight: FontWeight.normal,
          fontSize: 16),
    );
  }
}

class AppText extends StatelessWidget {
  final String text;
  final Color color;
  final double? fontsize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  const AppText(
      {super.key,
      required this.text,
      required this.color,
      required this.fontWeight,
      required this.fontsize,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sora(
          color: color, fontWeight: fontWeight, fontSize: fontsize),
      textAlign: TextAlign.center,
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Coffee Shop",
      style: GoogleFonts.lobster(
          color: const Color(0XFFC67C4E),
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );
  }
}

class ProductTitle extends StatelessWidget {
  final String text;
  final bool softwrap;
  final TextOverflow textOverflow;
  const ProductTitle(
      {super.key,
      required this.text,
      this.softwrap = true,
      this.textOverflow = TextOverflow.clip});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          color: const Color(0xFF000000),
          fontWeight: FontWeight.bold,
          fontSize: 13),
    );
  }
}

class ProductSubTitle extends StatelessWidget {
  final String text;
  final bool softwrap;
  final TextOverflow textOverflow;

  const ProductSubTitle(
      {super.key,
      required this.text,
      this.softwrap = true,
      this.textOverflow = TextOverflow.clip});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          color: const Color(0xFFA2A2A2),
          fontWeight: FontWeight.normal,
          fontSize: 12),
    );
  }
}


// softWrap: true, // Allows text to wrap
//                                   overflow: TextOverflow.clip