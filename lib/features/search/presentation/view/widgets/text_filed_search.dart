import 'package:flutter/material.dart';

class TextFiledSearch extends StatefulWidget {
  const TextFiledSearch({super.key});

  @override
  State<TextFiledSearch> createState() => _TextFiledSearchState();
}

class _TextFiledSearchState extends State<TextFiledSearch> {
  late TextEditingController searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchTextController,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey.shade700,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            searchTextController.clear();
            FocusScope.of(context).unfocus();
          },
          child: const Icon(
            Icons.clear,
            color: Colors.red,
          ),
        ),
      ),
      onChanged: (value) {},
      onSubmitted: (value) {
        // log(searchTextController.text);
      },
    );
  }
}
