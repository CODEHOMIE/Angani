import 'package:bhubweatherapp/core/constants/export_files.dart';
import 'package:flutter/material.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _decoration = BoxDecoration(
      image: new DecorationImage(
        image: new AssetImage(
          "assets/images/forest.png",
        ),
        fit: BoxFit.fill,
      ),
    );
    return ViewModelBuilder<WeatherViewModels>.reactive(
      viewModelBuilder: () => WeatherViewModels(),
      onModelReady: (viewModel) => viewModel.getWeathers(),
      builder: (context, viewModel, child) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: _decoration,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              WeatherItem(
                weather:  viewModel.weathers,
              ),
              WeatherMidItem(
                weather: viewModel.weathers,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: Divider(
                  height: 1.0,
                  color: Colors.white,
                ),
              ),
              ForecastList(),
            ],
          ),
        ),
      ),
    );
  }
}
