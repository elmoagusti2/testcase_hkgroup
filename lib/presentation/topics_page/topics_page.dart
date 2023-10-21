import 'package:flutter/material.dart';
import '../../commons/colors.dart';
import '../../commons/enum.dart';
import '../../presentation/topics_page/topics_card.dart';

class TopicsPage extends StatelessWidget {
  const TopicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () => Navigator.pop(context),
        ),
        title: const Text(
          'Topics',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: ConstColors.main,
        elevation: 0.0,
      ),
      backgroundColor: ConstColors.main,
      body: SafeArea(
          child: ListView.builder(
        itemCount: Topics.values.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          child: TopicsCard(topics: Topics.values[index].name),
        ),
      )),
    );
  }
}
