import 'dart:html';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? _dropDownText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        toolbarHeight: 100,
        elevation: 4,
        title: Row(
          children: [
            Text(
              'Diary',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 39),
            ),
            const Text(
              'Book',
              style: TextStyle(color: Colors.green, fontSize: 39),
            ),
          ],
        ),
        actions: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  items: <String>['Latest', 'Earliest']
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ))
                      .toList(),
                  hint: (_dropDownText == null)
                      ? const Text('Select')
                      : Text(_dropDownText!),
                  onChanged: (value) {
                    if (value == 'Latest') {
                      setState(() {
                        _dropDownText = value;
                      });
                    } else if (value == 'Earliest') {
                      setState(() {
                        _dropDownText = value;
                      });
                    }
                  },
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Column(
                      children: const [
                        Expanded(
                          child: InkWell(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  NetworkImage('https://picsum.photos/200/300'),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                        ),
                        Text(
                          'James',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.logout_outlined,
                        size: 19,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
