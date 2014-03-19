package com.springapp.mvc.Controller;

import com.springapp.mvc.Model.User;
import com.springapp.mvc.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import java.sql.SQLException;

@Controller
public class UserControllerMongo {


    @Autowired
    UserService userService;
    @RequestMapping(value = "userm",method = RequestMethod.GET)
    public ModelAndView getUser() throws ClassNotFoundException, SQLException {

        ModelAndView mav=new ModelAndView();
        mav.setViewName("index");
        mav.addObject("userList",userService.getAll());

        return mav;
    }


    @RequestMapping(value = "savem", method = RequestMethod.POST)
    public String createUser(@ModelAttribute(value = "user") User u) throws SQLException, ClassNotFoundException {
      userService.addUser(u);


        return "redirect:userm.html"  ;
    }
    @RequestMapping(value = "deletem", method = RequestMethod.GET)
    public String deleteUser(@ModelAttribute(value = "user") User u) throws SQLException, ClassNotFoundException {
        userService.deleteUser(u);


        return "redirect:userm.html"  ;
    }
    @RequestMapping(value = "updatem", method = RequestMethod.GET)
    public  String updateUser(@ModelAttribute(value = "user") User u,User n) throws SQLException, ClassNotFoundException {
        userService.updateUser(u);


        return "redirect:userm.html"  ;
    }
}
