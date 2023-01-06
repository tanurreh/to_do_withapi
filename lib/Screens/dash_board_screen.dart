// ignore_for_file: must_be_immutable

import 'package:agr_app/Model/usermodel.dart';
import 'package:agr_app/Screens/add_task.dart';
import 'package:agr_app/Screens/update_task.dart';
import 'package:agr_app/Widget/custom_appbar.dart';
import 'package:agr_app/Widget/loading_dialogy.dart';
import 'package:agr_app/services/base_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override


  Future<List<UserModel>> getuser() async {
    var response = await BaseClient().get('/users').catchError((err) {});
    debugPrint('successful:');
    var users = userModelFromJson(response);
    debugPrint('Users count: ' + users.length.toString());
    return users;
  }

  Stream<List<UserModel>> productsStream() async* {
  while (true) {
    await Future.delayed(Duration(milliseconds: 500));
    var someProduct = await getuser();
    yield someProduct;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(50.w, 50.h),
        child: CustomAppBar(title: 'Dashboard Screen', color: Colors.blue),
      ),
      body: StreamBuilder<List<UserModel>>(
          stream: productsStream() ,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<UserModel> tasks = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemCount: tasks.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Slidable(
                    direction: Axis.horizontal,
                    startActionPane:
                        ActionPane(motion: const ScrollMotion(), children: [
                      SlidableAction(
                        label: 'Delete',
                        borderRadius: BorderRadius.circular(2.r),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        onPressed: (BuildContext context) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actions: [
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: () async {
                                            showLoadingDialog(
                                                message: 'Loading');
                                            var id = tasks[index].id;
                                            var response = await BaseClient()
                                                .delete('/users/$id')
                                                .catchError((err) {});
                                         Navigator.of(context).pop();
                                            debugPrint('successful:');
                                            setState(() {});
                                            hideLoadingDialog();
                                           
                                          },
                                          child: Text(
                                            'Yes',
                                            style: GoogleFonts.alike(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'No',
                                            style: GoogleFonts.alike(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                  title: Center(
                                    child: Text('Confirmation..!',
                                        style: GoogleFonts.alike(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        )),
                                  ),
                                  content: Text(
                                    'Are You sure want to Delete..?',
                                    style: GoogleFonts.alike(
                                      textStyle: const TextStyle(
                                        color: Colors.deepOrange,
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                      ),
                    ]),
                    endActionPane:
                        ActionPane(motion: const ScrollMotion(), children: [
                      SlidableAction(
                        label: 'Edit',
                        borderRadius: BorderRadius.circular(2.r),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        onPressed: (BuildContext context) {
                          Get.to(() => UpdateTaskScreen(
                                task: tasks[index],
                              ));
                        },
                      ),
                    ]),
                    child: ListTile(
                      leading: Text(index.toString()),
                      title: Text(tasks[index].name),
                      subtitle: Text(tasks[index].image),
                    ),
                  );
                },
                separatorBuilder: (context, int index) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          Get.to(() => const AddTaskScreen());
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
