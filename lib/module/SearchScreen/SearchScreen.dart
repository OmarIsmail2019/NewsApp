
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/Cubit/cubit.dart';
import 'package:newsapp/Layout/Cubit/state.dart';
import 'package:newsapp/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state){},
      builder: (context,state){
        var list=NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(controller: searchController,
                    type: TextInputType.text,
                    prefix: Icons.search,
                    lable: 'Search',
                    onEditing: (){
                      NewsCubit.get(context).getSearch(searchController.text);
                    },
                    validate: (String value){
                        if(value.isEmpty){
                          return 'Search must not be Empty';
                        }
                        return null;
                    }
                    )
              ),
              Expanded(child: articaleBuildewr(list, context,isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
