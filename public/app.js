function something()
{
	var x = window.localStorage.getItem('bbb');
	x = x * 1 + 1;
	window.localStorage.setItem('bbb', x);
	alert(x);
}

function add_to_cart(id)
{
	// var sum = 0;
	var key = 'product_' + id;
	var x = window.localStorage.getItem(key);
	x = x * 1 + 1;
	window.localStorage.setItem(key, x);
	window.alert('Items in your cart ' + cart_total());
	update_orders_input();
	update_orders_button();

}

function cart_total()
{
	var cnt = 0;

	for(var i = 0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i);
		var value = window.localStorage.getItem(key);

		if(key.indexOf('product_') == 0)
		{
			cnt = cnt + value * 1;
		}
	}
	return cnt;
}

function update_orders_input()
{
	var orders = cart_get_orders();
	$('#orders_input').val(orders);
}


function update_orders_button()
{
	var text = 'Cart (' + cart_total() +')';
	$('#orders_button').val(text); 	
}


function cart_get_orders()
{
	var orders = '';

	for(var i = 0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i);
		var value = window.localStorage.getItem(key);

		if(key.indexOf('product_') == 0)
		{
			orders = orders + key + '=' + value + ','; 
		}
	}
	return orders;
}

function cancel_order()
{
	alert(aaa);
	return false;
}


// Object.keys(localStorage).forEach(key => sum+=((localStorage[key])*1));
// 	window.alert(sum);