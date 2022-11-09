import 'package:flutter/material.dart';
import 'package:what_is_meal_frontend/product/home_view_vanila/view_model.dart';

class HomeViewStatefull extends StatefulWidget {
  const HomeViewStatefull({super.key});
  @override
  State<HomeViewStatefull> createState() => _HomeViewStatefullState();
}

class _HomeViewStatefullState extends MealVanillaModelView {
  @override
  String? date;

  @override
  void initState() {
    super.initState();
    fetchMeal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yemek Menüsü 🍽'),
        centerTitle: true,
        actions: [IconButton(onPressed: fetchMeal, icon: const Icon(Icons.replay_outlined))],
      ),
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: results.length,
              itemBuilder: ((context, index) => Card(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                  margin: const EdgeInsets.all(6),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Text((results[index]?.date ?? 'there must be an error'),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.lightBlueAccent)),
                        ),
                        const Title(text: 'Öğrenci Oğle Yemeği'),
                        Text((results[index]?.stdLaunch) ?? 'henüz belirlenmedi', textAlign: TextAlign.center),
                        const Title(text: 'Personel Oğle Yemeği'),
                        Text((results[index]?.empLaunc) ?? 'henüz belirlenmedi', textAlign: TextAlign.center),
                        const Title(text: 'Akşam Yemeği ~herkes icin'),
                        Text((results[index]?.dinner) ?? 'henüz belirlenmedi', textAlign: TextAlign.center),
                      ],
                    ),
                  ))),
            ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.lightBlueAccent, fontSize: 18),
    );
  }
}
