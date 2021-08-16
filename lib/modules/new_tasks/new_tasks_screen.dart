import 'package:ahmed/shared/componant/componant.dart';
import 'package:ahmed/shared/componant/conesstance.dart';
import 'package:ahmed/shared/cubit/cubit.dart';
import 'package:ahmed/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit , AppStates>(
        listener:(context,state) {},

        builder: (context,state){return ListView.separated(
          itemBuilder:(context,index) => buildTaskItem(AppCubit.get(context).tasks[index],context),
          separatorBuilder: (context,index) => Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
          itemCount: AppCubit.get(context).tasks.length,);},
    );


  }

}
