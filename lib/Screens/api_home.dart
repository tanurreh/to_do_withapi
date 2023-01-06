import 'package:agr_app/Model/usermodel.dart';
import 'package:agr_app/Widget/app_button.dart';
import 'package:agr_app/services/base_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const FlutterLogo(size: 72),
              AppButton(
                operation: 'GET',
                operationColor: Colors.lightGreen,
                description: 'Fetch users',
                onPressed: () async {
                 var response = await BaseClient().get('/users').catchError((err) {});
                  if (response == null) return;
                  debugPrint('successful:');
 
                  var users = userModelFromJson(response);
                  debugPrint('Users count: ' + users.length.toString());
                },
              ),
              AppButton(
                operation: 'POST',
                operationColor: Colors.lightBlue,
                description: 'Add user',
                onPressed: () async {
                  var user = UserModel(
                    name: 'Tanzeel',
                   createdAt: 2025, id: '100', image: 'Aszxgsahsyadysydsaydysadysaydsaydysady',
                  );
        
                  var response = await BaseClient().post('/users', user).catchError((err) {});
                  if (response == null) return;
                  debugPrint('successful:');
                },
              ),
              AppButton(
                operation: 'PUT',
                operationColor: Colors.orangeAccent,
                description: 'Edit user',
                onPressed: () async {
                  var id = 19;
                  var user = UserModel(
                    name: 'Tanzeel Ur Rehman',
                   createdAt: 2028, id: id.toString(), image: 'asadsygdysdgywyegwyegwygeywgeywgeywgy',
                  );

                  var response = await BaseClient().put('/users/$id', user).catchError((err) {});
                  if (response == null) return;
                  debugPrint('successful:');
                },
              ),
              AppButton(
                operation: 'DEL',
                operationColor: Colors.red,
                description: 'Delete user',
                onPressed: () async {
                  var id = 19;
                  var response = await BaseClient().delete('/users/$id').catchError((err) {});
                  if (response == null) return;
                  debugPrint('successful:');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}