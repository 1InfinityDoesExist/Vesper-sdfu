import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


public class RegisterDao
{
	public boolean saveDetails( String uname, String pass)
	{		
       DBRegister reg = new DBRegister();
       reg.setUsername(uname);
       reg.setPassword(pass);
        
	    boolean flag=true;
	    
	    Configuration cfg = new Configuration();
	    cfg.configure("hibernate.cfg.xml");
	    SessionFactory factory = cfg.buildSessionFactory();
	    Session session=factory.openSession();
	       
	    Transaction transaction=session.beginTransaction();
	      try
	      {
	          session.save(reg);
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
