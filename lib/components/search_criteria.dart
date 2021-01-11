import 'package:edu_connect/components/buildTogglesW.dart';
import 'package:edu_connect/components/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:edu_connect/models/tutor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchCriteria extends StatefulWidget {
  @override
  var _selectedLocation;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference locations_firestore =
      FirebaseFirestore.instance.collection('location');
  String _location;
  Tutor tutor_search_temp = Tutor();

  _SearchCriteriaState createState() => _SearchCriteriaState();
}

class _SearchCriteriaState extends State<SearchCriteria> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width,
      child: AlertDialog(
        insetPadding: EdgeInsets.only(left: 20, right: 20, top: 75, bottom: 50),
        contentPadding: EdgeInsets.all(10),
        backgroundColor: Colors.white,
        content: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Text(
                  'Days Availability',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 20),
                ),
                buildTogglesW(
                  widget.tutor_search_temp.daysAvailable,
                ),
                // buildTogglesW(subjectsAvailable),
                // location
                Text(
                  'Subjects',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 20),
                ),
                buildTogglesW(
                  widget.tutor_search_temp.subjectPreferred,
                ),
                Text(
                  'Tests Preparation',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 20),
                ),
                buildTogglesW(
                  widget.tutor_search_temp.testPreferred,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Icon(Icons.location_on_outlined),
                    Container(
                      height: 70,
                      // width: MediaQuery.of(context).size.width,
                      child: FutureBuilder<DocumentSnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('location')
                            .doc('qatar')
                            .get(),
                        builder: (context, snapshot) {
                          // print(snapshot.data['locations'].toString());

                          if (snapshot.hasData) {
                            var dropdownList = snapshot.data['locations'];
                            print(dropdownList);
                            List<dynamic> _locations = dropdownList;

                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlatButton(
                                  minWidth: 50,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  padding: EdgeInsets.zero,
                                  child: Icon(Icons.cancel),
                                  onPressed: () {
                                    setState(() {
                                      widget._selectedLocation = null;
                                      widget._location = null;
                                      // currentUser_bloc_NL.locationString = null;
                                    });
                                  },
                                ),
                                DropdownButton(
                                  onChanged: (value) {
                                    setState(() {
                                      widget._selectedLocation = value;
                                      widget._location = value;
                                      // currentUser_bloc_NL.locationString =
                                      //     value;
                                    });
                                  },
                                  hint: Text(
                                    "Choose Area",
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  icon: Icon(Icons.location_on_outlined),
                                  value: widget._selectedLocation,
                                  items: _locations.map((location) {
                                    return DropdownMenuItem(
                                      child: Text(location),
                                      value: location,
                                    );
                                  }).toList(),

                                  // itemHeight: 10,
                                ),
                              ],
                            );
                          } else
                            return Text('');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          FlatButton(
            onPressed: () {
              print('"seached..');
            },
            child: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor),
              child: Center(
                child: Text(
                  'Search',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
        title: Text(
          'Search',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}