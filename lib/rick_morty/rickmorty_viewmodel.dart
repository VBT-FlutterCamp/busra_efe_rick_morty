import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/network/project_network_manager.dart';
import 'package:rick_and_morty/rick_morty/model/character_model.dart';
import 'package:rick_and_morty/rick_morty/rickmorty.dart';

abstract class RickMortyViewModel extends State<RickMorty> {
  final Dio dio = ProjectNetworkManager.instance.dio;

  List<CharacterModel> models = [];

  Future<void> fetchAllData() async {
    final response = await dio.get(ServicePath.CHARACTER.rawValue);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is Map<String, dynamic>) {
        final baseCharacterModel = BaseResponseCharacter.fromJson(data);
        models = baseCharacterModel.results ?? [];
      }
    }

    setState(() {});
  }
}

enum ServicePath { CHARACTER }

extension ServicePathExtension on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.CHARACTER:
        return '/character';
    }
  }
}
