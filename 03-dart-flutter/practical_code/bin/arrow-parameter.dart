void proses(fungsi) {
  print(fungsi(2) + 50);
}

void main() {
//passing fungsi sebagai parameter
  proses((x) => 100 * x); //250
  proses((x) => 100 / x); //100
}
