import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            //background image
            image: DecorationImage(
                image: AssetImage("images/background_image.jpg"),
                fit: BoxFit.cover),
          ),
          child: Center( //form
            child: Container(  //white container
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 120.0, bottom: 30.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 246, 241, 241),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),


              child: Form( //login forms
                key: _formKey,
                child: Column(
                  children: <Widget>[

                    const Text('LOGIN'),

                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),

                    const Text('SENHA'),

                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),

                    ElevatedButton(onPressed: (){

                    }, 
                    child: const Text('ENTRAR')),

                    const Divider(
                      color: Colors.black
                    ),

                    TextButton(onPressed: (){
                      
                    }, child: Text('Entrar como Dono'),),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
