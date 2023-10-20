import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:state_management/controllers/infor_controller.dart';

class LocalStoragePage extends StatelessWidget {
  const LocalStoragePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Storage App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GetBuilder<LocalStorageController>(
                  init: LocalStorageController(),
                  builder: (localController) {
                    return Column(
                      children: [
                        TextField(
                          controller: localController.nameController,
                          decoration: const InputDecoration(
                            hintText: "Name",
                          ),
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: localController.positionController,
                          decoration: const InputDecoration(
                            hintText: "Position",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.red,
                          hoverColor: Colors.pink,
                          onPressed: () {
                            localController.onSaveData();
                          },
                          child: const Text('SAVE'),
                        ),
                      ],
                    );
                  }),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: GetBuilder<LocalStorageController>(
              init: LocalStorageController(),
              builder: (localController) => ListView.builder(
                itemCount: localController.lstDevelopers.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // print(localController.lstDevelopers[index]);
                  return Card(
                    child: ListTile(
                      onTap: () {
                        localController.nameController.text =
                            localController.lstDevelopers[index]["name"];
                        localController.positionController.text =
                            localController.lstDevelopers[index]["position"];
                      },
                      title: Text(localController.lstDevelopers[index]['name']),
                      subtitle: Text(
                          localController.lstDevelopers[index]['position']),
                      trailing: IconButton(
                        onPressed: () {
                          localController.onDeleteData(index);
                        },
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
