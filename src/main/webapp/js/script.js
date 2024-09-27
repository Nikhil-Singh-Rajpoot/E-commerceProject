function add_to_cart(productId, productName, productPrice) {

	let cart = localStorage.getItem("cart");
	if (cart == null) {
		//no cart yet
		let products = [];
		let product = { pId: productId, pName: productName, pQuntity: 1, pPrice: productPrice };
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		console.log("Product added first time:");
	} else {
		//already present product in cart 
		let pcart = JSON.parse(cart);

		let oldProduct = pcart.find((item) => item.pId == productId)

		if (oldProduct) {
			//we have to increse quntity only
			oldProduct.pQuntity = oldProduct.pQuntity + 1;
			pcart.map((item) => {
				if (item.pId == oldProduct.pId) {
					item.pQuntity = oldProduct.pQuntity;
				}
			})
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("Product Quntity incresed:")
		} else {
			//add new Product
			let product = { pId: productId, pName: productName, pQuntity: 1, pPrice: productPrice };
			pcart.push(product);
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("New Product added :")
		}
	}
	updateCart();
}

// Write a function to update cart 
function updateCart() {

	//getting the cart from localStroage
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);

	if (cart == null || cart.length == 0) {
		console.log("Cart dose not exist!! ")
		$(".cart-item").html("( 0 )");
		$(".cart-body").html("<h3> Cart dose not have any items </h3>");
		$(".checkout-btn").attr('disabled',true);
	} else {
		$(".cart-item").html(`( ${cart.length} )`);
		let table = `
					<table class="table table-striped">
								<thead>
								    <tr>
								    <th scope="col">		Item Name    </th>
								     <th scope="col">	Item Price      </th>
								      <th scope="col">	Item Quntity   </th>
								       <th scope="col">	Total Price     </th>
								        <th scope="col">	 Action </th>
								       
								</tr>
								</thead>
					`;

			let totalPrice=0;
		cart.map((item) => {
			table += `
						<tr>
						<td> ${item.pName}</td>
						<td> ${item.pPrice}</td>
						<td> ${item.pQuntity}</td>
						<td> ${item.pPrice * item.pQuntity}</td>
						 <th scope="col"><button onclick='removeItems(${item.pId})' class="btn btn-danger btn-sm">Remove</button></th>
						</tr>
			
							`
							totalPrice += item.pPrice*item.pQuntity;
		})
	
		

		table = table + `<tr><td colspan='5'  class='text-right table-info font-weight-bold m-5'>Total Price : ${totalPrice}</td></tr> 
		</table>`
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled',false);
	}
}

$(document).ready(function() {
	updateCart();
})

//Write a method to remove item form cart 
function removeItems(proId){
	let cart= JSON.parse(localStorage.getItem('cart'));
	let newCart = cart.filter((item)=> item.pId!=proId)
	localStorage.setItem('cart', JSON.stringify(newCart));
	updateCart();
}

//Write a method to go through the checkout page 
function goToCheckout(){
	window.location="checkout.jsp";
}