import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  const PrimaryButton(
    {
      Key key,
      @required this.child,
      @required this.onPressed
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: onPressed,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2
        )
      ),
      child: child
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  const CustomOutlineButton(
    {
      Key key,
      @required this.child,
      @required this.onPressed
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2
        )
      ),
      onPressed: onPressed,
      child: child
    );
  }
}
