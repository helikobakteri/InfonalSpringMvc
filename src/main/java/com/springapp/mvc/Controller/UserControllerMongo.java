package com.springapp.mvc.Controller;

import com.springapp.mvc.Model.User;
import com.springapp.mvc.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import java.sql.SQLException;

@Controller
public class UserControllerMongo {


    @Autowired
    UserService userService;
    @RequestMapping(value = "user",method = RequestMethod.GET)
    public ModelAndView getUser() throws ClassNotFoundException, SQLException {

        ModelAndView mav=new ModelAndView();
        mav.setViewName("index");
        mav.addObject("userList",userService.getAll());

        return mav;
    }


    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String createUser(@ModelAttribute(value = "user") User u) throws SQLException, ClassNotFoundException {
      userService.addUser(u);


        return "redirect:user.html"  ;
    }
    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String deleteUser(@ModelAttribute(value = "user") User u) throws SQLException, ClassNotFoundException {
        userService.deleteUser(u);

        System.out.println("delete");
        return "redirect:user.html"  ;
    }
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public  String updateUser(@ModelAttribute(value = "user") User u,@RequestParam(value = "id") String id) throws SQLException, ClassNotFoundException {

        userService.updateUser(u);


        return "redirect:user.html"  ;
    }
}
