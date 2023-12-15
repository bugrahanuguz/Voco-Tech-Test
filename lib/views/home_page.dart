import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_tech_test/controllers/users_list_controller.dart';
import 'package:voco_tech_test/widgets/homepage/user_card.dart';

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
      appBar: buildHomePageAppBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: controller.userList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          crossAxisCount: 2,
          childAspectRatio: 4.5 / 5,
        ),
        itemBuilder: (context, index) {
          final user = controller.userList[index];
          return HomePageUserCard(user: user);
        },
      ),
    );
  }

  AppBar buildHomePageAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: const Center(
          child: Text("Kullanıcılar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ))),
    );
  }
}

