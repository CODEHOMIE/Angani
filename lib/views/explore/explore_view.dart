import 'package:bhubweatherapp/core/constants/export_files.dart';
import 'package:bhubweatherapp/widgets/explore_list/search_list.dart';
import 'package:flutter/material.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExploreViewModels>.reactive(
      viewModelBuilder: () => ExploreViewModels(),
      onModelReady: (viewModel) => viewModel.getPlaces(),
      builder: (context, viewModel, child) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // SearchInput(
                //   exploreViewModels: viewModel,
                // ),
                SearchList()
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
