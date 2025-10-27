// Kelas abstrak induk
abstract class Transportasi { // Kelas dasar untuk semua jenis transportasi
  String id, nama; // ID dan nama transportasi
  double _tarifDasar; // Tarif dasar (private)
  int kapasitas; // Kapasitas penumpang

  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas); // Konstruktor

  double get tarifDasar => _tarifDasar; // Getter untuk tarif dasar
  double hitungTarif(int jmlPenumpang); // Method abstrak untuk menghitung tarif
}
// Taksi
class Taksi extends Transportasi { // Subkelas dari Transportasi
  double jarak; // Jarak tempuh

  Taksi(String id, String nama, double tarif, int kapasitas, this.jarak)
      : super(id, nama, tarif, kapasitas); // Konstruktor dengan parameter tambahan jarak

  double hitungTarif(int jmlPenumpang) {
    return tarifDasar * jarak; // Tarif = tarif dasar × jarak
  }
}
// Bus
class Bus extends Transportasi {
  bool adaWifi; // Apakah bus memiliki WiFi

  Bus(String id, String nama, double tarif, int kapasitas, this.adaWifi)
      : super(id, nama, tarif, kapasitas);

  double hitungTarif(int jmlPenumpang) {
    return (tarifDasar * jmlPenumpang) + (adaWifi ? 5000 : 0); // Tambah 5000 jika ada WiFi
  }
}
// Pesawat
class Pesawat extends Transportasi {
  String kelas; // Kelas penerbangan: Ekonomi/Bisnis

  Pesawat(String id, String nama, double tarif, int kapasitas, this.kelas)
      : super(id, nama, tarif, kapasitas);

  double hitungTarif(int jmlPenumpang) {
    double faktor = (kelas == "Bisnis") ? 1.5 : 1.0; // Faktor pengali untuk kelas bisnis
    return tarifDasar * jmlPenumpang * faktor;
  }
}
// Kelas Pemesanan
class Pemesanan {
  String id, namaPelanggan; // ID dan nama pelanggan
  Transportasi t; // Objek transportasi yang dipesan
  int jmlPenumpang; // Jumlah penumpang
  double total; // Total biaya

  Pemesanan(this.id, this.namaPelanggan, this.t, this.jmlPenumpang, this.total);

  void cetakStruk() { // Menampilkan struk pemesanan
    print("================================");
    print("ID Pemesanan : $id");
    print("Nama Pelanggan : $namaPelanggan");
    print("Transportasi : ${t.nama}");
    print("Jumlah Penumpang : $jmlPenumpang");
    print("Total Bayar : Rp$total");
    print("================================\n");
  }
}
// Fungsi global
Pemesanan buatPemesanan(Transportasi t, String nama, int jml) {
  double total = t.hitungTarif(jml); // Hitung total biaya
  // Buat objek pemesanan
  return Pemesanan("P${DateTime.now().millisecondsSinceEpoch}", nama, t, jml, total);
}

void tampilSemua(List<Pemesanan> daftar) {
  print("=== Daftar Semua Pemesanan ===");
  for (var p in daftar) {
    p.cetakStruk(); // Cetak semua struk dalam daftar
  }
}
// Program utama
void main() {
  var taksi = Taksi("T1", "Taksi BlueBird", 10000, 4, 12); // Buat objek taksi
  var bus = Bus("B1", "Bus TransJakarta", 5000, 30, true); // Buat objek bus
  var pesawat = Pesawat("P1", "Garuda Indonesia", 1500000, 180, "Ekonomi"); // Buat objek pesawat
  var daftar = [
    buatPemesanan(taksi, "Andi", 1), // Pemesanan taksi
    buatPemesanan(bus, "Budi", 10), // Pemesanan bus
    buatPemesanan(pesawat, "Citra", 2), // Pemesanan pesawat
  ];
  tampilSemua(daftar); // Tampilkan semua pemesanan
}