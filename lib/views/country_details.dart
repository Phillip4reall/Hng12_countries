import 'package:flutter/material.dart';
import 'package:hng12country/widget/row_details.dart';

import '../models/datamodel.dart';


class CountryDetails extends StatefulWidget {
  final Country country;
  const CountryDetails({super.key,required this.country});

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        //backgroundColor:Theme.of(context).colorScheme.background,
        title:  Center(child: Text(widget.country.name,)),),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(15, 5, 15, 15), child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         SizedBox(
          width: double.infinity,
          child: Image.network(widget.country.flag)),
       
          const SizedBox(height: 5,),
           Details_row(name:'Full Name:',desp: widget.country.fullName!,),
          const SizedBox(height: 5,),
          const SizedBox(height: 5,),
          Details_row(name:'Capital:',desp: widget.country.capital,),
            const SizedBox(height: 15,),
              const SizedBox(height: 5,),
          Details_row(name:'Population:',desp: widget.country.population,),
         
            const SizedBox(height: 5,),
          Details_row(name:'Currency:',desp: widget.country.currency,),
            const SizedBox(height: 5,),
          Details_row(name:'Phone code:',desp: widget.country.phoneCode,),
            const SizedBox(height: 5,),
          Details_row(name:'Continent:',desp: widget.country.continent!,),
        
        ],
      ),)),),
    );
  }
}

