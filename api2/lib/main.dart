import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';


import 'features/cubit/cubit.dart';
import 'features/data/repo.dart';
import 'features/data/service.dart';
import 'features/page/profile_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // إعداد Dio
    final dio = Dio();

    // إنشاء طبقات البيانات
    final profileService = ProfileService();
    final profileRepository = ProfileRepository();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ProfileCubit(profileRepository),
        child: const ProfileScreen(),
      ),
    );
  }
}
