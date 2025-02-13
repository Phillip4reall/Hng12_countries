import 'package:flutter/material.dart';

// ignore: camel_case_types
class Details_row extends StatelessWidget {
  final String name;
  final String desp;
  const Details_row({
    super.key, required this.name, required this.desp,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         // ignore: deprecated_member_use
         Text(name,style: Theme.of(context).textTheme.bodyText1,),
         const SizedBox(width: 5,),
          Expanded(
            child: Text(maxLines: 3, 
              desp,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w200),),
          ),
      ],
      

    );
  }
}