package com.packt.webstore.controller;


import com.packt.webstore.domain.GameProcess;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

@Controller
public class WelcomePageController {

    private static Map<String, GameProcess> waitingGames = new HashMap<>();

    @RequestMapping("/")
    public String welcome(Model model) {
        model.addAttribute("greeting", "Welcome to Web Store!");
        model.addAttribute("tagline", "The one and only amazing");
        model.addAttribute("waitingGames", waitingGames);

        return "welcome";
    }

    @RequestMapping(value = "/createGame", method = RequestMethod.GET)
    public String createGame(@RequestParam("gamename") String gameName, Model model) {
        GameProcess gameProcess = new GameProcess();
        waitingGames.put(gameName, gameProcess);

        model.addAttribute("notification", "Game " + gameName + " will started soon");
        model.addAttribute("status", "waiting for opponent");

        return "game";
    }

    @RequestMapping("/enterForGame")
    public String enterForGame(@RequestParam("gamename") String gameName, Model model) {
        waitingGames.remove(gameName);
        model.addAttribute("notification", "YEAH");
        model.addAttribute("status", "game is started...");
        return "game";
    }
}
