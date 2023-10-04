import 'dart:convert';

import 'package:blogging_app/model/blog.dart';
import 'package:http/http.dart' as http;

class BlogService {
  Future<List<Blog>> getAll() async {
    const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    const String adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    final uri = Uri.parse(url);
    final response =
        await http.get(uri, headers: {'x-hasura-admin-secret': adminSecret});

    try {
      if (response.statusCode == 200) {
        // Request successful, handle the response data here
        final body = response.body;
        final json = jsonDecode(body) as List;

        final blogs = json.map((e) {
          return Blog(
            imageUrl: e['imageUrl'],
            titleText: e['titleText'],
          );
        }).toList();
        print('Response data: ${response.body}');
        return blogs;
      } else {
        // Request failed

        print('Request failed with status code: ${response.statusCode}');
        print('Response data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return [];
  }
}

// try {
// } catch (e) {
// // Handle any errors that occurred during the request
// print('Error: $e');
// }
