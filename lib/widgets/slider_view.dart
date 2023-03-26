import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class SliderView extends StatefulWidget {
  double sliderValue;
  TransformationController  transformationController;

  SliderView({required this.sliderValue,required this.transformationController});

  @override
  SliderWidgetState createState() => new SliderWidgetState(sliderValue: sliderValue,transformationController: transformationController);
}

class SliderWidgetState extends State{
  TransformationController  transformationController;
 // int valueHolder = 10;
  double sliderValue;

  SliderWidgetState({required this.sliderValue,required this.transformationController});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            children: [
              Container(
                height: 5,
                  margin: EdgeInsets.only(top: MARGIN_MEDIUM_3),
                  child: Slider(
                      value: sliderValue,//valueHolder.toDouble()
                      min: 0.0,
                      max: 5.0,
                    //  divisions: 10,
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      label: '${sliderValue.round()}',
                      onChanged: (double newValue) {
                        setState(() {
                          transformationController.value = Matrix4.identity()
                            ..scale(sliderValue);
                        });
                      },
                      semanticFormatterCallback: (double newValue) {
                        return '${newValue.round()}';
                      }
                  ),),
              Text('', style: TextStyle(fontSize: 22),//$valueHolder
              )

            ]
        ));
  }
}