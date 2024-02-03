import 'package:adhkarapp/core/data/json_loader.dart';
import 'package:adhkarapp/features/categories/categories.dart';
import 'package:adhkarapp/features/categories/cubit/categories_cubit.dart';
import 'package:adhkarapp/features/categories/repositories/categories_repo.dart';
import 'package:adhkarapp/features/favorites/favorites.dart';
import 'package:adhkarapp/features/sebha/sebha.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = PageController();
  int _position = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          BlocProvider<CategoriesCubit>(
            create: (context) =>
                CategoriesCubit(CategoriesRepo(JsonLoader()))..loadCategories(),
            child: const Categories(),
          ),
          Sebha(),
          Favorites(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (position) {
            setState(() {
              _position = position;
            });
            controller.animateToPage(
              position,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          selectedItemColor: Colors.brown[800],
          selectedLabelStyle: GoogleFonts.amiri(fontSize: 15),
          unselectedLabelStyle: GoogleFonts.amiri(),
          currentIndex: _position,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FlutterIslamicIcons.prayer), label: 'الأذكار'),
            BottomNavigationBarItem(
                icon: Icon(FlutterIslamicIcons.tasbih), label: 'السبحة'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'المفضلة'),
          ]),
    );
  }
}
