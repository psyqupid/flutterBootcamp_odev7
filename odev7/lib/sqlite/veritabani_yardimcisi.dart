import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class VeritabaniYardimcisi {
  static final String veritabaniAdi = "todolist.sqlite";

  static Future<Database> veritabaniErisim() async{
    String veritabaniYolu = join(await getDatabasesPath(),veritabaniAdi);

    if (await databaseExists(veritabaniYolu)){
      print("veri tabanı var");
    }else{
      ByteData data = await rootBundle.load("veritabani/$veritabaniAdi");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(veritabaniYolu).writeAsBytes(bytes,flush: true);
      print("veri tabanı kopyalandı");
    }

    return openDatabase(veritabaniYolu);
  }
}