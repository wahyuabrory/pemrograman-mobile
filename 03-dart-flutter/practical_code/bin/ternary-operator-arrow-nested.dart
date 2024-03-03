void main() {
  int age = 15;
  int salary = 60;
  String status;
  status = age >= 18 ? (salary >= 50 ? "Atas" : "Tengah") : "Underage";
  print("Status: $status");
}
