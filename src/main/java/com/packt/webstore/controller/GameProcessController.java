package com.packt.webstore.controller;

import com.packt.webstore.domain.GameProcess;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class GameProcessController {

    private static List<GameProcess> createdGames = new ArrayList<>();
    private static final String IN_PROGRESS = "in progress";
    private static final String WAITING = "waiting";
    private Map<String, String> roles = new HashMap<>();

    public static List<GameProcess> getCreatedGames() {
        return createdGames;
    }

    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String newGame() {
        return "createGame";
    }

    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public String processNewGame(@RequestParam String name, Model model) {
        createdGames.add(new GameProcess(name, WAITING));
        model.addAttribute("gameName", name);
        model.addAttribute("player", "creator");
        return "game";
    }

    @RequestMapping(value = "/connectToGame", method = RequestMethod.GET)
    public String connectToGame(@RequestParam String name, Model model) {
        createdGames.stream()
                .filter(gp -> gp.getName().equalsIgnoreCase(name))
                .forEach(gp -> gp.setStatus(IN_PROGRESS));
        model.addAttribute("player", "incomer");
        return "game";
    }

    @RequestMapping(value = "/currentGameProcessInfo", method = RequestMethod.GET)
    @ResponseBody
    public String getCurrentGameProcessInfo(@RequestParam String name) {
        String response = "";
        for (GameProcess gp : createdGames) {
            if (name.equalsIgnoreCase(gp.getName())) {
                response = "Game: " + gp.getName() + "; Status: " + gp.getStatus();
            }
        }
        return response;
    }

    @RequestMapping("/whoMadeStep")
    @ResponseBody
    public String whoMadeStep(@RequestParam String name) {
        return roles.get(name);
    }

    @RequestMapping(value = "/toServer", method = RequestMethod.POST)
    public void toServer(@RequestBody GameProcess incomeGameProcess, @RequestParam String playerRole) {
        for (GameProcess gp : createdGames) {
            if (incomeGameProcess.getName().equalsIgnoreCase(gp.getName())) {
                gp.setState(incomeGameProcess.getState());
                roles.put(gp.getName(), playerRole);
            }
        }
    }

    @RequestMapping(value = "/fromServer", method = RequestMethod.GET)
    @ResponseBody
    public GameProcess fromServer(@RequestParam String name) {
        for (GameProcess gp : createdGames) {
            if(name.equalsIgnoreCase(gp.getName())) {
                if (gp.getState() == null) {
                    gp.setState(new String[3][3]);
                }
                return gp;
            }
        }
        return null;
    }
}
