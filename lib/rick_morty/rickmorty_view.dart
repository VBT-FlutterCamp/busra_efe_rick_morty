import 'package:flutter/material.dart';
import 'package:rick_and_morty/rick_morty/rickmorty_viewmodel.dart';

class RickMortyView extends RickMortyViewModel {
  @override
  Widget build(BuildContext context) {
    final String titlePage = 'Rick and Morty';

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchAllData();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(titlePage),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: models.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
            child: ListTile(
              leading: Image.network(models[index].image ?? ''),
              title: Text(models[index].name ?? ''),
            ),
          );
        },
      ),
    );
  }
}
