import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampleApp/Slider/custom_slider.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: ThemostatListing());
  }
}

class ThemostatListing extends StatefulWidget {
  ThemostatListing({Key key}) : super(key: key);

  @override
  _ThemostatListingState createState() => _ThemostatListingState();
}

class _ThemostatListingState extends State<ThemostatListing> {
  var thrmostatListing = [
    ThermostatModel(
        status: "Ok",
        temp: "77",
        hvacName: "LIVING ROOM THERMOSTAT",
        heatTemp: "75",
        coolTemp: "76",
        havacMode: "Auto",
        fan: "Fan Auto"),
    ThermostatModel(
        status: "Ok",
        temp: "80",
        hvacName: "MAIN THERMOSTAT",
        heatTemp: "60",
        coolTemp: "50",
        havacMode: "Auto",
        fan: "Fan Auto"),
  ];
  int _selectedIndex = 0;
  String selectedMode;
  String currentTemp;

  int autoCoolingValue = 0;
  int autoHeatingValue = 0;

  int currentAutoCoolingValue = 0;
  int currentAutoHeatingValue = 0;
  @override
  void initState() {
    super.initState();
    selectedMode = thrmostatListing[0].havacMode;
    currentTemp = thrmostatListing[0].temp;
  }

  changeThemoValues(ThermostatModel model) {
    if (model.havacMode == "Auto") {
      autoCoolingValue = int.parse(model.coolTemp);
      autoHeatingValue = int.parse(model.heatTemp);
      currentAutoCoolingValue = autoCoolingValue;
      currentAutoHeatingValue = autoHeatingValue;
      selectedMode = "Auto";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: thrmostatListing.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    var item = thrmostatListing[index];

                    return Container(
                      width: 120,
                      child: GestureDetector(
                        onTap: () {
                          _selectedIndex = index;
                          /* ThermostatDataModel model =
                                                    ThermostatDataModel(
                                                  coolTemp: thermostatList[index]
                                                      .coolTemp,
                                                  heatTemp: thermostatList[index]
                                                      .heatTemp,
                                                  eHvacType: thermostatList[index]
                                                      .eHvacType,
                                                  fan: thermostatList[index].fan,
                                                  hvacCmd: thermostatList[index]
                                                      .hvacCmd,
                                                  hvacMode: thermostatList[index]
                                                      .hvacMode,
                                                  hvacName: thermostatList[index]
                                                      .hvacName,
                                                  hvacZone: thermostatList[index]
                                                      .hvacZone,
                                                  leaf:
                                                      thermostatList[index].leaf,
                                                  status: thermostatList[index]
                                                      .status,
                                                  temp:
                                                      thermostatList[index].temp,
                                                ); */
                          // model = thermostatList[index];
/* 
                                                getInitialListThermostat(model); */

                          ThermostatModel model = ThermostatModel(
                            coolTemp: item.coolTemp,
                            heatTemp: item.heatTemp,
                            fan: item.fan,
                            havacMode: item.havacMode,
                            hvacName: item.hvacName,
                            status: item.status,
                            temp: item.temp,
                          );

                          changeThemoValues(model);
                          /*  selectedModel =
                                              heatingCoolingList[index]; */
                          setState(() {});
                        },
                        child: Card(
                          elevation: 5,
                          color: _selectedIndex == index
                              ? Colors.blue
                              : Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      '${item.temp}\u00B0F',
                                      style: GoogleFonts.montserrat(
                                        color: _selectedIndex != null &&
                                                _selectedIndex == index
                                            ? Colors.white
                                            : Colors.blue,
                                        fontWeight: FontWeight.w700,
                                        textStyle: TextStyle(
                                            letterSpacing: .5, fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Column(
                                      children: <Widget>[
                                        if (item.coolTemp != null)
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 3),
                                                child: Icon(
                                                  Icons.ac_unit,
                                                  size: 12,
                                                  color: _selectedIndex == index
                                                      ? Colors.white
                                                      : Colors.blue,
                                                ),
                                              ),
                                              Text(
                                                '${item.coolTemp}\u00B0',
                                                style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w600,
                                                  textStyle: TextStyle(
                                                      color: _selectedIndex ==
                                                              index
                                                          ? Colors.white
                                                          : Colors.blue,
                                                      letterSpacing: .5,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (item.heatTemp != null)
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 3),
                                                child: Icon(
                                                  Icons.settings,
                                                  size: 12,
                                                  color: Colors.redAccent,
                                                ),
                                              ),
                                              Text(
                                                '${item.heatTemp}\u00B0',
                                                style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w600,
                                                  textStyle: TextStyle(
                                                      color: Colors.redAccent,
                                                      letterSpacing: .5,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              if (item.hvacName != null)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    item.hvacName.capitalize(),
                                    style: GoogleFonts.montserrat(
                                      color: _selectedIndex == index
                                          ? Colors.white
                                          : Colors.blue,
                                      fontWeight: FontWeight.w400,
                                      textStyle: TextStyle(
                                          letterSpacing: .5, fontSize: 12),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Inside',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              textStyle:
                                  TextStyle(letterSpacing: .5, fontSize: 13),
                            ),
                          ),
                          Text(
                            '$currentTemp\u00B0F',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w900,
                              textStyle:
                                  TextStyle(letterSpacing: .5, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                    selectedMode == "Auto" ||
                            selectedMode == "EMR" ||
                            selectedMode == "Heat"
                        ? Text(
                            'Heat below',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              textStyle:
                                  TextStyle(letterSpacing: .5, fontSize: 12),
                            ),
                          )
                        : Text(''),
                    Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Outside',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                textStyle:
                                    TextStyle(letterSpacing: .5, fontSize: 13),
                              ),
                            ),
                            Text(
                              '35\u00B0F',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w900,
                                textStyle:
                                    TextStyle(letterSpacing: .5, fontSize: 20),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              if (selectedMode == "Auto")
                AspectRatio(
                  aspectRatio: 2 / 1,
                  child: CustomSlider(
                    leftValue: autoCoolingValue,
                    rightValue: autoHeatingValue,
                    callback: (left, right) {
                      currentAutoCoolingValue = left;
                      currentAutoHeatingValue = right;

                      if (_selectedIndex == 0) {
                        thrmostatListing[0].coolTemp =
                            currentAutoCoolingValue.toString();
                        thrmostatListing[0].heatTemp =
                            currentAutoHeatingValue.toString();
                      } else {
                        thrmostatListing[1].coolTemp =
                            currentAutoCoolingValue.toString();
                        thrmostatListing[1].heatTemp =
                            currentAutoHeatingValue.toString();
                      }

                      setState(() {});
                    },
                  ),
                ),
              SizedBox(
                height: 25,
              ),
              if (selectedMode == "Cool" || selectedMode == "Auto")
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Cool above',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        textStyle: TextStyle(letterSpacing: .5, fontSize: 12),
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/* {
    "Status": "OK",
    "HVACCmd": "GETSTATUS",
    "HVACName": "LIVING ROOM THERMOSTAT",
    "HVACZone": "1",
    "eHvacType": "RCS Model TR16",
    "Temp": "77",
    "Leaf": "False",
    "HeatTemp": "50",
    "CoolTemp": "71",
    "HvacMode": "Auto",
    "Fan": "Fan Auto"
} */

class ThermostatModel {
  String status;
  String temp;
  String hvacName;
  String heatTemp;
  String coolTemp;
  String havacMode;
  String fan;
  ThermostatModel(
      {this.status,
      this.temp,
      this.hvacName,
      this.heatTemp,
      this.coolTemp,
      this.havacMode,
      this.fan});
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
