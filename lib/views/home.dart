import 'package:flutter/material.dart';
import 'package:hng12country/provider/themeprovider.dart';
import 'package:hng12country/views/country_details.dart';
import 'package:provider/provider.dart';
import '../provider/country_provider.dart';



class HomePage extends StatefulWidget {
   

  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
 bool ismode =false;
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<CountryProvider>(context, listen: false);
    provider.fetchCountries();
  }

  void _onSearchChanged(String query) {
    final provider = Provider.of<CountryProvider>(context, listen: false);
    provider.searchCountries(query);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CountryProvider>(context);
    return  Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(15, 5, 15, 15), child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                Text('Explore Countries',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Theme.of(context).colorScheme.primary ),),

               TextButton(onPressed: (){
                Provider.of<Themeprovider>(context, listen: false).toggleTheme();
                setState(() {

                  ismode = !ismode;
                });
               // ignore: sized_box_for_whitespace
               }, child:  Container(
                height: 30, width: 120,//color: Colors.white,
                child: Text(ismode ? 'Light mode': 'Dark mode',style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.secondary),))),
         ],) ,
         const SizedBox(height: 5,),
         SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: TextField(
                       onChanged: _onSearchChanged,
                      controller: _searchController,
                      decoration: InputDecoration(
                      suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
                      enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide:  BorderSide(color: Theme.of(context).colorScheme.primary)),
                      hintText: 'search country by name',hintStyle:  TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 16)),),
                  ),
                  const SizedBox(height: 20,),
                  // to fetch the data from api
                  provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : provider.errorMessage != null
                  ? Center(child: Text(provider.errorMessage!))
                  : Expanded(
                      child:  ListView.builder(
              itemCount:  provider.countries.length,
              itemBuilder: (context, index) {
                final country = provider.countries[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  CountryDetails(country: country,)));
                  },
                  child: ListTile(
                    title: Text(country.name),
                    subtitle:Text('Capital: ${country.capital}'), 
                    leading: Image.network(country.flag,scale: 2,),
                    //trailing: Text(country.capital),
                  ),
                );
              },
            )
                    ),
        ],
      ),)),
    );
  }
   
}
