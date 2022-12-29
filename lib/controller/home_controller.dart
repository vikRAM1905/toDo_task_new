import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_task/services/api_services.dart';

import '../model/country_model.dart';

class HomeController extends GetxController {
  var countryList = List<String>.empty(growable: true).obs;
  var isLoading = false.obs;
  var editingController = TextEditingController();

  var duplicateItems;
  var items = List<String>.empty(growable: true).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getApiData();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(countryList);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      items.clear();
      items.addAll(countryList);
      return;
    } else {
      items.clear();
      items.addAll(countryList);
    }
    update();
  }

  void getApiData() async {
    isLoading.value = true;

    await ApiServices().get().then((value) {
      value.forEach((country) {
        print(country['name']['official'].toString());
        print(country.toString());
        countryList.add(country['name']['official']);
        items = countryList;
        // CountryModel model = CountryModel.fromJson();
      });
      // print(model.name!.official);
      isLoading.value = false;
    });
    update();
  }
}
