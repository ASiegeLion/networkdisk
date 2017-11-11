package com.july.networkdisk.web;


import org.apache.struts2.ServletActionContext;  

import javax.servlet.http.HttpSession;  
  


import com.july.networkdisk.vo.State;
import com.opensymphony.xwork2.ActionSupport;  
  
public class FileProgressAction extends ActionSupport{  
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private State state;  
          
    public State getState() {  
        return state;  
    }  
  
    public void setState(State state) {  
        this.state = state;  
    }  
  
  
    @Override  
    public String execute() throws Exception {  
        // TODO Auto-generated method stub  
        HttpSession session=ServletActionContext.getRequest().getSession();  
        this.state=(State)session.getAttribute("state");          
        if(state==null){  
            System.out.println("action is null");  
            state=new State();  
            state.setCurrentItem(0);  
        }else{  
            Double a=Double.parseDouble(state.getReadedBytes()+"");  
            Double b=Double.parseDouble(state.getTotalBytes()+"");            
            double result=a/b*100;  
            state.setRate((int)result);  
            System.out.println("action:"+state.getRate());  
        }  
        
        return "json";  
    }  
}