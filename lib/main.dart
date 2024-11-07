import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/di/injection.dart';
import 'package:sample/core/theme/app_theme.dart';
import 'package:sample/core/utils/utils.dart';
import 'package:sample/presentation/blocs/bloc_observer.dart';
import 'package:sample/presentation/blocs/home/home_cubit.dart';
import 'package:sample/presentation/views/splash/splash_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  // disable landscape
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

//DEPENDENCY INJECTION
  await initDependency();
  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => sl<HomeCubit>()..fetch(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      navigatorKey: navigatorKey,
      home: const SplashScreen()
    )
    );
  }
}
