package com.packt.webstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

//    private String text;

    @RequestMapping("/")
    public String welcome(Model model) {
        model.addAttribute("greeting", "Welcome to Web Store!");
        model.addAttribute("tagline", "The one and only amazing");

        return "welcome";
    }
//    @RequestMapping(value = "/changeText", method = RequestMethod.POST, consumes = "text/plain")
//    public void acceptText(@RequestBody String body) {
//        text = body;
//    }
//
//    @RequestMapping(value = "/getText", method = RequestMethod.GET)
//    @ResponseBody
//    public String stringText() {
//        return text;
//    }
}
