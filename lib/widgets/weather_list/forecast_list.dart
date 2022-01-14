import 'package:bhubweatherapp/core/constants/export_files.dart';
import 'package:flutter/material.dart';

class ForecastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<ForecastViewModels>.reactive(
      viewModelBuilder: () => ForecastViewModels(),
      onModelReady: (viewModel) => viewModel.getWeathers(),
      builder: (context, viewModel, child) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: viewModel.weathers.length,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return ForecastItem(
              forecastModel: viewModel.weathers[index],
              day: AppDays().dayType(index),
            );
          },
        ),
      ),
    );
  }
}
