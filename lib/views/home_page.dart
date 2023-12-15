import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_tech_test/controllers/users_list_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(userListControllerProvider);
    if (controller.userList.isEmpty) {
      controller.getUserList('1');
      controller.getUserList('2');
    }
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: controller.userList.length,
          itemBuilder: (context, index) {
            final user = controller.userList[index];
            return ListTile(
              title: Text('${user.firstName} ${user.lastName}'),
              subtitle: Text(user.email!),
            );
          },
        ),
      ),
    );
  }
}
