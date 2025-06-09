import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentaura_app/features/chat/domain/emotion.history.model.dart';
import 'package:http/http.dart' as http;

class EmotionRepository {
  final String baseUrl = "http://192.168.1.3:3001/api/v1";

  Future<String> createNewEmotion(EmotionHistoryModel newEmotion) async {
    try {
      final userToken = await FirebaseAuth.instance.currentUser!.getIdToken();
      Map<String, String>? headers = {
        'Authorization': "Bearer ${userToken!}",
        'Content-Type': 'application/json',
      };

      final response = await http.post(Uri.parse("$baseUrl/createemotion"),
          headers: headers, body: jsonEncode(newEmotion.toMap()));
      if (response.statusCode == 201) {
        log("emotion created successfully");
        final responseBody = jsonDecode(response.body);
        final id = responseBody["data"];
        return id;
      } else {
        throw Exception("Failed to create new history ${response.body}");
      }
    } catch (e) {
      log("Error occured when creating new ectivity $e");
      throw Exception("Failed");
    }
  }

  Future<List<EmotionHistoryModel>> getAllEmotionHistory() async {
    try {
      final userToken = await FirebaseAuth.instance.currentUser!.getIdToken();
      Map<String, String>? headers = {
        'Authorization': "Bearer ${userToken!}",
        'Content-Type': 'application/json',
      };

      final response =
          await http.get(Uri.parse("$baseUrl/getemotions"), headers: headers);
      if (response.statusCode == 200) {
        final emotionsHistoryJson = jsonDecode(response.body);
        final emotionHistory = emotionsHistoryJson["data"];

        final allEmotions = (emotionHistory as List)
            .map((singleDoc) => EmotionHistoryModel.fromJson(singleDoc))
            .toList();

        return allEmotions;
      } else {
        return [];
      }
    } catch (e) {
      log("Error occued when getting emotions $e");
      throw Exception("Failed to get emotions");
    }
  }
}
