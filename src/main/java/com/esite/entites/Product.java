package com.esite.entites;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productId;
	private String productName;
	@Column(length = 3000)
	private String productDesc;
	@Column(length = 3000)
	private String productPhoto;
	private int productPrice;
	private int productDiscount;
	private int productQuantity;
	@ManyToOne
	private Category category;

	public Product(int productId, String productName, String productDesc, String productPhoto, int productPrice,
			int productDiscount, int productQuantity, Category category) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productDesc = productDesc;
		this.productPhoto = productPhoto;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQuantity = productQuantity;
		this.category = category;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Product(String productName, String productDesc, String productPhoto, int productPrice, int productDiscount,
			int productQuantity, Category category) {
		super();
		this.productName = productName;
		this.productDesc = productDesc;
		this.productPhoto = productPhoto;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQuantity = productQuantity;
		this.category = category;
	}

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public String getProductPhoto() {
		return productPhoto;
	}

	public void setProductPhoto(String productPhoto) {
		this.productPhoto = productPhoto;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductDiscount() {
		return productDiscount;
	}

	public void setProductDiscount(int productDiscount) {
		this.productDiscount = productDiscount;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productDesc=" + productDesc
				+ ", productPhoto=" + productPhoto + ", productPrice=" + productPrice + ", productDiscount="
				+ productDiscount + ", productQuantity=" + productQuantity + ", category=" + category + "]";
	}
	
	//write a method to calculate discount of the product 
	public int getDiscountPrice(int price) {
		int res =(int) ((this.productDiscount/100.0)*price);
		return price-res;
	}
}
