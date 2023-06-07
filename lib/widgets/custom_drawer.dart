import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/bloc/bloc/swapi_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final swapiBloc=BlocProvider.of<SwapiBloc>(context);

    
    return  BlocBuilder<SwapiBloc, SwapiState>(
      builder: (context, state) {
        Color onlineColor = state.isConnected ? Colors.red : Colors.white;
        Color offlineColor = state.isConnected ? Colors.white : Colors.red;
        return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          const SizedBox(height: 100,),
          ListTile(
            leading: const Icon(Icons.offline_bolt_outlined,),
            iconColor: offlineColor,
            title: const Text('Offline mode'),
            onTap: () {
               swapiBloc.add(OnChangeConnectivity(false));
            },
          ),
          ListTile(
            leading: const Icon(Icons.online_prediction_outlined),
            title: const Text('Online mode'),
            iconColor: onlineColor,
           
            onTap: () {
                      swapiBloc.add(OnChangeConnectivity(true));
                      swapiBloc.add(OnGetSpecies())
                      ;
            },
          ),
        ],
      ),
    );});
  }
}

