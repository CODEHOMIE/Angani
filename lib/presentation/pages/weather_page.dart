import 'package:bhubweatherapp/core/constants/export_files.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({ Key? key }) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) => _landingPageBody();

  Widget _landingPageBody() => Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(
              "assets/images/forest.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            _currentWeatherUsersLocView(),
            _midPartView(),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              child: Divider(
                height: 1.0,
                color: Colors.white,
              ),
            ),
            _fiveDayForcastView(),
          ],
        ),
      );

  Widget _currentWeatherUsersLocView() => Container(
        height: MediaQuery.of(context).size.height * .39,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: new TextSpan(
              style: new TextStyle(
                height: 1.2,
                color: Colors.white,
                wordSpacing: 1.2,
              ),
              children: <TextSpan>[
                new TextSpan(
                  text: "25\n",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: Str.APP_FONT,
                    fontSize: 60.0,
                  ),
                ),
                new TextSpan(
                  text: "SUNNY\n\n",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: Str.APP_FONT,
                    fontSize: 25.0,
                    wordSpacing: 1.7,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _midPartView() => Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _midPartTile('min'),
            _midPartTile('current'),
            _midPartTile('max'),
          ],
        ),
      );

  Widget _midPartTile(
    subStr,
  ) =>
      Container(
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: new TextSpan(
                style: new TextStyle(
                  height: 1.2,
                  color: Colors.white,
                  wordSpacing: 1.2,
                ),
                children: <TextSpan>[
                  new TextSpan(
                    text: "19\n",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: Str.APP_FONT,
                      fontSize: 19.0,
                    ),
                  ),
                  new TextSpan(
                    text: subStr,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: Str.APP_FONT,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _dayWeatherRow(
    _dayName,
    _degreeStr,
  ) =>
      Container(
        margin: EdgeInsets.symmetric(
          vertical: 6.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 128,
              child: Text(
                _dayName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            _weatherIcon(),
            Expanded(
              child: Container(),
            ),
            Text(
              _degreeStr,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );

  Widget _fiveDayForcastView() => Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            _dayWeatherRow(
              'Tuesday',
              '20',
            ),
            _dayWeatherRow(
              'Wednesday',
              '23',
            ),
            _dayWeatherRow(
              'Thursday',
              '27',
            ),
            _dayWeatherRow(
              'Friday',
              '23',
            ),
            _dayWeatherRow(
              'Saturday',
              '30',
            ),
          ],
        ),
      );

  Widget _weatherIcon() => SizedBox(
        height: 20,
        width: 20,
        child: SvgPicture.asset(
          'assets/svgs/sunny_weather.svg',
          color: Colors.white,
        ),
      );
}