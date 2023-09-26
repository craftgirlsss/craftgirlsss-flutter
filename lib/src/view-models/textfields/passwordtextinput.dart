// import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
// import 'package:flutter/material.dart';

// TextField kTextField(
//     {String? label = "Kata Sandi",
//     TextEditingController? controller,
//     bool? obsecure = true}) {
//   return TextField(
//     controller: controller,
//     obscureText: obsecure!,
//     keyboardType: TextInputType.emailAddress,
//     obscuringCharacter: "*",
//     decoration: InputDecoration(
//       suffix: GestureDetector(
//         onTapDown: inContact, //call this method when incontact
//         onTapUp: outContact,
//         onTap: () {
//           obsecure = !obsecure!;
//           obsecure
//               ? Image.asset('assets/icons/visibility-on.png')
//               : Image.asset('assets/icons/visibility-off.png');
//         },
//       ),
//       filled: true, //<-- SEE HERE
//       labelStyle: title(color: Colors.black, fontSize: 20),
//       labelText: label,
//       fillColor: Colors.white,
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(25.0),
//         borderSide: const BorderSide(
//           color: Colors.black,
//         ),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(25.0),
//         borderSide: const BorderSide(
//           color: Colors.black,
//           width: 1,
//         ),
//       ),
//     ),
//   );
// }
