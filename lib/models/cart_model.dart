class CartItemList {
	final List<CartItem> items;

	CartItemList({
		this.items,
	});

	factory CartItemList.fromJson(List<dynamic> parsedJson) {
		List<CartItem> items = new List<CartItem>();
		items = parsedJson.map((i)=>CartItem.fromJson(i)).toList();

		return new CartItemList(
			items: items
		);
	}
}

class CartItem {
	String Name;
	int Price;
	int Qty;
	bool Checked;

	CartItem({
		this.Name,
		this.Price,
		this.Qty,
		this.Checked
	});

	factory CartItem.fromJson(Map<String, dynamic> parsedJson){
	    return new CartItem(
	    	Name: parsedJson['name'],
			Price: parsedJson['price'],
			Qty: parsedJson['price'],
			Checked: parsedJson['checked'],
		);
	}
}