
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng12country/provider/themeprovider.dart';
import 'package:hng12country/views/home.dart';
import 'package:provider/provider.dart';

import 'provider/country_provider.dart';


void main(){
  
// Ensures status bar and system navigation controls blends with the app
  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
   runApp( 
    // providers
  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountryProvider()),
        ChangeNotifierProvider(create: (_) => Themeprovider()), // Another provider
      ],
      child: const MyApp(),));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: Provider.of<Themeprovider>(context).themeData,
      debugShowCheckedModeBanner: false,
       home:const HomePage(),
    );
  }
  
}
