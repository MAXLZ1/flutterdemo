import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormDemo extends StatefulWidget{
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo>{
  bool _checkBoxValue = true;
  Color _checkColor = Colors.grey;
  bool _switchValue = true;
  String _radioValue = '男';
  List checkboxList;
  String _radioListTitleValue;
  bool _switchListTitleValue = false;
  double _sliderValue = 0.2;

  List<Widget> _getCheckboxListTitle() {
    return checkboxList.map((item) =>
      Flexible(
        child: CheckboxListTile(
          title: Text(item['text']),
          value: item['value'],
          onChanged: (data){
            setState(() {
              item['value'] = data;
            });
          },
        ),
      )
    ).toList();
  }

  List<Widget> _getRadioListTitle() {
    return checkboxList.map((item) =>
        Flexible(
          child: RadioListTile(
            title: Text(item['text']),
            value: item['text'],
            groupValue: _radioListTitleValue,
            onChanged: (data){
              setState(() {
                _radioListTitleValue = data;
              });
            },
          ),
        )
    ).toList();
  }

  Widget counter(
     BuildContext context,
     {
       int currentLength,
       int maxLength,
       bool isFocused,
     }
   ) {
     return Text(
       '$currentLength of $maxLength characters',
       semanticsLabel: 'character count',
     );
   }

  @override
  void initState() {
    super.initState();
    this.checkboxList = [
      {
        'text': 'Java',
        'value': false
      },
      {
        'text': 'Dart',
        'value': true
      },
      {
        'text': 'PHP',
        'value': false
      }
    ];
    this._radioListTitleValue = checkboxList[0]['text'];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0
        ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
//              controller: TextEditingController(
//                text: 'sdsd'
//              ),
              focusNode: FocusNode(
                skipTraversal: true
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.person_outline),
                prefixIcon: Icon(Icons.person_outline),
                suffixIcon: Icon(Icons.close),
                counterText: 'counter',
                suffixText: 'suffix',
                prefixText: 'prefix',
                hintText: 'hint',
                labelText: 'label',
                helperText: 'hepler',
                //errorText: 'error',
                helperStyle: TextStyle(color: Colors.red),
                hintStyle: TextStyle(color: Colors.green),
                labelStyle: TextStyle(color: Colors.yellow),
                prefixStyle: TextStyle(color: Colors.orange),
                suffixStyle: TextStyle(color: Colors.cyanAccent),
                counterStyle: TextStyle(color: Colors.deepPurpleAccent),
                hintMaxLines: 2,
                hasFloatingPlaceholder: true,
                isDense: false,
                contentPadding: EdgeInsets.all(10.0),
                filled: true,
                fillColor: Colors.grey[100],
                focusColor: Colors.red,
                hoverColor: Colors.cyanAccent,
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.red
                    )
                ),
//                OutlineInputBorder(
//                  borderSide: BorderSide(
//                    color: Colors.red
//                  ),
//                  borderRadius: BorderRadius.all(Radius.circular(10.0))
//                )
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green
                  )
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber
                  )
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.cyan
                  )
                ),
                enabled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black
                  )
                ),
                alignLabelWithHint: false
              ),
              keyboardType: TextInputType.text,
              //textInputAction: TextInputAction.none,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(
                color: Colors.green,
                fontSize: 14.0
              ),
//              strutStyle: StrutStyle(
//                fontWeight: FontWeight.w800
//              ),
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.bottom,
              textDirection: TextDirection.ltr,
              autofocus: false,
              obscureText: false,
              autocorrect: true,
              maxLines: 1,
              readOnly: false,
              expands: false,
              showCursor: true,
              maxLength: 20,
              maxLengthEnforced: false,
              onChanged: (data){
                print('changed:$data');
              },
              onEditingComplete: (){
                print('complete');
              },
              onSubmitted: (data){
                print('submit:$data');
              },
              inputFormatters: [
                // BlacklistingTextInputFormatter(RegExp('[A-Z]'))
                // LengthLimitingTextInputFormatter(3)
              ],
              enabled: true,
              cursorWidth: 1.0,
              cursorRadius: Radius.circular(12.0),
              cursorColor: Colors.green,
              keyboardAppearance: Brightness.light,
              scrollPadding: EdgeInsets.all(10.0),
              //enableInteractiveSelection: false,
              dragStartBehavior: DragStartBehavior.start,
              onTap: (){
                print('tap');
              },
              buildCounter: (
                  BuildContext context,
                  {
                    int currentLength,
                    int maxLength,
                    bool isFocused,
                  }
                  ) {
                return Text(
                  '$currentLength of $maxLength characters',
                  semanticsLabel: 'character count',
                );
              },
            ),
            Row(
              children: <Widget>[
                Text(
                  'CheckBox',
                  style: TextStyle(
                      fontSize: 18.0
                  ),
                ),
                Checkbox(
                  value: _checkBoxValue,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (data) {
                    setState(() {
                      this._checkBoxValue = data;
                      data ? this._checkColor = Theme.of(context).primaryColor :
                      this._checkColor = Colors.grey;
                    });
                  },
                ),
                Text(
                  '篮球',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: _checkColor
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  'Switch',
                  style: TextStyle(
                      fontSize: 18.0
                  ),
                ),
                Switch(
                  value: this._switchValue,
                  onChanged: (data){
                    setState(() {
                      this._switchValue = data;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  'Radio',
                  style: TextStyle(
                      fontSize: 18.0
                  ),
                ),
                Radio(
                  value: '男',
                  groupValue: _radioValue,
                  onChanged: (data){
                    setState(() {
                      _radioValue = data;
                    });
                  },
                ),
                Text(
                  '男',
                  style: TextStyle(
                      fontSize: 18.0
                  ),
                ),
                Radio(
                  value: '女',
                  groupValue: _radioValue,
                  onChanged: (data){
                    setState(() {
                      _radioValue = data;
                    });
                  },
                ),
                Text(
                  '女',
                  style: TextStyle(
                      fontSize: 18.0
                  ),
                ),
              ],
            ),
            Row(
                children: _getCheckboxListTitle()
            ),
            Row(
              children: _getRadioListTitle(),
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: SwitchListTile(
                    value: _switchListTitleValue,
                    title: Text('SwitchListTile'),
                    onChanged: (data){
                      setState(() {
                        this._switchListTitleValue = data;
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text('Slider'),
                Slider(
                  value: _sliderValue,
                  onChanged: (data){
                    setState(() {
                      this._sliderValue = data;
                    });
                  },
                )
              ],
            )
          ],
        ),
      )
    );
  }
}