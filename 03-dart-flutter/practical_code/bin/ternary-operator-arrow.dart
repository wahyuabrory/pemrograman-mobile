void main() {
  proses((x) => x > 2 ? x * 10 : x * 2); //berapa hasilnya?
}

void proses(fungsi) {
  print(fungsi(5) + 50);
}
