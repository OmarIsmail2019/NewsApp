import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/module/webView/Web_View.dart';

Widget buildArticalItem(article,context)=>InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']),);
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                )
            ),
          ),
          SizedBox(width: 15.0,),
          Expanded(
            child: Container(
              height: 120,
              padding: EdgeInsets.all(13),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text('${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text('${article['publishedAt']}',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey,
      ),
    ),
  ),
);

Widget myDivior()=>Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey,
);

Widget articaleBuildewr(list,context,{isSearch=false})=>ConditionalBuilder(
  condition:list.length>0,
  builder: (context)=>ListView.separated(itemBuilder:(context,index)=>buildArticalItem(list[index],context),
    separatorBuilder: (context,index)=>myDivior(),
    itemCount: list.length,
    physics: BouncingScrollPhysics(),
  ),
  fallback: (context)=>isSearch? Container() :Center(child: CircularProgressIndicator()),);

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  bool isPassword=false,
  @required IconData prefix,
  @required String lable,
  @required Function validate,
  Function suffixPressed,
  Function onTap,
  IconData sufix,
  Function onChange,
  Function onEditing,
  TextStyle style,
})=> TextFormField(
    controller: controller,
    obscureText: isPassword,
    onTap:onTap,
    onChanged: onChange,
    keyboardType: type,
    validator:validate,
    onEditingComplete:onEditing,
    decoration: InputDecoration(
      labelText: lable,
      prefixIcon: Icon(
        prefix,
      ),
      suffixIcon: sufix!=null? IconButton(
        onPressed: suffixPressed,
        icon: Icon(
          sufix,
        ),
      ):null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ));

void navigateTo(context,widget)=>Navigator.push(
  context,
  MaterialPageRoute(builder: (context)=>widget),
);