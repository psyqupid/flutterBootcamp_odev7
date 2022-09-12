import 'package:flutter/material.dart';
import 'package:odev7/views/anasayfa.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/cubit/anasayfa_cubit.dart';
import 'package:odev7/cubit/yapilacaklar_detay_cubit.dart';
import 'package:odev7/cubit/yapilacaklar_kayit_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> YapilacakDetayCubit()),
        BlocProvider(create: (context) => YapilacakKayitCubit()),
        BlocProvider(create: (context)=> AnasayfaCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFF7883BA)
          
        ),
        home: const Anasayfa(),
      ),
    );
  }
}

