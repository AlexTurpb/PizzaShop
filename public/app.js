function something()
{
	var x = window.localStorage.getItem('bbb');
	x = x * 1 + 1;
	window.localStorage.setItem('bbb', x);
	alert(x);
}

function add_to_cart(id)
{
	var sum = 0;
	var key = 'product_' + id;
	var x = window.localStorage.getItem(key);
	x = x * 1 + 1;
	window.localStorage.setItem(key, x);
	Object.keys(localStorage).forEach(key => sum+=((localStorage[key])*1));
 	window.alert(sum);
   
}
