import 'dart:convert';

class SavedModel {
  String city;
  String desc;

  SavedModel({
    required this.city,
    required this.desc,
  });

  factory SavedModel.fromJson(Map<String, dynamic> jsonData) {
    return SavedModel(
      city: jsonData['city'],
      desc: jsonData['desc'],
    );
  }

  static Map<String, dynamic> toMap(SavedModel savedModel) => {
        'city': savedModel.city,
        'desc': savedModel.desc,
      };

  static String encode(List<SavedModel> musics) => json.encode(
        musics
            .map<Map<String, dynamic>>((music) => SavedModel.toMap(music))
            .toList(),
      );

  static List<SavedModel> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<SavedModel>((item) => SavedModel.fromJson(item))
          .toList();
}