import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/data/data.dart';
import 'package:geolocator/geolocator.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeatherEvent>(
      (event, emit) async {
        emit(FetchWeatherLoading());
        try {
          WeatherFactory wf =
              WeatherFactory(API_KEY, language: Language.ENGLISH);
          Weather weather = await wf.currentWeatherByLocation(
              event.position.latitude, event.position.longitude);
          print("here");
          print(weather);
          emit(FetchWeatherSuccess(weather));
        } catch (e) {
          log(e.toString());
          print("here error");

          emit(FetchWeatherError());
        }
      }
    );
  }
}
