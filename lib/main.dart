import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class Weather {
  final String city;
  final int temperature;
  final String condition;
  final int humidity;
  final double windSpeed;

  Weather({
    required this.city,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
  });
}

class MyApp extends StatelessWidget {
  final jsonString = '''
    [
      {
        "city": "New York",
        "temperature": 20,
        "condition": "Clear",
        "humidity": 60,
        "windSpeed": 5.5
      },
      {
        "city": "Los Angeles",
        "temperature": 25,
        "condition": "Sunny",
        "humidity": 50,
        "windSpeed": 6.8
      },
      {
        "city": "London",
        "temperature": 15,
        "condition": "Partly Cloudy",
        "humidity": 70,
        "windSpeed": 4.2
      },
      {
        "city": "Tokyo",
        "temperature": 28,
        "condition": "Rainy",
        "humidity": 75,
        "windSpeed": 8.0
      },
      {
        "city": "Sydney",
        "temperature": 22,
        "condition": "Cloudy",
        "humidity": 55,
        "windSpeed": 7.3
      }
    ]
  ''';

  @override
  Widget build(BuildContext context) {
    List<Weather> weatherData = (jsonDecode(jsonString) as List)
        .map((data) => Weather(
      city: data['city'],
      temperature: data['temperature'],
      condition: data['condition'],
      humidity: data['humidity'],
      windSpeed: data['windSpeed'],
    ))
        .toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Information'),
        ),
        body: WeatherList(weatherData: weatherData),
      ),
    );
  }
}

class WeatherList extends StatelessWidget {
  final List<Weather> weatherData;

  WeatherList({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: weatherData.length,
      itemBuilder: (context, index) {
        Weather weather = weatherData[index];
        return Card(
          elevation: 10,
          child: ListTile(
            title: Text(weather.city),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Temperature: ${weather.temperature}°C'),
                Text('Condition: ${weather.condition}'),
                Text('Humidity: ${weather.humidity}%'),
                Text('Wind Speed: ${weather.windSpeed} m/s'),
              ],
            ),
          ),
        );
      },
    );
  }
}
