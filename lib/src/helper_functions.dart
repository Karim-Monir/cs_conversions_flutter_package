String binIntPart({required String input}) {
    double value = double.parse(input);
    int intDeciPart =
    value.truncate(); // Extracting the integer part of the double
    String binIntPart =
    intDeciPart.toRadixString(2); //Convert the integer part to binary string
    return binIntPart;
}

