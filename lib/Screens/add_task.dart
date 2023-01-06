import 'package:agr_app/Model/usermodel.dart';
import 'package:agr_app/Widget/custom_appbar.dart';
import 'package:agr_app/Widget/loading_dialogy.dart';
import 'package:agr_app/Widget/textformfield_controler.dart';
import 'package:agr_app/services/base_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var titleEidtingController = TextEditingController();
  var descriptionEditingController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  String selectedDate = '';
  bool value = false;

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
                  child: const Text('Add task'),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      var user = UserModel(
                        name: titleEidtingController.text,
                        createdAt: 2022,
                        id: '',
                        image: descriptionEditingController.text,
                      );

                      showLoadingDialog(message: 'Loading');
                      var response = await BaseClient()
                          .post('/users', user)
                          .catchError((err) {});
                      if (response == null) return;
                      hideLoadingDialog();
                      debugPrint('successful:');
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
