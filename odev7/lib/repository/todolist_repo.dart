import 'package:odev7/entity/yapilacaklar.dart';
import 'package:odev7/sqlite/veritabani_yardimcisi.dart';

class ToDoListRepo {
  Future<void> yapilacakKayit(String yapilacak_is) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var yapilacaklar = Map<String,dynamic>();
    yapilacaklar["yapilacak_is"] = yapilacak_is;
    await db.insert("yapilacaklar", yapilacaklar);
  }

  Future<void> yapilacakGuncelle(int yapilacak_id, String yapilacak_is) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var yapilacaklar = Map<String,dynamic>();
    yapilacaklar["yapilacak_is"] = yapilacak_is;

    await db.update("yapilacaklar", yapilacaklar, where: "yapilacak_id = ?", whereArgs: [yapilacak_id]);
  }
  
  Future<List<Yapilacaklar>> yapilacaklariAl() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM yapilacaklar");

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Yapilacaklar(yapilacak_id: satir["yapilacak_id"], yapilacak_is: satir["yapilacak_is"]);
    });
  }

  Future<List<Yapilacaklar>> yapilacakAra(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM yapilacaklar WHERE yapilacak_is like '%$aramaKelimesi%'");

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Yapilacaklar(yapilacak_id: satir["yapilacak_id"], yapilacak_is: satir["yapilacak_is"]);
    });
  }

  Future<void> yapilacakSil(int yapilacak_id) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("yapilacaklar", where: "yapilacak_id = ?", whereArgs: [yapilacak_id]);
  }

}