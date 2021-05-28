// //
// // Textfield Item

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// //R

// Widget emailfield(
//     {TextEditingController controller,
//     TextInputType keyboardtype = TextInputType.text,
//     String hint = "",
//     String label = "",
//     Color textColor = Colors.black,
//     double fontSize = 16,
//     Icon icon,
//     double radius = 15,
//     int maxLines,
//     int maxLength,
//     bool obscureText = false,
//     Function onSubmit,
//     Function onChanged,
//     bool isReadOnly = false,
//     bool showNextButton = false,
//     FocusNode focusNode}) {
//   return Form(
//     autovalidateMode: AutovalidateMode.always,
//     child: Column(
//       children: [
//         TextFormField(
//           validator: (value) => EmailValidator.validate(value)
//               ? null
//               : "Please enter a valid email",
//         ),
//       ],
//     ),
//   );
// }
