package com.ssm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/** 
 * 登录认证的拦截器 
 */  
public class LoginInterceptor implements HandlerInterceptor{  
  
    /** 
     * Handler执行完成之后调用这个方法 
     */  
    public void afterCompletion(HttpServletRequest request,  
            HttpServletResponse response, Object handler, Exception exc)  
            throws Exception {  
          
    }  
  
    /** 
     * Handler执行之后，ModelAndView返回之前调用这个方法 
     */  
    public void postHandle(HttpServletRequest request, HttpServletResponse response,  
            Object handler, ModelAndView modelAndView) throws Exception {  
    }  
  
    /** 
     * Handler执行之前调用这个方法 
     */  
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,  
            Object handler) throws Exception {  
        //获取请求的URL
        String url = request.getRequestURI();  
        
       //获取Session  
        HttpSession session = request.getSession();
        
        if(url.indexOf("login.action")>=0){  
        	session.removeAttribute("preUrl");
            return true;
        }  
        
        String user = (String)session.getAttribute("user");  
        
        if(user != null){
            return true;  
        }
        //不符合条件的，跳转到登录界面  
//        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);  
        session.setAttribute("preUrl", url);
        response.getWriter().print("<html><script type='text/JavaScript'> location.href='"+request.getContextPath()+"/tologin.action'</script></html>");
          
        return false;
    }  
  
}  