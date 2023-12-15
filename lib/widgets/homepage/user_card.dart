
import 'package:flutter/material.dart';
import 'package:voco_tech_test/models/users_model.dart';
import 'package:voco_tech_test/widgets/constants/colors.dart';
import 'package:voco_tech_test/widgets/constants/extension.dart';

class HomePageUserCard extends StatelessWidget {
  const HomePageUserCard({
    super.key,
    required this.user,
  });

  final Users user;

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            buildUserAvatarWidget(),
            buildUserTextWidget(context)
          ],
        ));
  }

  Positioned buildUserTextWidget(BuildContext context) {
    return Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: context.height * 0.08,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.75),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildUserNameTextWidget(),
                    buildUserEmailTextWidget(),
                  ],
                ),
              ));
  }

  Positioned buildUserAvatarWidget() {
    return Positioned.fill(
              child: Image.network(
            user.avatar!,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ));
  }

  Text buildUserEmailTextWidget() {
    return Text(
                      user.email!,
                      style: TextStyle(
                          color: ProjectColors.primaryColor.withOpacity(0.8),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    );
  }

  Text buildUserNameTextWidget() {
    return Text(
                      "${user.firstName!} ${user.lastName!}",
                      style: const TextStyle(
                          color: ProjectColors.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    );
  }
}