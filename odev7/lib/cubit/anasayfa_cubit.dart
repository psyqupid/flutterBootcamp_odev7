

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/entity/yapilacaklar.dart';
import 'package:odev7/repository/todolist_repo.dart';

class AnasayfaCubit extends Cubit<List<Yapilacaklar>> {
  AnasayfaCubit(): super(<Yapilacaklar>[]);

  var yrepo = ToDoListRepo();
   Future<void> yapilacaklarYukle() async {
     var liste = await yrepo.yapilacaklariAl();
     emit(liste);

   }

   Future<void> ara(String aramaKelimesi) async {
     var liste = await yrepo.yapilacakAra(aramaKelimesi);
     emit(liste);
   }

   Future<void> sil(int yapilacak_id) async {
     await yrepo.yapilacakSil(yapilacak_id);
     await yapilacaklarYukle();

   }
}