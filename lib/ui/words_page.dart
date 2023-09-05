import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/data/getx_controllers/words_controller.dart';
import 'package:practice/data/network/api_service.dart';
import 'package:practice/ui/global_text_fields.dart';

class WordsPage extends StatelessWidget {
  const WordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    WordsController wordsController =
        Get.put(WordsController(apiService: ApiService()));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Word"),
      ),
      body: Stack(
        children: [
          Obx(
            () {
              return ListView(
                children: [
                  SizedBox(height: 50),
                  Row(
                    children: [
                      SizedBox(
                        height: 70,
                        width: 300,
                        child: GlobalTextField(
                          hintText: "Search",
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.search,
                          textAlign: TextAlign.start,
                          onChanged: (v) {},
                          controller: searchController,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            wordsController.getWordsList(searchController.text);
                          },
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  ...List.generate(wordsController.users.length, (index) {
                    return ListTile(
                      leading: IconButton(
                          onPressed: () async {
                            final player = AudioPlayer();
                            await player.play(UrlSource(wordsController
                                .users[index].phonetics[0].audio));
                          },
                          icon: const Icon(Icons.play_arrow)),
                      title: Text(wordsController.users[index].word),
                      subtitle: Text(wordsController
                          .users[index].meanings[0].definitions[0].definition),
                    );
                  })
                ],
              );
            },
          ),
          Align(
            child: Obx(() {
              return Visibility(
                visible: wordsController.isLoading.value,
                child: const CircularProgressIndicator(),
              );
            }),
          )
        ],
      ),
    );
  }
}
