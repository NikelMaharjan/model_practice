import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_json/models/users.dart';
import 'package:riverpod_json/providers/user_provider.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          //backgroundColor: const Color(0xFFF1F5F9),
          body: Consumer(builder: (context, ref, child) {
           final userData = ref.watch(userProvider);
           return userData.when(
            data: (data) {
              return userDetails(data);
            },
            error: (err, stack) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text('$err')),
            ),
            loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ));
      })),
    );
  }

  Widget userDetails(List<UserDetail> data) {
    return Center(
      child: Card(
        color: const Color(0xFFF1F5F9),
        child: Container(
          height: 700,
          child: ListView(
            children: data.map((e) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTileTheme(
                    dense: true,
                    child: ExpansionTile(
                      childrenPadding: const EdgeInsets.all(16),
                      expandedCrossAxisAlignment:
                      CrossAxisAlignment.start,
                      expandedAlignment: Alignment.centerLeft,
                      textColor: Colors.red,
                      iconColor: Colors.red,
                      title: Text(
                        e.name,
                        style: const TextStyle(fontSize: 16),
                      ),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Email",style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),),
                            Text(e.email,
                                style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Address" ,style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                            Text(
                              e.address.city,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Company name" ,style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),),
                            Text(e.company.name,
                                style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
