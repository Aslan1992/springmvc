package com.packt.webstore.controller;

import com.packt.webstore.domain.GameProcess;
import com.packt.webstore.domain.Item;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
public class GameProcessController {

    private GameProcess currentGameProcess = new GameProcess();
    private boolean secondPlayer = false;

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


}
