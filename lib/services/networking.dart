import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:clima/services/location.dart';

class NetworkHelper{


Future<String> getWeatherData() async{

String apiKey = 'b3166391067e8006cb8723278f603d92';  
  
GetLocation loca = GetLocation();
await loca.getLocation();

var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${loca.latitude}&lon=${loca.longitude}&appid=$apiKey&units=metric');
http.Response response = await http.get(url);
if(response.statusCode == 200){
String data = response.body;
return data;


}
else{print(response.statusCode);}
throw 'ERROR! code not 200';

}
//!This function updates the data for manuall city searches
Future<String> getCitySearch({required cityname}) async{

String apiKey = 'b3166391067e8006cb8723278f603d92';  
  
var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apiKey&units=metric');
http.Response response = await http.get(url);
if(response.statusCode == 200){
String data = response.body;
return data;


}
else{print(response.statusCode);}
throw 'ERROR! code not 200';

}

}

