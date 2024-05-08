import 'package:flutter/material.dart';
import 'package:varsata/widget/common_widget.dart';

class modalsheetPage extends StatefulWidget {
  const modalsheetPage({super.key});

  @override
  State<modalsheetPage> createState() => _modalsheetPageState();
}

class _modalsheetPageState extends State<modalsheetPage> {

  final func1 = useCallback((){

  },[]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) => buildSheet(),
                    ),
                child: Text('Open Modal'))
          ],
        ),
      ),
    );
  }

  Widget buildSheet() => DraggableScrollableSheet(
      // initialChildSize: 0.6,
      // minChildSize: 0.4,
      // maxChildSize: 0.8,
      expand: true,
      snap: true,
      builder: (BuildContext context, ScrollController controller) => ListView(
              controller: controller,
              padding: EdgeInsets.all(20),
              children: [
                Text('khgksdgks sdjskjdg ad uuegfsjd df'),
                Text('khgksdgks sdjskjdg ad uuegfsjd df'),
              ]));
}
