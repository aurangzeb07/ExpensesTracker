import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';


class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      elevation: 8,
      child: ListTile(
          leading: CircleAvatar(
            radius: 35,
            backgroundColor: Theme.of(context).accentColor,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: FittedBox(
                  child: Text(
                '\₹ ${transaction.amount}',
                style: Theme.of(context).textTheme.headline6,
              )),
            ),
          ),
          title: Text(
            transaction.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(
              DateFormat.yMMMd().format(transaction.date)),
          trailing: MediaQuery.of(context).size.width > 460
              ? FlatButton.icon(
                  icon: Icon(Icons.delete),
                  label: Text('Delete'),
                  textColor: Theme.of(context).errorColor,
                  onPressed: () => deleteTx(transaction.id),
                )
              : IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => deleteTx(transaction.id),
                  color: Theme.of(context).errorColor,
                )),
    );
  }
}
