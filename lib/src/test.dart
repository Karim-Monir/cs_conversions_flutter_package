// class Cs{

//   String deciFractToOctal({required double deciFract}) {
//     String octalFract = '';
//     while (deciFract != 0.0) {
//       deciFract *= 8;
//       int digit = deciFract.floor();
//       octalFract += digit.toString();
//       deciFract -= digit;
//     }
//     // print(octalFract);
//     return octalFract;
//   }

// //=========================//
//   String deciIntToOctal({required String deciIntPart}) {
//     double value = double.parse(deciIntPart);
//     int deciOctalPart = value.truncate();
//     String octalIntPart = deciOctalPart.toRadixString(8);
//     // print(octalIntPart);
//     return octalIntPart;
//   }

// //=========================//
//   String deciToOctalConcatenate(
//       {required String octalInt, required String octalFract}) {
//     String output = '$octalInt.$octalFract';
//     // print(output);
//     return output;
//   }
// //=========================//

//   dynamic deciToOctal({required String input}) {
//     if (input.contains('.')) {
//       List<String> parts = input.split('.');
//       //int deciIntPart = int.parse(parts[0]);
//       String octalInt = deciIntToOctal(deciIntPart: parts[0]);
//       double deciFractPart = double.parse('0.${parts[1]}');
//       String octalFract = deciFractToOctal(deciFract: deciFractPart);
//       String output =
//       deciToOctalConcatenate(octalInt: octalInt, octalFract: octalFract);
//       // print(output);
//       return output;
//     } else {
//       String output = deciIntToOctal(deciIntPart: input);
//       return output;
//     }
//   }
// }



// class Cs {
//   static String _deciFractToOctal({required double deciFract}) {
//     String octalFract = '';
//     while (deciFract != 0.0) {
//       deciFract *= 8;
//       int digit = deciFract.floor();
//       octalFract += digit.toString();
//       deciFract -= digit;
//     }
//     // print(octalFract);
//     return octalFract;
//   }

//   static String _deciIntToOctal({required String deciIntPart}) {
//     double value = double.parse(deciIntPart);
//     int deciOctalPart = value.truncate();
//     String octalIntPart = deciOctalPart.toRadixString(8);
//     // print(octalIntPart);
//     return octalIntPart;
//   }

//   static String _deciToOctalConcatenate(
//       {required String octalInt, required String octalFract}) {
//     String output = '$octalInt.$octalFract';
//     // print(output);
//     return output;
//   }

//   static String deciToOctal({required String input}) {
//     if (input.contains('.')) {
//       List<String> parts = input.split('.');
//       String octalInt = _deciIntToOctal(deciIntPart: parts[0]);
//       double deciFractPart = double.parse('0.${parts[1]}');
//       String octalFract = _deciFractToOctal(deciFract: deciFractPart);
//       String output =
//           _deciToOctalConcatenate(octalInt: octalInt, octalFract: octalFract);
//       // print(output);
//       return output;
//     } else {
//       String output = _deciIntToOctal(deciIntPart: input);
//       return output;
//     }
//   }
// }




import 'package:cs_conversions/cs_conversions.dart';

void main(List<String> args) {
  // Cs.deciToOctal(input: '123456');

print(cs.deciToBin(input: "10"));


}