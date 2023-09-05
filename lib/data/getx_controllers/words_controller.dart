import 'package:get/get.dart';
import 'package:practice/data/model/words_model.dart';
import 'package:practice/data/network/api_service.dart';

class WordsController extends GetxController {
  WordsController({required this.apiService});

  final ApiService apiService;

  late Rx<WordsModel> singleUser;

  RxList<WordsModel> users = <WordsModel>[].obs;
  var isLoading = false.obs;

  getWordsList(String word) async {
    isLoading.value = true;
    List<WordsModel> loadedUsers = await apiService.getWord(word);
    isLoading.value = false;
    if (loadedUsers.isNotEmpty) {
      users.value = loadedUsers;
      singleUser = users[0].obs;
      Get.snackbar("Hi", "Ma'lumot keldi");
    } else {
      //Error
    }
  }
}