import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StaggeredAnimation extends StatefulWidget {
  const StaggeredAnimation({super.key});

  @override
  State<StaggeredAnimation> createState() => _StaggeredAnimationState();
}

class _StaggeredAnimationState extends State<StaggeredAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
          child: ListView.builder(
              itemCount: 100,
              itemBuilder: (_, index) {
                return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50,
                      child: FadeInAnimation(
                          child: Container(
                        height: 100,
                        color: Colors.green,
                        //padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(20),
                      )),
                    ));
              })),
    );
  }
}
