import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/Cubit/cubit.dart';
import 'package:newsapp/Layout/Cubit/state.dart';
import 'package:newsapp/shared/components/components.dart';

class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state){},
      builder: (context,state){
        var list=NewsCubit.get(context).sport;
        return  articaleBuildewr(list,context);
      },
    );
  }
}