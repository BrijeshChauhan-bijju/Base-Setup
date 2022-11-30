import 'package:base_setup/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:base_setup/presentation/bloc/user_bloc/user_event.dart';
import 'package:base_setup/presentation/bloc/user_bloc/user_state.dart';
import 'package:base_setup/ui/app_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUserData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'User Page',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context,state){
          if(state is UserLoading){
            AppProgress(context);
          }else{
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

                    return Column(
                      children: [
                        const SizedBox(height: 8.0),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Image(
                              image: NetworkImage(
                                userData.avatar ?? "",
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "${userData.firstName}+${userData.lastName}",
                              style: const TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                      ],
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
