import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class Imagedisplay extends StatefulWidget {
  final String img;
  const Imagedisplay({super.key, required this.img});

  @override
  State<Imagedisplay> createState() => _ImagedisplayState();
}

class _ImagedisplayState extends State<Imagedisplay> {
  bool hide = true;
  String? selectedAction;

 
  void _onDropdownItemSelected(String? value) {
    if (value == 'info') {
      //TODO implement info for task with image path
    } else if (value == 'delete') {
      // Show confirmation dialog before hiding the image
      _showDeleteConfirmationDialog();
    }
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title:  Text('Confirm Delete',style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontFamily: 'Neucha'),),
          content:  Text('Are you sure you want to delete this image?',style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontFamily: 'Neucha'),),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(ctx); // Close the dialog
              },
              child:  Text('Cancel',style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontFamily: 'Neucha'),),
            ),
            TextButton(
              onPressed: () {
                // Confirm delete (hide the image)
                setState(() {
                  //TODO change correct to image
                  if (widget.img == 'assets/images/level1/two.jpg') {
                    hide = false;
                  }
                });
                Navigator.of(ctx).pop();
              },
              child:  Text('Yes',style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontFamily: 'Neucha',color: Colors.red)),
            ),
          ],
        );
      },
    );
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
                _onDropdownItemSelected(newValue); // Handle the selection
              });
            },
            items: [
              DropdownMenuItem<String>(
                value: 'info',
                child: Text(
                  'Info',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontFamily: 'Neucha'),
                ),
              ),
              DropdownMenuItem<String>(
                value: 'delete',
                child: Text(
                  'Delete',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontFamily: 'Neucha'),
                ),
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
            hide ? widget.img : 'assets/images/hidden.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
