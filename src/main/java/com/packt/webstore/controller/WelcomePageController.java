package com.packt.webstore.controller;


import com.packt.webstore.domain.GameProcess;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class WelcomePageController {

    public static List<GameProcess> createdGames = new ArrayList<>();

    @RequestMapping("/")
    public String welcome(Model model) {
        model.addAttribute("greeting", "Welcome to Web Store!");
        model.addAttribute("tagline", "The one and only amazing");
        model.addAttribute("createdGames", createdGames);
        return "welcome";
    }
}
