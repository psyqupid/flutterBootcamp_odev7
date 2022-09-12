import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/cubit/yapilacaklar_kayit_cubit.dart';

class YapilacakKayitSayfa extends StatefulWidget {
  const YapilacakKayitSayfa({Key? key}) : super(key: key);

  @override
  State<YapilacakKayitSayfa> createState() => _YapilacakKayitSayfaState();
}

class _YapilacakKayitSayfaState extends State<YapilacakKayitSayfa> {
  var tfYapilacakIs = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF0D0242),
        title: const Text("Yapılacak Ekle"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left:50, right: 50, top: 15),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15), controller: tfYapilacakIs,decoration: const InputDecoration(hintText: "Yapılacak İş", hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),),
              ElevatedButton(style: ElevatedButton.styleFrom(primary: Color(0xFF0D0242)),onPressed: (){
                context.read<YapilacakKayitCubit>().kayit(tfYapilacakIs.text);
                Navigator.popUntil(context, (Route<dynamic> predicate) => predicate.isFirst);
              }, child: const Text("EKLE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),))
            ],
          ),
        ),
      ),
    );
  }
}
