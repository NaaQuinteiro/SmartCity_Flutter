import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart'; // classes que compoem os componentes da tela


main(){
  runApp(Projeto01App());
}

class Projeto01App extends StatelessWidget{
  const Projeto01App ({super.key});

@override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Exemplo navegação duas telas',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home:Projeto01AppScreen(),
    );
  }
  
}
  
  class Projeto01AppScreen extends StatefulWidget{
  const Projeto01AppScreen ({super.key});
  @override
  Projeto01AppState createState() => Projeto01AppState();
    
  }
 


class Projeto01AppState extends State<Projeto01AppScreen>{ // extendes pq e a classe pai

  //constrtuor da claase , sempre vai estanciar aqui ou seja , sempre vai execuatr esse metodo primeiro
  //seta como esses parametros em que se comportar e mapear os vaores

//criando outro metodo , para construir a home
//para criar a classe e carregar os componentes cria o widget

String texto = "Cnstruindo App da Turma";
String localSensor = ''; // Armazena o texto do sensor

final TextEditingController _controller = TextEditingController();// privado //final: e uma contsante que vai defibir dps
  @override
  Widget build(BuildContext context)  {
    return  MaterialApp(
      debugShowCheckedModeBanner: false, //Desativa a tarja de DEBUG
      home: Scaffold(
        appBar:AppBar(
        title: const Text("App da Turma A", style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255,64,60,134),
      ) ,
      body: Center (
        child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text(
            texto,
          style: TextStyle(fontSize: 24)
          ),
          SizedBox(height: 20),
          //Aqui vamos inserir a caixa de texto 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),//Espaço
            child:  TextField(
              controller: _controller, // controlador captura o texto
              decoration: InputDecoration(
                labelText: 'Local do Sensor', // Nome do campo de digitação
                border: OutlineInputBorder(),
              ),    
              maxLength: 20,//Limite de caracteres para digitação
              onChanged: (value) {
                  localSensor = value; //Atualiza variavel ao digitar
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                texto = localSensor.isNotEmpty
                  ? 'Local do Sensor : $localSensor ' //Atuliza o texto ap clicar no botao 
                  : 'Por favor, Insira um local do sensor'; //mensagem se o cmpo estiver vazio 
                  // ? == if e os : == else;
              });
              _controller.clear();
              localSensor = '';
            },//Adicionaremos uma funcao de botao aqui
            style: ElevatedButton.styleFrom(
              minimumSize: Size(200,50),
            ),
            child: Text('Clique aqui'),
             )
        ],
      )
      ),

    //acrescentar o rodape
    bottomNavigationBar: BottomAppBar(
      color: Color.fromARGB(255,64,60,134),//Cor de fundo cinza claro
      child:  Padding(
      padding: const EdgeInsets.all(16.0),
      child:Text(
        'Aqui é o Rodapé',
        textAlign: TextAlign.center,
        

      ),

      ),
    ),
    ),
    );
}
}
