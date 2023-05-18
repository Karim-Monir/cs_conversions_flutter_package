import 'dart:core';
import 'dart:math';

import 'helper_functions.dart';

class CS {
//===========================decimal to binary==================================

  // String _binIntPart({required String input}) {
  //   double value = double.parse(input);
  //   int intDeciPart =
  //   value.truncate(); // Extracting the integer part of the double
  //   String binIntPart =
  //   intDeciPart.toRadixString(2); //Convert the integer part to binary string
  //   return binIntPart;
  // }

//=========================//

  String deciFractToBinFarct({required String input}) {
//Extract the fractional part of the input string
    List<String> parts = input.split('.');
    double deciFractPart = double.parse('0.${parts[1]}');
    //Convert the fractional part into binary
    String binFractPart = '';
    while (deciFractPart > 0) {
      if (binFractPart.length > 20) {
        // limit the double part of digits in the fractional part to 20
        break;
      }
      deciFractPart *= 2;
      if (deciFractPart >= 1) {
        binFractPart += '1';
        deciFractPart -= 1;
      } else {
        binFractPart += '0';
      }
    }
    return binFractPart;
  }

//=========================//
  String concatenate({required String binIntPart, required String binFractPart}) {
    String output = '$binIntPart.$binFractPart';
    return output;
  }
//=========================//

  String deciToBin({required String input}) {
    if (input.contains('.')) {
      return fractCase(input: input);
    } else {
      return binIntPart(input: input);
    }
  }

//=========================//
  String fractCase({required String input}) {
    String binFractPart = deciFractToBinFarct(input: input);
    String intBinPart = binIntPart(input: input);
    String output =
    concatenate(binIntPart: intBinPart, binFractPart: binFractPart);
    //print(' The result is: $output');
    return output;
  }
//=========================//
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================Decimal To Octal================================

  String deciFractToOctal({required double deciFract}) {
    String octalFract = '';
    while (deciFract != 0.0) {
      deciFract *= 8;
      int digit = deciFract.floor();
      octalFract += digit.toString();
      deciFract -= digit;
    }
    // print(octalFract);
    return octalFract;
  }

//=========================//
  String deciIntToOctal({required String deciIntPart}) {
    double value = double.parse(deciIntPart);
    int deciOctalPart = value.truncate();
    String octalIntPart = deciOctalPart.toRadixString(8);
    // print(octalIntPart);
    return octalIntPart;
  }

//=========================//
  String deciToOctalConcatenate(
      {required String octalInt, required String octalFract}) {
    String output = '$octalInt.$octalFract';
    // print(output);
    return output;
  }
//=========================//

  dynamic deciToOctal({required String input}) {
    if (input.contains('.')) {
      List<String> parts = input.split('.');
      //int deciIntPart = int.parse(parts[0]);
      String octalInt = deciIntToOctal(deciIntPart: parts[0]);
      double deciFractPart = double.parse('0.${parts[1]}');
      String octalFract = deciFractToOctal(deciFract: deciFractPart);
      String output =
      deciToOctalConcatenate(octalInt: octalInt, octalFract: octalFract);
      // print(output);
      return output;
    } else {
      String output = deciIntToOctal(deciIntPart: input);
      return output;
    }
  }
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//=======================Decimal To Hexadecimal=================================

  String deciToHexaConcatenate(
      {required String hexaInt, required String hexaFract}) {
    String output = '$hexaInt.$hexaFract';
    // print(output);
    return output;
  }

//=========================//

  String deciIntToHexa({required String deciIntPart}) {
    double value = double.parse(deciIntPart);
    int deciHexaPart = value.truncate();
    String hexaIntPart = deciHexaPart.toRadixString(16);
    // print(hexaIntPart.toUpperCase());
    return hexaIntPart.toUpperCase();
  }

//=========================//

  String deciFractToHexaFract(
      {required double deciFract, required int precision}) {
    List<String> hexDigits = [];
    int bitCount = 0;

    while (deciFract > 0 && bitCount < precision) {
      deciFract *= 16;
      int digit = deciFract.floor();
      deciFract -= digit;

      hexDigits.add(digit.toRadixString(16));
      bitCount += 1;
    }
    String hexaFractPart = hexDigits.join("").toUpperCase();
    return hexaFractPart;
  }

//=========================//

  String deciToHexa({required String input}) {
    if (input.contains('.')) {
      List<String> parts = input.split('.');
      String hexaInt = deciIntToHexa(deciIntPart: input);
      double deciFractPart = double.parse('0.${parts[1]}');
      int precision = 14;
      String hexaFract =
      deciFractToHexaFract(deciFract: deciFractPart, precision: precision);
      String output =
      deciToHexaConcatenate(hexaInt: hexaInt, hexaFract: hexaFract);
      // print(output);
      return output;
    } else {
      String output = deciIntToHexa(deciIntPart: input);
      // print(output);
      return output;
    }
  }

//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//=======================Binary to Decimal======================================

  String binIntToDeciInt({required String binIntPart}) {
    double value = double.parse(binIntPart);
    String intBinPart = '${value.truncate()}';
    String deciInt = '${int.parse(intBinPart, radix: 2)}';
    // print(deciInt);
    return deciInt;
  }

//=========================//

//Converting the fractional binary part into decimal
  String binFractToDeciFract({required String binaryFraction}) {
    double fractionalDecimal = 0;
    for (int i = 0; i < binaryFraction.length; i++) {
      if (binaryFraction[i] == '1') {
        fractionalDecimal += pow(2, -i - 1);
      }
    }
    String floatingPoint = '0.';
    String deciFract =
    '$fractionalDecimal'.replaceAll(floatingPoint, "").trim();
    return deciFract;
  }

//=========================//

