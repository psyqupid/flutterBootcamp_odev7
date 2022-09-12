import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/cubit/yapilacaklar_detay_cubit.dart';
import 'package:odev7/entity/yapilacaklar.dart';

class YapilacakDetaySayfa extends StatefulWidget {
  Yapilacaklar yapilacak;


  YapilacakDetaySayfa({required this.yapilacak});

  @override
  State<YapilacakDetaySayfa> createState() => _YapilacakDetaySayfaState();
}

class _YapilacakDetaySayfaState extends State<YapilacakDetaySayfa> {
  var tfYapilacakIs = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var yapilacak = widget.yapilacak;
    tfYapilacakIs.text = yapilacak.yapilacak_is;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yapilacak İş Detayı"),backgroundColor: Color(0xFF0D0242),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left:50, right: 50, top: 15),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),controller: tfYapilacakIs,decoration: const InputDecoration(hintText: "Yapılacak İş",hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15) ),),
              ElevatedButton(style: ElevatedButton.styleFrom(primary: Color(0xFF0D0242)),onPressed: (){
                context.read<YapilacakDetayCubit>().guncelle(widget.yapilacak.yapilacak_id, tfYapilacakIs.text);
                Navigator.popUntil(context, (Route<dynamic> predicate) => predicate.isFirst);
              },
                  child: const Text("GÜNCELLE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),))
            ],
          ),
        ),
      ),
    );
  }
}
