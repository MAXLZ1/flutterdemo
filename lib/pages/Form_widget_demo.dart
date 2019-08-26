import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormWidgetDemo extends StatefulWidget{
  @override
  _FormWidgetDemoState createState() => _FormWidgetDemoState();
}

class _FormWidgetDemoState extends State<FormWidgetDemo>{
  bool _checkBoxValue = false;
  Color _checkColor = Colors.grey;
  bool _switchValue = true;
  String _radioValue = '男';
  List checkboxList;
  String _radioListTitleValue;
  bool _switchListTitleValue = false;
  double _sliderValue = 0.2;
  double _sliderValue2 = 1;


  List<Widget> _getCheckboxListTitle() {
    return checkboxList.map((item) =>
      Flexible(
        child: CheckboxListTile(
          title: Text(item['text']),
          subtitle: Text(item['text']),
          value: item['value'],
          activeColor: Colors.cyanAccent,
          secondary: Icon(Icons.add),
          isThreeLine: false,
          dense: false,
          selected: false,
          controlAffinity: ListTileControlAffinity.trailing,
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
            subtitle: Text(item['text']),
            secondary: Icon(Icons.add),
            isThreeLine: false,
            dense: false,
            selected: false,
            value: item['text'],
            controlAffinity: ListTileControlAffinity.platform,
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
        child: ListView(
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
                  activeColor: Colors.green,
                  checkColor: Colors.red,
                  tristate: true,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (data) {
                    print(data);
                    setState(() {
                      this._checkBoxValue = data;
                      data == true || data !=null ? this._checkColor = Theme.of(context).primaryColor :
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
                children: _getCheckboxListTitle()
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
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (data){
                    setState(() {
                      _radioValue = data;
                    });
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
              children: _getRadioListTitle(),
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
                  activeColor: Colors.green,
                  activeTrackColor: Colors.green[90],
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey,
                  activeThumbImage: AssetImage('assets/images/ball.png'),
                  inactiveThumbImage: AssetImage('assets/images/ball.png',),
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  dragStartBehavior: DragStartBehavior.start,
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
                Flexible(
                  child: SwitchListTile(
                    value: _switchListTitleValue,
                    title: Text('SwitchListTile'),
                    subtitle: Text('subtitle'),
                    secondary: Icon(Icons.close),
                    isThreeLine: false,
                    dense: false,
                    selected: true,
                    activeColor: Colors.deepPurpleAccent,
                    onChanged: (data){
                      setState(() {
                        this._switchListTitleValue = data;
                      });
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: <Widget>[
                Text('Slider'),
                Slider(
                  value: _sliderValue,
                  onChanged: (data){
                    print('change:$data');
                    setState(() {
                      this._sliderValue = data;
                    });
                  },
                  onChangeStart: (data){
                    print('start:$data');
                  },
                  onChangeEnd: (data){
                    print('end:$data');
                  },
                  min: 0.0,
                  max: 10.0,
                  divisions: 10,
                  label: '$_sliderValue',
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  semanticFormatterCallback: (double newValue) {
                    return '${newValue.round()} dollars}';
                  },
                )
              ],
            ),
            SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 4.0,
                    activeTrackColor: Colors.green,
                    inactiveTrackColor: Colors.grey,
                    disabledActiveTrackColor: Colors.red,
                    disabledInactiveTrackColor: Colors.black,
                    //activeTickMarkColor: Colors.green,
                    //inactiveTickMarkColor: Colors.grey,
                    thumbColor: Colors.cyanAccent,
                    overlappingShapeStrokeColor: Colors.red,
                    disabledThumbColor: Colors.yellow,
                    overlayColor: Colors.deepPurpleAccent,
                    valueIndicatorColor: Colors.deepOrangeAccent,
                    overlayShape: RoundSliderOverlayShape(
                      overlayRadius: 20.0
                    ),
                    tickMarkShape: RoundSliderTickMarkShape(
                        tickMarkRadius:3.0
                    ),
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 12.0,
                      disabledThumbRadius: 12.0
                    ),
                    valueIndicatorTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0
                    ),
                    showValueIndicator: ShowValueIndicator.always,
                  ),
                  child: Slider(
                    value: _sliderValue2,
                    onChanged: (data){
                      setState(() {
                        this._sliderValue2 = data;
                      });
                    },
                    min: 0.0,
                    max: 10.0,
                    label: '$_sliderValue2',
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}