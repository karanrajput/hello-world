//
// Textfield Item
//
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

//R

Widget rTextField(
    {TextEditingController controller,
    TextInputType keyboardtype = TextInputType.text,
    String hint = "",
    String label = "",
    Color textColor = Colors.black,
    double fontSize = 16,
    Icon icon,
    double radius = 15,
    int maxLines,
    int maxLength,
    bool obscureText = false,
    Function onSubmit,
    Function onChanged,
    bool isReadOnly = false,
    bool showNextButton = false,
    FocusNode focusNode}) {
  return TextField(
    enabled: !isReadOnly,
    obscureText: obscureText,
    controller: controller,
    keyboardType: keyboardtype,
    onChanged: onChanged,
    readOnly: isReadOnly,
    focusNode: focusNode,
    maxLength: maxLength,
    maxLines: obscureText ? 1 : maxLines,
    textInputAction:
        showNextButton ? TextInputAction.next : TextInputAction.done,
    onSubmitted: onSubmit,
    style: GoogleFonts.poppins(
        fontSize: fontSize, color: textColor, fontWeight: FontWeight.w600),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      labelText: label,
      labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
      hintText: hint,
      hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      alignLabelWithHint: false,
      prefixIcon: icon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        gapPadding: 5,
      ),
    ),
  );
}
