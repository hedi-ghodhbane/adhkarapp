import 'package:adhkarapp/features/categories/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown[800],
        title: Text(
          'الأذكار',
          style: GoogleFonts.amiri(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: BlocConsumer<CategoriesCubit, CategoriesState>(
          listener: (context, state) {
        if (state is CategoriesError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            backgroundColor: Colors.red,
          ));
        }
      }, builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Center(
            child: switch (state) {
              CategoriesLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
              CategoriesLoaded() => GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: state.categories
                      .map((e) => Card(
                              child: Center(
                                  child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              e,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.amiri(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ))))
                      .toList(),
                ),
              CategoriesError() => Text(state.message),
              _ => const SizedBox.shrink()
            },
          ),
        );
      }),
    );
  }
}
