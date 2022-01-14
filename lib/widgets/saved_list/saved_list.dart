import 'package:bhubweatherapp/viewmodels/saved/saved_view_model.dart';
import 'package:flutter/cupertino.dart';

class SavedList extends StatelessWidget {
  final SavedViewModels savedLists;
  SavedList({
    required this.savedLists,
  });
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return savedLists.saved == null ? Center(
      child: Text(
        'You have no Saved\nweather locations'
      ),
    ) : Container();
  }
}
