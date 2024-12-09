import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class Imagedisplay extends StatefulWidget {
  final String img;
  const Imagedisplay({super.key, required this.img});

  @override
  State<Imagedisplay> createState() => _ImagedisplayState();
}

class _ImagedisplayState extends State<Imagedisplay> {
  bool hide=true;
  String? selectedAction;

  // Function to handle dropdown item click
  void _onDropdownItemSelected(String? value) {
    if (value == 'info') {
      //TODO impliment info for task with image path
    } else if (value == 'delete') {
      if(widget.img=='assets/images/level1/two.jpg')
      {
        setState(() {
          hide=false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 255, 244, 187),
          ),
        ),
        actions: [
          DropdownButton<String>(
            underline: const SizedBox(),
            value: selectedAction,
            icon: const Icon(
              Icons.more_vert,
              color: Color.fromARGB(255, 255, 244, 187),
            ),
            onChanged: (String? newValue) {
              setState(() {
                selectedAction = newValue;
                _onDropdownItemSelected(newValue);  // Handle the selection
              });
            },
            items:  [
              DropdownMenuItem<String>(
                value: 'info',
                child: Text('Info',style: Theme.of(context).textTheme.titleMedium!.copyWith(fontFamily: 'Neucha'),),
              ),
              DropdownMenuItem<String>(
                value: 'delete',
                child: Text('Delete',style: Theme.of(context).textTheme.titleMedium!.copyWith(fontFamily: 'Neucha'),),

              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: PinchZoom(
          child: Image.asset(
            hide?widget.img:'assets/images/hidden.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
