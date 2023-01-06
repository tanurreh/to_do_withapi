import 'package:agr_app/Widget/loading_dialogy.dart';
import 'package:agr_app/services/base_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:agr_app/Model/usermodel.dart';
import 'package:agr_app/Widget/custom_appbar.dart';
import 'package:agr_app/Widget/textformfield_controler.dart';
import 'package:get/get.dart';

class UpdateTaskScreen extends StatefulWidget {
  final UserModel task;
  const UpdateTaskScreen({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  var titleEidtingController = TextEditingController();
  var descriptionEditingController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  String selectedDate = '';
  bool value = false;

  String checkBoxTitle = 'isTaskDone';
  DateTime selected = DateTime(2100);
  DateTime initial = DateTime(1900);
  DateTime lastDate = DateTime(2100);

  @override
  void initState() {
    titleEidtingController.text = widget.task.name;
    descriptionEditingController.text = widget.task.image;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          50.w,
          50.h,
        ),
        child: CustomAppBar(
          title: 'Add Task Screen',
          color: Colors.blue,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextFormFieldsController.textFormField(
                preFixIcon: Icons.task,
                hintText: 'title',
                controller: titleEidtingController,
                onChangeValue: title,
                errorText: 'please enter your Title'),
            SizedBox(
              height: 100.h,
            ),
            TextFormFieldsController.textFormField(
                preFixIcon: Icons.task,
                hintText: 'description',
                controller: descriptionEditingController,
                onChangeValue: description,
                errorText: 'please enter your Description'),
            SizedBox(
              height: 15.h,
            ),
            Center(
              child: ElevatedButton(
                  child: const Text('Update task'),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      var id = widget.task.id;
                      var user = UserModel(
                        name: titleEidtingController.text,
                        createdAt: 2025,
                        id: widget.task.id,
                        image: descriptionEditingController.text,
                      );
                      showLoadingDialog(message: 'Loading');
                      var response = await BaseClient()
                          .put('/users/$id', user)
                          .catchError((err) {});
                      if (response == null) return;
                      debugPrint('successful:');
                      hideLoadingDialog();
                      Get.back();
                    }
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
