void main() {

  print(highestPalindrome("3943", 1));    
  print(highestPalindrome("932239", 2));   
  print(highestPalindrome("123", 1));  
  
}

String highestPalindrome(String s, int k) {
  List<String> chars = s.split('');
  List<bool> changed = List.filled(chars.length, false);

  int used = _makePalindrome(chars, changed, 0, chars.length - 1);
  if (used > k) return "-1";
  _maximize(chars, changed, 0, chars.length - 1, k - used);
  return chars.join();
}

int _makePalindrome(
  List<String> chars,
  List<bool> changed,
  int left,
  int right,
) {
  if (left >= right) return 0;

  int used = _makePalindrome(chars, changed, left + 1, right - 1);

  if (chars[left] != chars[right]) {
    if (chars[left].compareTo(chars[right]) > 0) {
      chars[right] = chars[left];
      changed[right] = true;
    } else {
      chars[left] = chars[right];
      changed[left] = true;
    }
    return used + 1;
  }

  return used;
}

void _maximize(
  List<String> chars,
  List<bool> changed,
  int left,
  int right,
  int k,
) {
  if (left > right || k <= 0) return;

  if (chars[left] != '9') {
    int cost = (changed[left] || changed[right]) ? 1 : 2;

    if (k >= cost) {
      chars[left] = '9';
      chars[right] = '9';
      k -= cost;
    }
  }

  _maximize(chars, changed, left + 1, right - 1, k);
}
