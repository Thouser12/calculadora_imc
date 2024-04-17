import '../components/bottom_button.dart';
import '../components/contador.dart';
import '../components/custom_card.dart';
import '../components/gender_content.dart';
import '../components/modal_result.dart';

import '../components/slider_altura.dart';

import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  //M = 1, F = 2
  int genero = 0;
  int altura = 120;
  int peso = 80;
  int idade = 80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        genero = 1;
                      });   
                    },
                    child: CustomCard(
                    
                      active: genero == 1,
                      child: GenderContent(
                        icon: Icons.male,
                        label: 'Masculino',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        genero = 2;
                      });   
                    },
                    child: CustomCard(
                      active: genero == 2,
                      child: GenderContent(
                        icon: Icons.female,
                        label: 'Feminino',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomCard(
              child: SliderAltura(
                altura: altura,
                onChanged: (double novaAltura){
                  setState(() {
                    altura = novaAltura.toInt();
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    child: Contador(
                      valor: peso,
                        mais: (){
                          setState(() {
                            peso = peso ++;
                          });
                        },
                        menos: () {
                          setState(() {
                            peso = peso --;
                          });
                        },
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    child: Contador(
                      valor: peso,
                      mais: (){
                          setState(() {
                            idade ++;
                          });
                        },
                        menos: () {
                          setState(() {
                            idade --;
                          });
                        },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(buttonTitle: 'Calcular IMC'),
        ],
      ),
    );
  }
}
