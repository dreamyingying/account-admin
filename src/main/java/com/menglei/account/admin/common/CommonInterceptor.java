package com.menglei.account.admin.common;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
  * @className CommonInterceptor
  * @Description 请求拦截器
  * @date 2018/12/4 16:37
  * @author Menglei（lei.meng@cmgplex.com)
  * @version 1.0
  **/
@Component
public class CommonInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //拦截用户是否登陆
       /* User user = (User)request.getSession().getAttribute("user");
        if (null == user){
            //如果没有登陆
            response.sendRedirect("/login");
            return false;
        }*/
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

        //Controller处理完后，调用此方法
        request.setAttribute("ml!",request.getContextPath());
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

        //页面渲染完毕后调用此方法，通常用来清除某些资源，类似fanilly;
    }
}
