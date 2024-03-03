void main() {
  for (int i = 0; i < 5; i++) {
    if (i == 1) {
      continue;
    } else if (i == 4) {
      break;
    }
    print(i);
  }
}