import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.*;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;
public class SalesDao 
{
	public boolean saveDetails( String customerName, String customerAddres, String date, String productName, String serialNumber, float price, int quantity, float totalPrice)
	{		
        Sales s = new Sales();
       // s.setInvno(invno);
        s.setCustomerName(customerName);
        s.setCustomerAddres(customerAddres);
       /* s.setDate(date);*/
        s.setDateoperation(new java.sql.Date(new java.util.Date().getTime()));
        s.setProductName(productName);
        s.setSerialNumber(serialNumber);
        s.setPrice(price);
        s.setQuantity(quantity);
        s.setToatlPrice(totalPrice);
        
	    boolean flag=true;
	    
	    Configuration cfg = new Configuration();
	    cfg.configure("hibernate.cfg.xml");
	    SessionFactory factory = cfg.buildSessionFactory();
	    Session session=factory.openSession();
	       
	    Transaction transaction=session.beginTransaction();
	      try
	      {
	          session.save(s);
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
