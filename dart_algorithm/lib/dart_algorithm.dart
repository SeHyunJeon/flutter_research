import 'dart:convert';
import 'dart:math';

String GetSolution(int n, List<String> bans) {
  String? s;
  int cnt = 0;
  bans.forEach((word){
    if(parseBase24StringToDecimal(word) <= n) {
      cnt++;
    }
  });
  int calIndex = n + cnt;
  s = parseDecimalToBase24String(calIndex);
  return s!;
}

int parseBase24StringToDecimal(String s) {
  int result = 0;
  for (int i = 0; i < s.length; i++) {
    int digit = s.codeUnitAt(i) - 'a'.codeUnitAt(0); // 'a' = 0, ..., 'z' = 23
    result = result * 24 + digit;
  }
  return result;
}
String parseDecimalToBase24String(int n) {
  String? s;

  return s!;
}