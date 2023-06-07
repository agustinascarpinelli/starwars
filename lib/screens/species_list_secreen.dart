import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:star_wars/bloc/bloc/swapi_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_drawer.dart';
import 'screens.dart';

class SpeciesListScreen extends StatefulWidget {
  const SpeciesListScreen({Key? key}) : super(key: key);

  @override
  State<SpeciesListScreen> createState() => _SpeciesListScreenState();
}

class _SpeciesListScreenState extends State<SpeciesListScreen> {
  late SwapiBloc swapiBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    swapiBloc=BlocProvider.of<SwapiBloc>(context);
    swapiBloc.add(OnGetSpecies());
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        drawer: const CustomDrawer(),
        body: const _ListViewBuilder());
  }
}

class _ListViewBuilder extends StatelessWidget {
  const _ListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwapiBloc, SwapiState>(
      builder: (context, state) {

        if (state.isLoading){
return const Center(child: CircularProgressIndicator(color: Color(0xFFFF0000)),);
        }
        else if (state.error !="no error" ){
          return _errorMsg(errorMsg:state.error!);
        }
      else  if (state.species != null) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.species!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  selectedColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  leading: Icon(Icons.person),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: Text(
                    state.species![index].name!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xFFFF0000)),
                  ),
                  contentPadding:
                      const EdgeInsets.only(bottom: 40, left: 10, right: 10),
                  subtitle: Column(
                    children: [
                      Row(
                        children: [
                          const Text('Height: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                            '${state.species![index].averageHeight} mts',
                            style: const TextStyle(color: Color(0x75757575)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Classification: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(state.species![index].classification!,
                              style: const TextStyle(color: Color(0x75757575))),
                        ],
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, 'details',
                        arguments: state.species![index]);
                  }, // Contenido del elemento en la posición 'index'
                );
              });
        }
        return Container();
      },
    );
  }
}

class _errorMsg extends StatelessWidget {
  final String errorMsg;
  const _errorMsg({
    super.key, required this.errorMsg,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(border: Border.all(width: 2,color: const Color(0xFFFF0000))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
     
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.warning_amber,color: Color(0xFFFF0000)),
            ),
 
            Flexible(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(errorMsg,overflow: TextOverflow.ellipsis,maxLines: 4),
            )),
          ],
        )),);
  }
}
