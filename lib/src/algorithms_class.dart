import 'dart:core';
import 'dart:math';

import 'helper_functions.dart';

class CS {
//===========================decimal to binary==================================

  
//=========================//

  static String deciToBin({required String input}) {
    if (input.contains('.')) {
      return fractCase(input: input);
    } else {
      return binIntPart(input: input);
    }
  }

//=========================//

//=========================//
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================Decimal To Octal================================
//=========================//

  static String deciToOctal({required String input}) {
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



//=========================//

  static String deciToHexa({required String input}) {
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

  static String octalToDeci({required String input}) {
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
//==============================================================================
//==============================================================================
//=========================Hexadecimal To Decimal===============================


//=========================//

  static String hexaToDeci({required String input}) {
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

  static String binaryToOctal({required String input}) {
    return deciToOctal(input: binToDeci(input: input));
  }

//==============================================================================
//==============================================================================
//=======================Octal To binary========================================

  static String octalToBin({required String input}) {
    return deciToBin(input: octalToDeci(input: input));
  }

//==============================================================================
//==============================================================================
//===================Binary To Hexadecimal======================================

  static String binToHexa({required String input}) {
    return deciToHexa(input: binToDeci(input: input));
  }

//==============================================================================
//==============================================================================
//============================Hexadecimal To Binary=============================

  static String hexaToBin({required String input}) {
    return deciToBin(input: hexaToBin(input: input));
  }

//==============================================================================
//==============================================================================
//=========================Octal To Hexadecimal=================================

  static String octalToHexa({required String input}) {
    return deciToHexa(input: octalToDeci(input: input));
  }

//==============================================================================
//==============================================================================
//==========================Hexadecimal To Octal================================

  static String hexaToOctal({required String input}) {
    return deciToOctal(input: hexaToDeci(input: input));
  }

//==============================================================================
//==============================================================================
//==============================================================================
}