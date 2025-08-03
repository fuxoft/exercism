class Etl {
  transform (orig) {
    Map<String,int> result = {};
    orig.forEach((String numString, List<String> upperChars) {
      upperChars.forEach((upperChar) {
        result[upperChar.toLowerCase()] = int.parse(numString);
      });
    });
    return result;
  }
}
