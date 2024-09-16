package com.esite.servlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import com.esite.dao.CategoryDao;
import com.esite.entites.Category;
import com.esite.entites.Product;
import com.esite.entites.ProductDao;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String op = request.getParameter("operation");
		if (op.trim().equals("addCat")) {
			// add Category here
			String catTitle = request.getParameter("catName");
			String catDesc = request.getParameter("catDesc");

			Category category = new Category();
			category.setCategoryTitle(catTitle);
			category.setCategoryDescription(catDesc);
			int saveCategory = CategoryDao.saveCategory(category);

			HttpSession session = request.getSession();
			session.setAttribute("message", "Category Added Successful : " + saveCategory);
			response.sendRedirect("admin.jsp");
			return;

		} else if (op.trim().equals("addPro")) {
			// add Product here

			String proName = request.getParameter("proName");
			String proDesc = request.getParameter("proDesc");
			int proPrice = Integer.parseInt(request.getParameter("proPrice"));
			int proDiscount = Integer.parseInt(request.getParameter("proDiscount"));
			int proQuntity = Integer.parseInt(request.getParameter("proQuntity"));
			int catId = Integer.parseInt(request.getParameter("catId"));
			Part part = request.getPart("proPic");

			Product p = new Product();
			p.setProductName(proName);
			p.setProductDesc(proDesc);
			p.setProductPrice(proPrice);
			p.setProductDiscount(proDiscount);
			p.setProductQuantity(proQuntity);

			p.setProductPhoto(part.getSubmittedFileName());

			// get category by Id
			// here
			Category catgeory = CategoryDao.getCategoryById(catId);
			p.setCategory(catgeory);
			// save product here
			ProductDao.saveProduct(p);

			// save product img here
			String path = "F:\\Spark 2.0\\E-CommersSite\\target\\E-CommersSite-0.0.1-SNAPSHOT\\img\\products"+File.separator+part.getSubmittedFileName();
			System.out.println(path);
			

			try {
				// file uploding here
				FileOutputStream fou = new FileOutputStream(path);
				InputStream is = part.getInputStream();
				byte data[] = new byte[is.available()];
				is.read(data);
				// writeing the data
				fou.write(data);
				fou.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			HttpSession session = request.getSession();
			session.setAttribute("message", "Product Added Successfull : ");
			response.sendRedirect("admin.jsp");
			return;
		}
	}

}
