import 'package:design_system_weincode/foundations/themes/weincode_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clean_arc_flutter/config/providers/astronomy_daily_data_provider.dart';
import 'package:clean_arc_flutter/config/providers/pokemon_provider.dart';
import 'package:clean_arc_flutter/config/routes/app_routes.dart';
import 'package:clean_arc_flutter/ui/pages/home_page.dart';
import 'package:clean_arc_flutter/ui/pages/pokemon_page.dart';

import '../ui/pages/show_dayli_data.dart';



class CleanArchExampleSepareteUsingFolderApp extends ConsumerWidget {
  const CleanArchExampleSepareteUsingFolderApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ligthThemeWeincode,
      onGenerateRoute: (routeSetting) {
        switch (routeSetting.name) {
          case (AppRoutes.pokemon):
            return MaterialPageRoute(
                builder: ((context) => PokemonPage(
                      pokemonDetailList:
                          ref.watch(pokemonProvider).getAllPokemons(),
                    )));
          case (AppRoutes.astronomyDailyData):
            return MaterialPageRoute(
                builder: ((context) => ShowDailyDataPage(
                  astronomyDailyData: ref.watch(astronomyDailyDataProvider).getAstronomydailyData(),
                    )));
          default:
            return MaterialPageRoute(builder: ((context) => const HomePage()));
        }
      },
    );
  }
}
