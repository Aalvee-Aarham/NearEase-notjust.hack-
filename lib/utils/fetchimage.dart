import 'dart:convert';
import 'package:http/http.dart' as http;

final String apiKey =
    'HgnN0LqrYRPgQ2pF6D2sG9HIL4xBEL8uFjBMvNYI6HAdkn8P4at8GYhm';

Future<String> fetchImages(String searchTerm) async {
  final String apiUrl =
      'https://api.pexels.com/v1/search?query=$searchTerm&per_page=10';

  final response = await http.get(Uri.parse(apiUrl), headers: {
    'Authorization': apiKey,
  });

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> photos = data['photos'];
    var imageUrls = photos.map((photo) => photo['src']['tiny']).toList();
    return imageUrls[0];
  } else {
    // Handle error
    print('Error: ${response.reasonPhrase}');
    return "";
  }
}
