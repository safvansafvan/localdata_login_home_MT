import 'dart:convert';
import 'dart:developer';

import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:localdataloginandhome/model/movies_list.dart';
import 'package:localdataloginandhome/view/widgets/toast.dart';

class BaseCtrl extends GetxController {
  MovieDetails? movieDetails;
  bool isLoading = false;
  Future<void> getMoviesDetails() async {
    isLoading = true;
    update();
    Uri url = Uri.parse('https://hoblist.com/api/movieList');
    try {
      final response = await http.post(url,
          body: {"category": "movies", "language": "kannada", "genre": "all"});
      if (response.statusCode == 200) {
        log(response.body);
        final result = jsonDecode(response.body);
        if (result['message'] == 'success') {
          messagePopUp('Data Collected');
          movieDetails = MovieDetails.fromJson(result);
          isLoading = false;
          update();
        }
      }
    } catch (e) {
      log(e.toString());
      messagePopUp('Somthing Went Wrong');
      isLoading = false;
      update();
    }
    isLoading = false;
    update();
  }
}
