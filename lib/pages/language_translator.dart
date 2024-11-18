import 'package:flutter/material.dart';
import 'package:translator/translator.dart';



class LanguageTranslator extends StatefulWidget {
  const LanguageTranslator({super.key});

  @override
  State<LanguageTranslator> createState() => _LanguageTranslatorState();
}

class _LanguageTranslatorState extends State<LanguageTranslator> {

  //variable for all text

  var localLang = ['English', 'Bangla', 'Hindi'];
  var orginLang = 'From';
  var destinationLang = 'To';
  var Translator = '';
  TextEditingController languageCont = TextEditingController();

  //google translator


  void translate(String src, String dest, String input) async{
    GoogleTranslator translator = new GoogleTranslator();
    var translation = await translator.translate(
      input,from: src ,to: dest
    );
    setState(() {
      Translator = translation.text.toString();
    });

    if(src=='--' || dest=='--'){
      setState(() {
        Translator = "fail to translate";
      });
    }

  }

  String getLanguageCode(String Language){
    if(localLang=="English"){
      return "en";
    }
    else if(localLang=="Bangla"){
      return "bn";
    }

    else if(localLang=="Hindi"){
      return "hi";
    }

    return"--";
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Language Translator"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueGrey,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 50.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  focusColor: Colors.white,
                  iconDisabledColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  hint: Text(
                      orginLang, style: TextStyle(color: Colors.white),),

                  dropdownColor: Colors.white,
                  icon: Icon(Icons.keyboard_alt_outlined),
                 items: localLang.map((String DropDownBtn){
                   return DropdownMenuItem(child: Text(DropDownBtn),
                   value: DropDownBtn,);
                 }).toList(),
                  onChanged: (String? value ){
                    setState(() {
                      orginLang = value! ;
                    });
                  },
                ),
                SizedBox(width: 40,),
                Icon(Icons.arrow_right_alt_outlined, color: Colors.white,size: 40,),

                DropdownButton(
                  focusColor: Colors.white,
                  iconDisabledColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  hint: Text(
                    destinationLang, style: TextStyle(color: Colors.white),),

                  dropdownColor: Colors.white,
                  icon: Icon(Icons.keyboard_alt_outlined),
                  items: localLang.map((String DropDownBtn){
                    return DropdownMenuItem(child: Text(DropDownBtn),
                      value: DropDownBtn,);
                  }).toList(),
                  onChanged: (String? value ){
                    setState(() {
                      destinationLang = value! ;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 40,),
            Padding(padding: EdgeInsets.all(8),
            child: TextFormField(
              cursorColor: Colors.white,
              autofocus: false,
              style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Please Enter Your Text....',
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.white
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),

                  ),
                  errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 15,),),

              controller: languageCont,
              validator: (value){
                if (value==null || value.isEmpty){
                  return 'please enter the text please';
                }
                return null;
              },
            ),
            ),
            
            Padding(padding: EdgeInsets.all(8), child:ElevatedButton(
              onPressed: (){
                translate(getLanguageCode(orginLang), getLanguageCode(destinationLang),
                languageCont.text.toString());
              }, child: Text("Translate"),),),
            SizedBox(height: 20,),
            Text("\n$Translator", style:
              TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
              fontSize: 15),
            ),

          ],
          ),
        ),
      ),
    );
  }
}
