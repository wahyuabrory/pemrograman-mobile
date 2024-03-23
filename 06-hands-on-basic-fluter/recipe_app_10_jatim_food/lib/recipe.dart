class Recipe {
  String label;
  String imageUrl;

  int servings;
  List<Ingredient> ingredients;

  Recipe(
    this.label,
    this.imageUrl,
    this.servings,
    this.ingredients,
  );

  static List<Recipe> samples = [
    Recipe('Soto Lamongan', 'assets/sotolamongan.jpg', 4, [
      Ingredient(1, 'potong', 'ayam'),
      Ingredient(200, 'gram', 'bihun'),
      Ingredient(2, 'batang', 'seledri'),
      Ingredient(2, 'batang', 'daun bawang'),
      Ingredient(2, 'butir', 'telur rebus'),
      Ingredient(1, 'batang', 'serai'),
      Ingredient(400, 'gram', 'kentang'),
      Ingredient(400, 'gram', 'tomat'),
      Ingredient(2, 'lembar', 'daun jeruk'),
      Ingredient(1, 'sendok teh', 'merica bubuk'),
      Ingredient(1, 'sendok teh', 'garam'),
      Ingredient(1, 'sendok teh', 'gula'),
      Ingredient(2, 'sendok makan', 'minyak goreng'),
    ]),
    Recipe('Rawon', 'assets/rawon.jpg', 2, [
      Ingredient(250, 'gram', 'daging sapi'),
      Ingredient(1, 'buah', 'kluwek'),
      Ingredient(2, 'batang', 'serai'),
      Ingredient(3, 'lembar', 'daun jeruk'),
      Ingredient(100, 'gram', 'tauge'),
      Ingredient(2, 'buah', 'tomat'),
      Ingredient(2, 'buah', 'kentang'),
      Ingredient(1, 'sendok teh', 'merica bubuk'),
      Ingredient(1, 'sendok teh', 'garam'),
      Ingredient(1, 'sendok teh', 'gula'),
      Ingredient(2, 'sendok makan', 'minyak goreng'),
    ]),
    Recipe('Rujak Cingur', 'assets/rujakcingur.jpg', 1, [
      Ingredient(200, 'gram', 'cingur sapi'),
      Ingredient(2, 'buah', 'cucumber'),
      Ingredient(3, 'buah', 'jeruk'),
      Ingredient(100, 'gram', 'kerupuk'),
      Ingredient(50, 'gram', 'kacang tanah'),
      Ingredient(2, 'buah', 'buah mangga muda'),
      Ingredient(2, 'buah', 'buah kedondong'),
      Ingredient(2, 'buah', 'buah bengkoang'),
      Ingredient(2, 'buah', 'buah belimbing'),
    ]),
    Recipe('Pecel Madiun', 'assets/pecel.jpg', 1, [
      Ingredient(200, 'gram', 'cingur sapi'),
      Ingredient(2, 'buah', 'cucumber'),
      Ingredient(3, 'buah', 'jeruk'),
      Ingredient(100, 'gram', 'kerupuk'),
      Ingredient(50, 'gram', 'kacang tanah'),
      Ingredient(2, 'buah', 'buah mangga muda'),
      Ingredient(2, 'buah', 'buah kedondong'),
      Ingredient(2, 'buah', 'buah bengkoang'),
      Ingredient(2, 'buah', 'buah belimbing'),
    ]),
    Recipe('Lontong Balap', 'assets/lontongbalap.jpg', 2, [
      Ingredient(4, 'buah', 'lontong'),
      Ingredient(200, 'gram', 'tauge'),
      Ingredient(2, 'sendok makan', 'sambal petis'),
      Ingredient(2, 'butir', 'telur rebus'),
      Ingredient(2, 'sendok makan', 'kerupuk bawang'),
      Ingredient(2, 'sendok makan', 'kerupuk udang'),
      Ingredient(2, 'sendok makan', 'taoge goreng'),
    ]),
    Recipe('Sate Madura', 'assets/sate.jpg', 4, [
      Ingredient(400, 'gram', 'daging sapi'),
      Ingredient(20, 'batang', 'tusuk sate'),
      Ingredient(1, 'buah', 'jeruk nipis'),
      Ingredient(100, 'ml', 'bumbu kecap'),
      Ingredient(50, 'gram', 'bawang goreng'),
      Ingredient(2, 'lembar', 'daun jeruk'),
      Ingredient(2, 'batang', 'sereh'),
      Ingredient(3, 'buah', 'tomat'),
      Ingredient(2, 'siung', 'bawang putih'),
    ]),
    Recipe('Bakso Malang', 'assets/baksomalang.jpg', 4, [
      Ingredient(300, 'gram', 'bakso sapi'),
      Ingredient(200, 'gram', 'mie'),
      Ingredient(2, 'buah', 'tahu'),
      Ingredient(2, 'buah', 'telur rebus'),
      Ingredient(100, 'gram', 'kol'),
      Ingredient(2, 'batang', 'seledri'),
      Ingredient(2, 'batang', 'daun bawang'),
      Ingredient(2, 'batang', 'sereh'),
      Ingredient(2, 'lembar', 'daun salam'),
    ]),
    Recipe('Tahu Tek', 'assets/tahutek.jpg', 2, [
      Ingredient(8, 'iris', 'lontong'),
      Ingredient(4, 'buah', 'tahu'),
      Ingredient(2, 'sendok', 'petis'),
      Ingredient(100, 'gram', 'tauge'),
      Ingredient(2, 'butir', 'telur'),
      Ingredient(2, 'buah', 'timun'),
      Ingredient(4, 'batang', 'mentimun'),
      Ingredient(1, 'buah', 'kentang rebus'),
      Ingredient(5, 'buah', 'cabai'),
      Ingredient(2, 'genggam', 'kerupuk')
    ]),
    Recipe('Nasi Krawu', 'assets/nasikrawu.jpg', 1, [
      Ingredient(1, 'piring', 'nasi'),
      Ingredient(100, 'gram', 'daging sapi'),
      Ingredient(1, 'buah', 'telur rebus'),
      Ingredient(1, 'buah', 'lontong'),
      Ingredient(2, 'buah', 'pepes'),
      Ingredient(1, 'batang', 'lemongrass'),
      Ingredient(2, 'lembar', 'daun jeruk'),
      Ingredient(2, 'lembar', 'daun salam'),
      Ingredient(2, 'buah', 'cabe rawit'),
    ]),
    Recipe('Gado-gado', 'assets/gadogado.jpg', 4, [
      Ingredient(200, 'gram', 'kentang'),
      Ingredient(200, 'gram', 'tauge'),
      Ingredient(1, 'ikat', 'kangkung'),
      Ingredient(2, 'buah', 'tahu'),
      Ingredient(2, 'buah', 'tempe'),
      Ingredient(2, 'buah', 'telur rebus'),
      Ingredient(2, 'buah', 'timun'),
      Ingredient(2, 'buah', 'tomat'),
      Ingredient(2, 'buah', 'kentang'),
      Ingredient(4, 'genggam', 'kerupuk'),
      Ingredient(4, 'sendok makan', 'kecap manis'),
      Ingredient(4, 'sendok makan', 'kacang tanah goreng'),
      Ingredient(7, 'buah', 'cabai (opsional)')
    ]),
  ];
}

class Ingredient {
  double quantity;
  String measure;
  String name;

  Ingredient(this.quantity, this.measure, this.name);
}
