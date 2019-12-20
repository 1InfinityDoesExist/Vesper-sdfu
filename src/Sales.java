import java.sql.Date;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.*;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;
public class Sales 
{
	private int invno;
	private String customerName;
	private String customerAddres;
	/*private String date;*/
	private Date dateoperation;
	private String productName;
	private String serialNumber;
	private Float price;
	private int quantity;
	private Float toatlPrice;
	
	public Sales(){
		
	}

	public Date getDateoperation() {
		return dateoperation;
	}

	public void setDateoperation(Date dateoperation) {
		this.dateoperation = dateoperation;
	}

	public int getInvno() {
		return invno;
	}

	public void setInvno(int invno) {
		this.invno = invno;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerAddres() {
		return customerAddres;
	}

	public void setCustomerAddres(String customerAddres) {
		this.customerAddres = customerAddres;
	}

	/*public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}*/

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Float getToatlPrice() {
		return toatlPrice;
	}

	public void setToatlPrice(Float toatlPrice) {
		this.toatlPrice = toatlPrice;
	}
}
