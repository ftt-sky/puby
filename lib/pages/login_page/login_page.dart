import 'package:flutter/material.dart';
import 'package:puby/puby_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  String _userID = '';
  String _password = '';
  bool _isChecked;
  IconData _checkIcon;

  void _onLogin() {
    FocusManager.instance.primaryFocus.unfocus();
    final form = _formkey.currentState;
    form.save();

    if (!_isChecked) {
      _showMessageDialog('请同意用户协议和隐私政策');
      return;
    }

    if (_userID == '') {
      _showMessageDialog('账号不可为空');
      return;
    }
    if (_password == '') {
      _showMessageDialog('密码不可为空');
      return;
    }
    SpUtil.putString(StringMacro.userID, _userID);
    SpUtil.putString(StringMacro.passwordID, _password);
    LogUtil.d('密码$_password,账号$_userID');
  }

  void _showMessageDialog(String message) {
    showmessage(message);
  }

  // 修改同意协议的 状态
  void _changeAgreement() {
    if (_isChecked) {
      _checkIcon = Icons.check_box;
    } else {
      _checkIcon = Icons.check_box_outline_blank;
    }
    SpUtil.putBool(StringMacro.agreement, _isChecked);
  }

  @override
  void initState() {
    _isChecked = SpUtil.getBool(StringMacro.agreement);
    _changeAgreement();
    _password = SpUtil.getString(StringMacro.passwordID);
    _userID = SpUtil.getString(StringMacro.userID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaffolWidget();
  }

  Widget _buildScaffolWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录', style: TextStyleMacor.bold16Col333),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30),
            height: 220,
            color: ColorsMacro.getRandomColor(),
          ),
          Form(
            child: Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Card(
                child: Column(
                  children: [
                    _showEmailInput(),
                    Divider(
                      height: 0.5,
                      indent: 16,
                      color: Colors.grey[300],
                    ),
                    _showPasswordInput()
                  ],
                ),
              ),
            ),
            key: _formkey,
          ),
          Container(
            height: 70,
            padding: EdgeInsets.fromLTRB(35, 30, 35, 0),
            child: OutlinedButton(
              style: ButtonStyle(
                  side: MaterialStateProperty.all(
                      BorderSide(color: Colors.orange, width: 1))),
              onPressed: () {
                _onLogin();
              },
              child: Text(
                '登录',
                style: TextStyle(color: Colors.orange, fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 10, 50, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(_checkIcon),
                  onPressed: () {
                    setState(() {
                      _isChecked = !_isChecked;
                      _changeAgreement();
                    });
                  },
                  color: Colors.orange,
                ),
                Expanded(
                    child: RichText(
                        text: TextSpan(
                            text: '我已经详细阅读并同意',
                            style: TextStyle(color: Colors.black, fontSize: 13),
                            children: [
                      TextSpan(
                          text: '《隐私政策》',
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline)),
                      TextSpan(text: '和'),
                      TextSpan(
                          text: '《用户协议》',
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline))
                    ])))
              ],
            ),
          )
        ],
      ),
    );
  }

  // 创建输入账号
  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        style: TextStyleMacor.nor14col333,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: ObjectUtil.isNotEmpty(_userID) ? _userID : '请输入账号',
            icon: Icon(
              Icons.email,
              color: Colors.grey,
            )),
        onSaved: (newValue) => _userID = newValue.trim(),
      ),
    );
  }

  // 创建输入密码
  Widget _showPasswordInput() {
    String name = '';
    if (ObjectUtil.isNotEmpty(_password)) {
      LogUtil.d(_password.length);
      for (var i = 0; i < _password.length; i++) {
        name = name + '*';
      }
    } else {
      name = '请输入密码';
    }
    return Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
        child: TextFormField(
          maxLines: 1,
          obscureText: true,
          autofocus: false,
          style: TextStyleMacor.nor14col333,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: name,
              icon: Icon(
                Icons.lock,
                color: Colors.grey,
              )),
          onSaved: (newValue) => _password = newValue.trim(),
        ));
  }
}
