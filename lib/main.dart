import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:star_wars/screens/screens.dart';
import 'package:path_provider/path_provider.dart' show getTemporaryDirectory;


import 'bloc/bloc/swapi_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(   storageDirectory: await getTemporaryDirectory(),);

  runApp(
    BlocProvider<SwapiBloc>(
      create: (context) => SwapiBloc(), // Asegúrate de proporcionar una instancia válida del SwapiBloc aquí
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwapiBloc, SwapiState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.transparent,
            canvasColor: Colors.transparent,
            textTheme: GoogleFonts.orbitronTextTheme(const TextTheme()),
          ),
          initialRoute: 'home',
          routes: {
            'home': (_) => const BackgroundPage(child: HomeScreen()),
            'list': (_) => const BackgroundPage(child: SpeciesListScreen()),
            'details': (_) => const BackgroundPage(child: SpeciesDetailsScreen()),
          },
        );
      },
    );
  }
}