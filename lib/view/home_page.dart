import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_task/controller/home_controller.dart';
import 'package:todo_task/view/toDo-page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Home Page",
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => toDoPage()));
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: GetBuilder<HomeController>(
          builder: (controller) => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            // controller.filterSearchResults(value);
                          },
                          controller: controller.editingController,
                          decoration: InputDecoration(
                              labelText: "Search",
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)))),
                        ),
                      ),
                      SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: Text("${index + 1}"),
                                tileColor: Colors.orange,
                                title: Text(controller.countryList[index]),
                              ),
                            );
                          },
                          itemCount: controller.countryList.length,
                        ),
                      ),
                    ],
                  ),
                ),
        ));
  }
}
