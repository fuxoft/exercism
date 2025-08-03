class AtbashCipher {
  String encode0(String text, int group_by) {
    text = text.toLowerCase();
    var result = StringBuffer();
    int out_count = 0;
    for (int ind = 0; ind < text.length; ind++) {
      int asc = text.codeUnitAt(ind);
      if ((48 <= asc && asc <= 57) || (97 <= asc && asc <= 122)) {
        asc = asc >= 97 ? 219 - asc : asc;
        if (out_count > 0 && (out_count % group_by == 0)) {
          result.write(" ");
        }
        out_count++;
        result.write(String.fromCharCode(asc));
      }
    }
    return result.toString();
  }
  
  String encode(text) {
    return encode0(text, 5);
  }
  String decode(text) {
    return encode0(text, 999999);
  }
}
