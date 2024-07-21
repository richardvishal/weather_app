part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class FetchWeatherInitial extends WeatherState {}

class FetchWeatherLoading extends WeatherState {}

class FetchWeatherError extends WeatherState {}

class FetchWeatherSuccess extends WeatherState {
  final Weather weather;

  const FetchWeatherSuccess(this.weather);
  @override
  List<Object> get props => [weather];
}
