import 'package:bhubweatherapp/core/constants/export_files.dart';

import 'package:flutter/material.dart';

class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  String searchInput = "";
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        locationTextField(),
        placesList(),
      ],
    ));
  }

  Widget placesList() => FutureBuilder<List<PlaceModel>>(
        future: Api().getPlacesAutoComplete(
          query: searchInput,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Sorry, an error occurred',
              ),
            );
          }

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      onTap: () async {
                        var placeModel =
                            await AutoPlacesViewModel().getLocationAttr(
                          prediction: snapshot.data![index],
                        );
                        _showDefaultStatusDialog(
                          placeModel,
                        );
                      },
                      contentPadding: EdgeInsets.only(
                        bottom: 2.5,
                        top: 8.5,
                        left: 20.0,
                        right: 35.0,
                      ),
                      title: Text(
                        "${snapshot.data![index].formatted_address}",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: Str.APP_FONT,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                      // subtitle: Text(snapshot.data[index].key),
                    ),
                    Container(
                      //margin: EdgeInsets.only(left: 60.0, right: 60.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 3,
              ),
            );
          }
        },
      );

  void _showDefaultStatusDialog(
    PlaceModel placeModel,
  ) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          title: Text(
            'MORE INFO',
            textAlign: TextAlign.center,
            style: _textStyle,
          ),
          content: Container(
            height: 300,
            child: ListView(
              children: [
                dialogTile(
                  'City:',
                  '${placeModel.city}',
                ),
                dialogTile(
                  'Type:',
                  '${placeModel.name}',
                ),
                dialogTile(
                  'Current:',
                  '${placeModel.temp.round()}°',
                ),
                dialogTile(
                  'Max:',
                  '${placeModel.maxTemp.round()}°',
                ),
                dialogTile(
                  'Min:',
                  '${placeModel.minTemp.round()}°',
                ),
                dialogTile(
                  'Humidity:',
                  '${placeModel.humidity.round()}°',
                )
              ],
            ),
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: new Text(
                "   BACK       \n ",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              onTap: () {
                var val = SavedModel(
                  city: placeModel.city,
                  desc: placeModel.city,
                );
                SavedViewModels().saveWeatherLocation(val);
                Navigator.pop(context);
              },
              child: new Text(
                "  FAVOURITE     \n  ",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget dialogTile(
    _headingStr,
    subStr,
  ) =>
      Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Row(
          children: [
            Text(
              _headingStr,
            ),
            Expanded(
              child: Container(),
            ),
            Text(
              subStr,
            ),
          ],
        ),
      );

  TextStyle _textStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  Widget locationTextField() => new Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
          border: Border.all(
            width: 1.5,
            color: Colors.grey,
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
    setState(() {
      searchInput = searchController.text;
      Api().getPlacesAutoComplete(query: searchInput);
    });
  }
}
