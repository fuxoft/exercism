class AtbashCipher {
  String decode(String text, [int? group_by]) {
    text = text.toLowerCase();
    var result = StringBuffer();
    int out_count = 0;
    for (int ind = 0; ind < text.length; ind++) {
      int asc = text.codeUnitAt(ind);
      if ((48 <= asc && asc <= 57) || (97 <= asc && asc <= 122)) {
        asc = asc >= 97 ? 219 - asc : asc;
        if (out_count > 0 && (out_count % (group_by ?? 999999) == 0)) {
          result.write(" ");
        }
        out_count++;
        result.write(String.fromCharCode(asc));
      }
    }
    return result.toString();
  }
  String encode(text) {
    return decode(text, 5);
  }
}
