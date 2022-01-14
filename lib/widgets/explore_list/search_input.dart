import 'package:bhubweatherapp/core/constants/export_files.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final searchController = TextEditingController();

  final ExploreViewModels exploreViewModels;
  SearchInput({
    required this.exploreViewModels,
  });

  @override
  Widget build(BuildContext context) {
    return locationTextField();
  }

  Widget locationTextField() => new Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 5.0,
        ),
        child: TextField(
          autocorrect: true,
          controller: searchController,
          onChanged: (text) {
            _handleSubmission(text);
          },
          textInputAction: TextInputAction.search,
          maxLines: 1,
          onSubmitted: _handleSubmission,
          style: TextStyle(
            fontSize: 13.0,
            fontFamily: Str.APP_FONT,
          ),
          decoration: InputDecoration(
            hintText: 'Enter City, State or Location',
            hintStyle: TextStyle(
              fontSize: 14.0,
              fontFamily: Str.APP_FONT,
            ),
            labelStyle: TextStyle(
              fontSize: 14.0,
              fontFamily: Str.APP_FONT,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            prefixIcon: const Icon(
              Icons.my_location,
              //color: ,
              size: 18.0,
            ),
          ),
        ),
      );

  void _handleSubmission(String text) {
    ExploreViewModels().changeCity(
      searchController.text.toString(),
    );
    // setState(() {
    //   searchInput = searchController.text;
    //   getPlacesAutoComplete(query: searchInput);
    // });
  }
}
