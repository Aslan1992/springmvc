package com.packt.webstore.controller;

import com.packt.webstore.domain.GameProcess;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
public class GameProcessController {

    private GameProcess currentGameProcess = new GameProcess();

    @RequestMapping(value = "/toServer", method = RequestMethod.POST)
    @ResponseBody
    public String toServer(@RequestBody GameProcess gameProcess) {
        currentGameProcess = gameProcess;
        return "success";
    }

    @RequestMapping(value = "/fromServer", method = RequestMethod.GET)
    @ResponseBody
    public GameProcess fromServer() {
        return currentGameProcess;
    }


    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String newGame() {
        return "createGame";
    }

    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public String processNewGame(@RequestParam String name, Model model) {
        GameProcess gameProcess = new GameProcess();
        gameProcess.setName(name);
        gameProcess.setStatus("waiting");
        model.addAttribute("newGameProcess", gameProcess);
        WelcomePageController.createdGames.add(gameProcess);
        return "game";
    }

    @RequestMapping(value = "/connectToGame", method = RequestMethod.GET)
    public String connectToGame() {
        return "game";
    }
}
