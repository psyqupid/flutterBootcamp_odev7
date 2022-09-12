import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/cubit/anasayfa_cubit.dart';
import 'package:odev7/entity/yapilacaklar.dart';
import 'package:odev7/views/yapilacaklar_detay.dart';
import 'package:odev7/views/yapilacaklar_kayit.dart';


class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AnasayfaCubit>().yapilacaklarYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0D0242),
          title: aramaYapiliyorMu ?
          TextField(style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),decoration: const InputDecoration(hintText: "Ara", hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
            onChanged: (aramaSonucu){
              context.read<AnasayfaCubit>().ara(aramaSonucu);
            },):
          const Text("Yapılacaklar"),
          actions: [
            aramaYapiliyorMu ?
            IconButton(onPressed: (){
              setState(() {aramaYapiliyorMu = false;});
              context.read<AnasayfaCubit>().yapilacaklarYukle();
            }, icon: const Icon(Icons.clear)) :
            IconButton(onPressed: (){
              setState(() {aramaYapiliyorMu =true;});
            }, icon: const Icon(Icons.search)),
          ],
        ),
        body: BlocBuilder<AnasayfaCubit,List<Yapilacaklar>>(
          builder: (context,yapilcakListesi){
            if(yapilcakListesi.isNotEmpty){
              return ListView.builder(itemCount: yapilcakListesi.length,
                  itemBuilder: (context,index){
                var yapilacak = yapilcakListesi[index];
                return GestureDetector(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>YapilacakDetaySayfa(yapilacak: yapilacak))).then((value) {
                    context.read<AnasayfaCubit>().yapilacaklarYukle();
                  });},
                  child: Card(
                    color: Color(0xFF1D058B),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("${yapilacak.yapilacak_is}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                          const Spacer(),
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar
                                  (content: Text("${yapilacak.yapilacak_is} silinecek."),
                                action: SnackBarAction(label: "OK", onPressed: (){context.read<AnasayfaCubit>().sil(yapilacak.yapilacak_id);},
                                ),
                                )

                            );
                          }, icon: const Icon(Icons.delete_outline_outlined, color: Colors.white,)),
                        ],
                      ),
                    ),
                  ),
                );
                  }
                  );

            }else{
              return const Center();

            }
          },
        ),
    floatingActionButton: FloatingActionButton(backgroundColor: Color(0xFF0D0242),
    child: const Icon(Icons.add),
    onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const YapilacakKayitSayfa())).then((value) {
      context.read<AnasayfaCubit>().yapilacaklarYukle();
    });
    }),
    );
  }
  }

