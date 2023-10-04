import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List<dynamic> _favoriteBlog = [];
  List<dynamic> get favoriteBlog => _favoriteBlog;

  get blogs => null;

  void toggleFavorite(String blog) async {
    final isExist = _favoriteBlog.contains(blog);

    if (isExist) {
      _favoriteBlog.remove(blog);
    } else {
      _favoriteBlog.add(blog);
    }
    notifyListeners();
  }

  bool isExist(String blog) {
    final isExist = _favoriteBlog.contains(blog);
    return isExist;
  }

  void clearFavorite() {
    _favoriteBlog = [];
    notifyListeners();
  }
}
