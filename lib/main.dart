import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps/presentation/map_bloc/map_cubit.dart';
import 'package:maps/presentation/screens/test.dart';
import 'bloc_observer.dart';
import 'presentation/screens/map_screen.dart';
import 'package:maps/injection_container.dart' as di;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer =MyBlocObserver();
  runApp(const MyApp());
 }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MapCubit>(
      create: (context) =>di.sl< MapCubit>()..determinePosition()
        // ..getAutoCompleteSearch()
      ,
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: MapScreen()),
    );
  }
}
