import 'package:demo_flutter/data/constants.dart';
import 'package:demo_flutter/presentation/feature/weather/weather_bloc.dart';
import 'package:demo_flutter/presentation/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: 'Enter city name',
            ),
            onChanged: (query) {
              context.read<WeatherBloc>().add(OnCityChanged(query));
            },
          ),
          verticalSpacing(32),
          BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherHasData) {
              return Column(
                key: const Key('Weather_Data'),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.result.cityName,
                        style: const TextStyle(fontSize: 22.0),
                      ),
                      Image(
                          image: NetworkImage(
                              Urls.weatherIcon(state.result.iconCode)))
                    ],
                  ),
                  verticalSpacing(12),
                  Text(
                    '${state.result.main} | ${state.result.description}',
                    style: const TextStyle(fontSize: 16.0, letterSpacing: 1.2),
                  ),
                  verticalSpacing(12)
                ],
              );
            } else {
              return Text('');
            }
          })
        ]),
      ),
    );
  }
}
