package com.packt.webstore.controller;

import com.packt.webstore.domain.GameProcess;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


@Controller
public class GameProcessController {

    private static List<GameProcess> createdGames = new ArrayList<>();
    private static final String IN_PROGRESS = "in progress";
    private static final String WAITING = "waiting";

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
        return "game";
    }

    @RequestMapping(value = "/connectToGame", method = RequestMethod.GET)
    public String connectToGame(@RequestParam String name) {
        createdGames.stream()
                .filter(gp -> gp.getName().equalsIgnoreCase(name))
                .forEach(gp -> gp.setStatus(IN_PROGRESS));
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

    @RequestMapping(value = "/toServer", method = RequestMethod.POST)
    @ResponseBody
    public String toServer(@RequestBody GameProcess gameProcess) {
        return "success";
    }

    @RequestMapping(value = "/fromServer", method = RequestMethod.GET)
    @ResponseBody
    public GameProcess fromServer() {
        String[][] state = new String[3][3];
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                state[i][j] = "x";
            }
        }

        GameProcess gameProcess = new GameProcess();
        gameProcess.setState(state);

        return gameProcess;
    }
}
