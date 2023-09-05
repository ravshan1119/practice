import 'package:practice/data/model/meanings_model.dart';

class WordsModel {
  String word;
  String phonetic;
  List<Phonetic> phonetics;
  List<MeaningsModel> meanings;
  TemperaturesLicense license;
  List<dynamic> sourceUrls;

  WordsModel({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });

  static List<WordsModel> getFromList(List? list) {
    return list?.map((e) => WordsModel.fromJson(e)).toList() ?? [];
  }

  factory WordsModel.fromJson(Map<String, dynamic> json) => WordsModel(
        word: json["word"] as String? ?? "",
        phonetic: json["phonetic"],
        phonetics: List<Phonetic>.from(
            json["phonetics"].map((x) => Phonetic.fromJson(x))),
        meanings: List<MeaningsModel>.from(
            json["meanings"].map((x) => MeaningsModel.fromJson(x))),
        license: TemperaturesLicense.fromJson(json["license"]),
        sourceUrls: List<dynamic>.from(json["sourceUrls"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "phonetic": phonetic,
        "phonetics": List<dynamic>.from(phonetics.map((x) => x.toJson())),
        "meanings": List<dynamic>.from(meanings.map((x) => x)),
        "license": license.toJson(),
        "sourceUrls": List<dynamic>.from(sourceUrls.map((x) => x)),
      };
}

class TemperaturesLicense {
  TemperaturesLicense();

  factory TemperaturesLicense.fromJson(Map<String, dynamic> json) =>
      TemperaturesLicense();

  Map<String, dynamic> toJson() => {};
}

class Phonetic {
  String text;
  String audio;
  String sourceUrl;
  PhoneticLicense license;

  Phonetic({
    required this.text,
    required this.audio,
    required this.sourceUrl,
    required this.license,
  });

  factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
        text: json["text"] as String? ?? "",
        audio: json["audio"] as String? ?? "",
        sourceUrl: json["sourceUrl"] as String? ?? "",
        license: PhoneticLicense.fromJson(json["license"]),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "audio": audio,
        "sourceUrl": sourceUrl,
        "license": license.toJson(),
      };
}

class PhoneticLicense {
  String name;
  String url;

  PhoneticLicense({
    required this.name,
    required this.url,
  });

  factory PhoneticLicense.fromJson(Map<String, dynamic> json) =>
      PhoneticLicense(
        name: json["name"] as String? ?? "",
        url: json["url"] as String? ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
