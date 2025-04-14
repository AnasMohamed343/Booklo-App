import 'package:booklo/Features/home/data/repos/home_repo_impl.dart';
import 'package:booklo/Features/home/presentation/view_models/newest_books_cubit.dart';
import 'package:booklo/constants.dart';
import 'package:booklo/core/utils/app_router.dart';
import 'package:booklo/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Features/home/presentation/view_models/featured_books_cubit.dart';

void main() {
  setup();
  runApp(const BookLoApp());
}

class BookLoApp extends StatelessWidget {
  const BookLoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
            ..getFeaturedBooks(), //call getFeaturedBooks from FeaturedBooksCubit, ..getFeaturedBooks() means call getFeaturedBooks from FeaturedBooksCubit, instead of call in init state in the screen and must make the screen to statful
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
