package com.kexuan.controller;

import com.kexuan.service.ProvincesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProvincesController {
    @Autowired
    private ProvincesService service;
    @ResponseBody
    @RequestMapping(value = "/findprovinces" , produces = "text/json;charset=utf-8")
    public String findprovinces(){
        String s = service.findall();
        return s;
    }@RequestMapping("/S")
    public String S(){
        return "provise_ui";
    }
}
