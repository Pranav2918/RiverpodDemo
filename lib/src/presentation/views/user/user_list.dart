import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/src/presentation/widgets/web_container.dart';
import 'package:riverpoddemo/src/providers/user_provider.dart';

class UserList extends ConsumerWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("USERS"),
      ),
      body: WebContainer(
          child: users.when(
        data: (user) => ListView.builder(
          itemCount: user.length,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black38),
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Center(
                      child: Text(
                    user[index].id.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  )),
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user[index].name,
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                    Text(
                      user[index].email,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Center(child: CircularProgressIndicator()),
      )),
    );
  }
}
