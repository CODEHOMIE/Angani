import 'package:bhubweatherapp/core/constants/export_files.dart';
import 'package:bhubweatherapp/viewmodels/saved/saved_view_model.dart';
import 'package:bhubweatherapp/widgets/saved_list/saved_list.dart';
import 'package:flutter/material.dart';

class SavedView extends StatelessWidget {
  const SavedView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SavedViewModels>.reactive(
      viewModelBuilder: () => SavedViewModels(),
      onModelReady: (viewModel) => viewModel.getSavedList(),
      builder: (context, viewModel, child) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: SavedList(savedLists: viewModel,),
        ),
      ),
    );
  }
}