  String binToDeciConcatenate(
      {required String deciInt, required String deciFract}) {
    String output = '$deciInt.$deciFract';
    // print(output);
    return output;
  }

//=========================//

  static String binToDeci({required String input}) {
    if (input.contains('.')) {
      // separate integer and fractional parts
      List<String> parts = input.split('.');
      // String binIntPart = parts[0];
      String deciIntPart = binIntToDeciInt(binIntPart: parts[0]);
      String deciFractPart = binFractToDeciFract(binaryFraction: parts[1]);
      String output =
      binToDeciConcatenate(deciInt: deciIntPart, deciFract: deciFractPart);
      // print(output);
      return output;
    } else {
      String output = binIntToDeciInt(binIntPart: input);
      // print(output);
      return output;
    }
  }

//==============================================================================
//==============================================================================
//=========================Octal To Decimal=====================================

  String octalToDeci({required String input}) {
    if (input.contains('.')) {
      List<String> parts = input.split('.');

      //int integerPart = int.parse(parts[0]);
      double fractionalPart = double.parse('0.${parts[1]}');

      int intDecimalPart = int.parse(parts[0], radix: 8);
      // print(intDecimalPart);

      double decimalFraction =
          int.parse('$fractionalPart'.substring(2), radix: 8) /
              pow(8, '$fractionalPart'.length - 2);
      // print(decimalFraction);

      String output = '$intDecimalPart.${'$decimalFraction'.substring(2)}';
      // print(output);
      return output;
    } else {
      int decimalValue = int.parse(input, radix: 8);
      // print(decimalValue);
      return '$decimalValue';
    }
  }

//=========================//

  String octalToDeciConcatenate(
      {required String intDeciPart, required String fractDeciPart}) {
    String output = '$intDeciPart.${fractDeciPart.substring(2)}';
    // print(output);
    return output;
  }

//==============================================================================
//==============================================================================
//=========================Hexadecimal To Decimal===============================

  String checker({required String input}) {
    if (input.startsWith('-')) {
      input = input.substring(1);
      // print('Positive input hexa: $input');
      if (input.startsWith('0x') || input.startsWith('0X')) {
        input = input.substring(2);
        // print(input);
      }
    } else if (input.startsWith('0x') || input.startsWith('0X')) {
      input = input.substring(2);
      // print(input);
    }
    return input;
  }

//=========================//

  String intHexToDeci({required String intHexPart}) {
    BigInt intDeciPart = BigInt.parse(intHexPart, radix: 16);
    // print(intDeciPart);
    String deciIntPart = '$intDeciPart';
    return deciIntPart;
  }

//=========================//

  String hexFracToDecimal({required String fracHexPart}) {
    double decimalFraction = 0.0;
    fracHexPart = '0.$fracHexPart';
    for (int i = 2; i < fracHexPart.length; i++) {
      int digit = int.parse(fracHexPart[i], radix: 16);
      decimalFraction += digit * pow(16, -(i - 1));
    }
    // print(decimalFraction);
    String deciFrac = '$decimalFraction';
    return deciFrac;
  }

//=========================//

  String hexaToDeci({required String input}) {
    bool isNegative;
    input.startsWith('-') ? isNegative = true : isNegative = false;
    input = checker(input: input);
    List<String> parts = [];
    if (input.contains('.')) {
      parts = input.split('.');
      // print(parts);
      String intDeciPart = intHexToDeci(intHexPart: parts[0]);
      String fracDeciPart = hexFracToDecimal(fracHexPart: parts[1]);
      String output = intDeciPart + fracDeciPart.substring(1);
      if (isNegative) {
        output = '-$output';
        // print(output);
        return output;
      } else {
        // print(output);
        return output;
      }
    } else {
      String intDeciPart = intHexToDeci(intHexPart: input);
      if (isNegative) {
        String output = '-$intDeciPart';
        //print(output);
        return output;
      } else {
        // print(intDeciPart);
        return intDeciPart;
      }
    }
  }

//==============================================================================
//==============================================================================
//=======================Binary To Octal========================================

  String binaryToOctal({required String input}) {
    return deciToOctal(input: binToDeci(input: input));
  }

//==============================================================================
//==============================================================================
//=======================Octal To binary========================================

  String octalToBin({required String input}) {
    return deciToBin(input: octalToDeci(input: input));
  }

//==============================================================================
//==============================================================================
//===================Binary To Hexadecimal======================================

  String binToHexa({required String input}) {
    return deciToHexa(input: binToDeci(input: input));
  }

//==============================================================================
//==============================================================================
//============================Hexadecimal To Binary=============================

  String hexaToBin({required String input}) {
    return deciToBin(input: hexaToBin(input: input));
  }

//==============================================================================
//==============================================================================
//=========================Octal To Hexadecimal=================================

  String octalToHexa({required String input}) {
    return deciToHexa(input: octalToDeci(input: input));
  }

//==============================================================================
//==============================================================================
//==========================Hexadecimal To Octal================================

  String hexaToOctal({required String input}) {
    return deciToOctal(input: hexaToDeci(input: input));
  }

//==============================================================================
//==============================================================================
//==============================================================================
}