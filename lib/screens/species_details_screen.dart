import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/models/models.dart';
import 'package:star_wars/services/swapi_service.dart';
import 'package:star_wars/widgets/widgets.dart';
import '../bloc/bloc/swapi_bloc.dart';

class SpeciesDetailsScreen extends StatelessWidget {
  const SpeciesDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final species = ModalRoute.of(context)!.settings.arguments as Species;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        endDrawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                AnimatedTextKit(repeatForever: true, animatedTexts: [
                  TypewriterAnimatedText(
                    species.name!,
                    textStyle: const TextStyle(
                        fontSize: 30,
                        color: Color(0xFFFF0000),
                        fontWeight: FontWeight.bold,
                        wordSpacing: 5),
                    speed: const Duration(milliseconds: 200),
                  ),
                ]),
                const SizedBox(
                  height: 50,
                ),
                _Details(
                    labelDetail: 'Hair color : ',
                    labelDetailValue: species.hairColors!),
                const SizedBox(height: 40),
                _Details(
                    labelDetail: 'Eye color : ',
                    labelDetailValue: species.eyeColors!),
                const SizedBox(height: 40),
                _Details(
                    labelDetail: 'Planet : ',
                    labelDetailValue: species.homeworld!),
                const SizedBox(height: 50),
                _Details(
                    labelDetail: 'Skin color : ',
                    labelDetailValue: species.designation.toString()),
                const SizedBox(height: 40),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Ajusta el radio según tus necesidades
                    ),
                    color: const Color(0xFFFF0000),
                    child: const Text(
                      'Report',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onPressed: () async {
                      final swapiBloc = BlocProvider.of<SwapiBloc>(context);
                      final state = swapiBloc.state;

                      if (state.isConnected) {
                        final Option<Map<String, dynamic>> report =
                            await SwapiService().createReport(species);

                        report.fold(
                            () => {
                                  customAlert(
                                      context,
                                      'Error',
                                      const Icon(Icons.warning_amber_outlined),
                                      'There was a problem with the report.Try again later',
                                      () {
                                    Navigator.pop(context);
                                  })
                                },
                            (r) => {
                                  customAlert(
                                      context,
                                      'Report succeed',
                                      const Icon(Icons.done),
                                      'The species ${species.name} has been successfully reported',
                                      () {
                                    Navigator.pushNamed(context, 'list');
                                  })
                                });
                      } else {
                        customAlert(
                            context,
                            'Error',
                            const Icon(Icons.warning_amber_outlined),
                            'Internet connection must be active', () {
                          Navigator.pop(context);
                        });
                      }
                    })
              ],
            ),
          ),
        ));
  }
}

class _Details extends StatelessWidget {
  final String labelDetail;
  final String labelDetailValue;
  const _Details({
    required this.labelDetail,
    required this.labelDetailValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          labelDetail,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              labelDetailValue,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: const TextStyle(color: Color(0x75757575)),
            ),
          ),
        ),
      ],
    );
  }
}
