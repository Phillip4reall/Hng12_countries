
class Country {
  final String name;
  final String? fullName;
  final String population;
  final String capital;
  final String flag;
  final String currency;
  final String phoneCode;
  final String? continent;
  
  

  Country({required this.name, required this.fullName,required this.population, required this.capital, required this.flag,required this.currency,
   required this.phoneCode,required this.continent,});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      fullName: json['full_name'],
      population: json['population'],
      capital: json['capital'],
      flag: json['href']['flag'],
      currency: json['currency'],
      phoneCode: json['phone_code'],
      continent: json['continent'],
     
        
    );
  }
}
