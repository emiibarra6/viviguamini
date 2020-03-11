import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class home_emergencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                EntryItem(data[index]),
            itemCount: data.length,
          ),
        ));
  }
}

class Entry {
  const Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

// Data to display.
const List<Entry> data = <Entry>[
  Entry(
    'Hospital',
    <Entry>[
      Entry('107',), Entry('02929432142',),
    ],
  ),
  Entry(
    'Bomberos',
    <Entry>[
      Entry('101'),
      Entry('02929432500'),
    ],
  ),
  Entry(
    'Policia',
    <Entry>[
      Entry('101'),
      Entry('Caminera 02929430195'),
      Entry('Comisaria 02929432014'),
      Entry('Investigaciones 02929430148'),
    ],
  ),
  Entry(
    'Mecanicos',
    <Entry>[
      Entry('1'),
      Entry('2'),
    ],
  ),
  Entry(
    'Remises',
    <Entry>[
      Entry('Corta distancia',
      <Entry>[
        Entry('1'),
        Entry('2'),
      ],
),
      Entry(
      'Larga distancia',
        <Entry>[
        Entry('1'),
        Entry('2'),
      ],
      ),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;


  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty)
      return ListTile(title: Text(root.title), onTap: () {
        _called(root.title);
      });
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }

  void _called(var celular) async {
    var url = 'tel: ' + celular;
    if (celular != null) {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}