void main() async {
  print('Requesting Order!');
  // WAIT

  var order = await fetchUserOrder();
  print(order);

  print('CODE AFTER FETCH USER ORDER!');
}

String createOrderMessage() {
  // fetchUserOrder amazon shipment
  var order = fetchUserOrder();

  return 'Customer order was: $order';
}

Future<String> fetchUserOrder() =>
    Future.delayed(const Duration(seconds: 5), () => '123');
