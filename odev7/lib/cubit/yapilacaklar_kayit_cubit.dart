import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/repository/todolist_repo.dart';

class YapilacakKayitCubit extends Cubit<void>{
  YapilacakKayitCubit():super(0);

  var yrepo = ToDoListRepo();

  Future<void> kayit(String yapilacak_is) async{
    await yrepo.yapilacakKayit(yapilacak_is);
  }
}