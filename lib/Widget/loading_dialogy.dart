
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      content: SizedBox(
          width: 250,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const  CircularProgressIndicator.adaptive(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation(Colors.black),
              ),
              const SizedBox(width: 20),
              Text(
                message,
            
              )
            ],
          )),
    );
  }
}

void showLoadingDialog({required String message}) {
  Get.dialog(
    LoadingDialog(message: message),
    barrierDismissible: false,
    name: message,
  );
}

void hideLoadingDialog() {
  Get.back();
  return;
}
