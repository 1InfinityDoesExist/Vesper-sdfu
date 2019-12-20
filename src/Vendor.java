import java.io.Serializable;
	import java.sql.Date;
	import javax.persistence.*;
	import org.hibernate.annotations.Generated;
	import org.hibernate.annotations.GenerationTime;
	
public class Vendor 
{
	private int id;
	private String product_name;
	private String product_serial_number;
	private int quant_received; 
	private float price_per_unit; 
	/*private float total_price;*/
	private String vendor_name;
	//private String date;
	private Date dateoperation;
	
	public Vendor(){
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_serial_number() {
		return product_serial_number;
	}

	public void setProduct_serial_number(String product_serial_number) {
		this.product_serial_number = product_serial_number;
	}

	public int getQuant_received() {
		return quant_received;
	}

	public void setQuant_received(int quant_received) {
		this.quant_received = quant_received;
	}

	public float getPrice_per_unit() {
		return price_per_unit;
	}

	public void setPrice_per_unit(float price_per_unit) {
		this.price_per_unit = price_per_unit;
	}
/*
	public float getTotal_price() {
		return total_price;
	}

	public void setTotal_price(float total_price) {
		this.total_price = total_price;
	}
*/
	public String getVendor_name() {
		return vendor_name;
	}

	public void setVendor_name(String vendor_name) {
		this.vendor_name = vendor_name;
	}

	public Date getDateoperation() {
		return dateoperation;
	}

	public void setDateoperation(Date dateoperation) {
		this.dateoperation = dateoperation;
	}

/*	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
*/
	
			
}
