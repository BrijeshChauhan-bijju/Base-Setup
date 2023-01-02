import 'package:base_setup/generated/l10n.dart';
import 'package:base_setup/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:base_setup/presentation/bloc/user_bloc/user_event.dart';
import 'package:base_setup/presentation/bloc/user_bloc/user_state.dart';
import 'package:base_setup/ui/app_progress.dart';
import 'package:base_setup/ui/side_navigation_bar.dart';
import 'package:base_setup/ui/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<UserBloc>().add(GetUserData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).firstPage,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: sideNavigationBar(context: context),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserLoading) {
            AppProgress(context);
          } else {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is UserHasData) {
            final userList = state.result.data;

            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: userList?.length,
                  itemBuilder: (context, index) {
                    final userData = userList![index];

                    return Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 8.0),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: NetworkImage(
                                  userData.avatar ?? "",
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "${userData.firstName} ${userData.lastName}",
                                style: const TextStyle(
                                  fontSize: 22.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                        ],
                      ),
                    );
                  }),
            );
          } else if (state is UserError) {
            return Center(
              child: Text(
                state.error.error.description,
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
