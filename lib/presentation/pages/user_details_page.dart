import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lazy_ants/domain/enteties/users/user_entity.dart';

import '../widgets/cards/info_card.dart';

@RoutePage()
class UserDetailsPage extends StatelessWidget {
  final UserEntity user;

  const UserDetailsPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoCard(label: 'Email', info: user.email),
            const SizedBox(height: 8),
            InfoCard(label: 'Phone', info: user.phone),
            const SizedBox(height: 8),
            InfoCard(label: 'Address', info: user.address),
            const SizedBox(height: 8),
            InfoCard(label: 'Company', info: user.company),
          ],
        ),
      ),
    );
  }
}
