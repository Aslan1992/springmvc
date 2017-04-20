package com.packt.webstore.domain;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.Arrays;

public class GameProcess {

    private String name;

    private String status;

    @JsonProperty("state")
    private String[][] state;

    @JsonProperty("victoryItems")
    private Item[] victoryItems;

    public String[][] getState() {
        return state;
    }

    public void setState(String[][] state) {
        this.state = state;
    }

    public Item[] getVictoryItems() {
        return victoryItems;
    }

    public void setVictoryItems(Item[] victoryItems) {
        this.victoryItems = victoryItems;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "GameProcess{" +
                "state=" + Arrays.toString(state) +
                ", victoryItems=" + Arrays.toString(victoryItems) +
                '}';
    }
}
