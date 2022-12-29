import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_task/controller/toDo_controller.dart';

class toDoPage extends StatelessWidget {
  toDoPage({super.key});
  final homeController = Get.put(ToDoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("To Do List"), centerTitle: true),
        body: GetBuilder<ToDoController>(
          builder: (controller) => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : controller.items.isEmpty
                  ? const Center(
                      child: Text(
                        'No Data',
                        style: TextStyle(fontSize: 30),
                      ),
                    )
                  : ListView.builder(
                      // the list of items
                      itemCount: controller.items.length,
                      itemBuilder: (_, index) {
                        final currentItem = controller.items[index];
                        return Card(
                          color: Colors.orange.shade100,
                          margin: const EdgeInsets.all(10),
                          elevation: 3,
                          child: ListTile(
                              title: Text(currentItem['name']),
                              subtitle:
                                  Text(currentItem['quantity'].toString()),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Edit button
                                  IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () => controller.showForm(
                                          context,
                                          currentItem['key'],
                                          context)),
                                  // Delete button
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () => controller.deleteItem(
                                        currentItem['key'], context),
                                  ),
                                ],
                              )),
                        );
                      }),
        ),

        // Add new item button
        floatingActionButton: GetBuilder<ToDoController>(
            builder: (controller) => FloatingActionButton(
                  onPressed: () => controller.showForm(context, null, context),
                  child: const Icon(Icons.add),
                )));
  }
}
