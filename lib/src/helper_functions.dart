import 'dart:core';
import 'dart:math';



String binIntPart({required String input}) {
    double value = double.parse(input);
    int intDeciPart =
    value.truncate(); // Extracting the integer part of the double
    String binIntPart =
    intDeciPart.toRadixString(2); //Convert the integer part to binary string
    return binIntPart;
  }

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


  String fractCase({required String input}) {
    String binFractPart = deciFractToBinFarct(input: input);
    String intBinPart = binIntPart(input: input);
    String output =
    concatenate(binIntPart: intBinPart, binFractPart: binFractPart);
    //print(' The result is: $output');
    return output;
  }





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



  String octalToDeciConcatenate(
      {required String intDeciPart, required String fractDeciPart}) {
    String output = '$intDeciPart.${fractDeciPart.substring(2)}';
    // print(output);
    return output;
  }













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














