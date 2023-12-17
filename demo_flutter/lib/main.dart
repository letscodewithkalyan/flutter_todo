import 'package:demo_flutter/presentation/feature/weather/weather_bloc.dart';
import 'package:demo_flutter/presentation/pages/home_page.dart';
import 'package:demo_flutter/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.locator<WeatherBloc>()),
        ],
        child: MaterialApp(
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: AppColors.backgroundColor,
            ),
            debugShowCheckedModeBanner: false,
            home: const HomePage()));
  }
}
