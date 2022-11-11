import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:coutnries_list/core/services/countries_service/coutries_service.dart';
import 'package:coutnries_list/core/stateManagement/countries_state.dart';
import 'package:coutnries_list/presentation/views/Home/widgets/filter_row.dart';
import 'package:coutnries_list/presentation/views/Home/widgets/header_row.dart';
import 'package:coutnries_list/presentation/views/Home/widgets/list_countries.dart';
import 'package:coutnries_list/presentation/views/Home/widgets/search_bar.dart';
import 'package:coutnries_list/presentation/views/Home/widgets/search_row.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../../../core/services/DataClass/countries_model.dart';
import '../../../core/utility/responsive/responsive.dart';
import '../../common_widgets/constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CountriesList>? countriesList;
  StreamSubscription? subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    // TODO: implement initState

    getLists();
    getConnectionState();
    super.initState();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  Future<void> getConnectionState() async {
    isDeviceConnected = await InternetConnectionChecker().hasConnection;
    if (!isDeviceConnected) {
      showDialogBox();
    }
  }

  void showDialogBox() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text("Offline",
            style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        elevation: 24,
        content: Text(
          "Not Connected to the internet. Connect To Internet and Try again",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        actions: [
          TextButton(
            child: Text(
              "Ok",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            onPressed: () async {
              Navigator.pop(context);
              await Future.delayed(
                const Duration(milliseconds: 500),
                () => getConnectionState(),
              );
            },
          ),
        ],
      ),
    );
  }

  void getLists() async {
    Future.wait([
      context.read<CountriesState>().fetchList().then((value) {
        return countriesList = value;
      }),
    ]).then((value) {
      setState(() {});
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // countriesList = context.read<CountriesState>().countriesList;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderRow(),
                const SizedBox(
                  height: 20,
                ),
                const SearchRow(),
                const SizedBox(
                  height: 16,
                ),
                const FilterRow(),
                const SizedBox(
                  height: 24,
                ),
                (countriesList == null)
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: Responsive.isLandScape(context)
                            ? 250
                            : size.height * 0.65,
                        child: CountriesWidget(countriesList: countriesList)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
