import 'package:flutter/material.dart';
import 'package:sql_davomi_2_dars/models/course_model.dart';

class SearchViewDelegate extends SearchDelegate<List<CourseModel>> {
  List<CourseModel> data;
  SearchViewDelegate(this.data);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(
            Icons.clear,
          ))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, data);
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionList = query.isEmpty
        ? data
        : data.where((element) => element.contains(query)).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              close(context, [suggestionList[index]]);
            },
            title: Text(
              suggestionList[index].toString(),
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? data
        : data.where((element) {
            return element.title.contains(query) ||
                element.description.contains(query) ||
                element.price.contains(query);
          }).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(suggestionList[index].imageUrl),
            onTap: () {
              close(context, [suggestionList[index]]);
            },
            title: Text(
              suggestionList[index].title,
            ),
            subtitle: Text(
              suggestionList[index].price.toString(),
            ),
          );
        });
  }
}
