class WeatherData{
  final String weatherIcon;
  final String weatherDescription;
  final double temperature;
  final double feelsLike;
  final double pressure;
  final double humidity;
  final double windspeed;
  final DateTime sunrise;
  final DateTime sunset;

  const WeatherData({
    required this.weatherIcon,
    required this.weatherDescription,
    required this.temperature,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.windspeed,
    required this.sunrise,
    required this.sunset,
  });
}