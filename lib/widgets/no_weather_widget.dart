import 'package:flutter/material.dart';
import 'package:weather_app/pages/search_page.dart';

class NoWeatherWidget extends StatelessWidget {
  const NoWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return const SearchPage();
            }));
          },
          child:const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "there is no weather 😔 start",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              Text(
                'searching now 🔍',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
