import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.*;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;
public class VendorDao 
{
	public boolean saveDetails(String pn, String psn, int qr, float ppu, String vn, String date)
	{
        Vendor vendor = new Vendor();
        
      //  vendor.setId(id);
        vendor.setProduct_name(pn);
        vendor.setProduct_serial_number(psn);
        vendor.setQuant_received(qr);
        vendor.setPrice_per_unit(ppu);
        /*vendor.setTotal_price(gt);*/
        vendor.setVendor_name(vn);
       // vendor.setDate(date);
        vendor.setDateoperation(new java.sql.Date(new java.util.Date().getTime()));
        
	    boolean flag=true;
	    
	    Configuration cfg = new Configuration();
	    cfg.configure("hibernate.cfg.xml");
	    SessionFactory factory = cfg.buildSessionFactory();
	    Session session=factory.openSession();
	       
	    Transaction transaction=session.beginTransaction();
	      try
	      {
	          session.save(vendor);
	          transaction.commit();
	      }catch(Exception e)
	      {
	          transaction.rollback();
	          flag=false;
	      }
	      session.close();
	      return flag;
	}
}
