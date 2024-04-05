import 'package:dio/dio.dart';
import 'weather_model.dart';

// lat=55.75&lon=37.61&lang=ru&units=metric&appid=056af9fa1974d894ac906184eb6de7e8

class WeatherService {
  final Dio _dio = Dio();
  final api_key = '056af9fa1974d894ac906184eb6de7e8';

  Future<WeatherResponse> fetchWeather() async {
    try {
      final response = await _dio.get(
        'https://api.openweathermap.org/data/2.5/weather', 
        queryParameters: {
          'lat': 55.75,
          'lon': 37.61,
          'units': 'metric',
          'lang': 'ru',
          'appid': api_key,
        },
        );
      return WeatherResponse.fromJson(response.data);
    } catch (error) {
      throw Exception("Failed to load data: $error");
    }
  }
}