Widget addTransactionBottomSheetBody(assetAmount) {
    return Container(
      height: 2000,
      padding: EdgeInsets.symmetric(
        horizontal: 25,
      ),
      color: Colors.grey[700],
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Account.to.addAsset('title', DateTime.now(), 44);
                    },
                    child: GetBuilder<Account>(
                        // init: Controller(), // use it only first time on each controller
                        builder: (_) => Text(
                              '${Account.to.assetAmount}', //here
                            )),
                  ),
                ],
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Title',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }