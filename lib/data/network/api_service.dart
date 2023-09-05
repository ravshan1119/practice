import 'package:dio/dio.dart';
import 'package:practice/data/model/words_model.dart';


class ApiService {
  Dio dio = Dio();

  Future<List<WordsModel>> getWord(String word) async {
    Response response = await dio.get("https://api.dictionaryapi.dev/api/v2/entries/en/$word");
    try {
      if (response.statusCode == 200) {
        return WordsModel.getFromList(response.data as List?);
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}