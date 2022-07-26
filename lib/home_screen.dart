import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;





class HomeScrenn extends StatefulWidget {
  
  HomeScrenn({Key? key}) : super(key: key);

  @override
  State<HomeScrenn> createState() => _HomeScrennState();
}

class _HomeScrennState extends State<HomeScrenn> {
  

  var pokeApi = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  
   List  pokemon = [];
   
     get GifView => null;
   
  @override
  void initState() {
    // TODO: implement initState 
    super.initState();
    if(mounted){
      fetchPokemonData();
    }
  }
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      
      
       resizeToAvoidBottomInset: true,
      
      
      body:
      
       Column(children: [
        
        
        
        
        pokemon != null ?   Expanded(child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:1,
          childAspectRatio: 4,
          )
          , itemCount: pokemon.length,
          itemBuilder: (context, index){
            
            
            return Padding(
              
              
              
              padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
              
              
              child:
             
             
               Card(
                
                
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),

                  
                
                color: Color.fromRGBO(217, 66, 86, 10),
                
                
                
                child: Stack(
                  children: [
                    Positioned(
                        
                      child:Image.asset('imagenes/pokeball.png'),
                      height: 125,
                      left: -5,
                      
                     
                      
                      ),
                      
                      
                    Positioned(
                      top: 40,
                      left: 150,
                      child: Text(
                        pokemon[index]['name'],
                        style:const  TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.white
                         ),
                      ),
                    ),
                    
                    
                    
                    Positioned(
                      left: 22.5,
                      bottom: 4,
                      child: CachedNetworkImage(
                        imageUrl:pokemon[index]['img'],
                        
                        
                        
                        
                      
                        height: 60,
                        fit: BoxFit.fitHeight,),
                        
                        
                        
                
                        ),
                        
                       
                         
                        
                        
                        
                        
                      
                       
                       
                        
                        
                        
                        
                        
                        ]
                        
                          
                ),
                
                
                
            
                
                
                

                
                
              ),
              
              
              
              
              

              
              
              
              
            
              
              
              
              
              
            );
            
            
            
            
            
            
             
            
            
            
          },
          
          
          
          
         
          ),
          
          
          
          )
          
          
          :const Center(
            child:
             CircularProgressIndicator(),
             
          
          ),
          
         
          
          
         

          
          
         
          
          
          
          
          
          
      ]
      
      
      
      
      
      ,),
      
      
      
      
      
      
      
      
      

    );
    
    
  
    
    
    
     
    
    
   
    
    
    
    
    
    
  }
  
  void fetchPokemonData() {
    var url = Uri.https("raw.githubusercontent.com", "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then ((value) {
      
      if(value.statusCode== 200){
      var decodedJsonData = jsonDecode(value.body);
      pokemon = decodedJsonData['pokemon'];
      print(pokemon);
      
      
      
    setState(() {
      
      
    });
    
    
    
    }
    
    

      }
      
   );
   
 
   

  }
  

  

  


  
  
}

