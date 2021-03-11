import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  Widget buildHeadline() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade500,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "Casa Bianca, Tarrant come Pelosi e Cortez - Ultima Ora",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
          maxLines: 6,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ],
    );
  }

  Widget buildArticle() {
    return Row(
      children: [
        /// La [Column()], presente all'interno di questo [Expanded()], senza
        /// questo refactoring non si sarebbe potuta espandere correttamente.
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Casa Bianca, Tarrant come Pelosi e Cortez - Ultima Ora",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.grey.shade500,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.dehaze),
          onPressed: () {},
        ),
        title: Text("News"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        /// Padding generale.
        padding: EdgeInsets.all(16),

        /// 1 → [buildHeadline()]
        /// 9 → [buildArticle()]
        itemCount: 1 + 9,
        itemBuilder: (context, index) {
          if (index == 0)
            return buildHeadline();
          else
            return Padding(
              padding: EdgeInsets.only(top: 32),
              child: buildArticle(),
            );
        },
      ),
    );
  }
}
