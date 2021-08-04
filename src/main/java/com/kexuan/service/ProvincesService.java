package com.kexuan.service;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kexuan.bean.ProvincesInfo;
import com.kexuan.dao.ProvincesDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.JedisPool;

import java.util.List;

@Service
public class ProvincesService {
  @Autowired
    private ProvincesDao dao;
    @Autowired
    private JedisPool jedisPool;
    public String findall(){
        String s = jedisPool.getResource().get("provinces");
        if (s==null){
            List<ProvincesInfo> list = dao.findall();
            ObjectMapper om=new ObjectMapper();
            try {
                s = om.writeValueAsString(list);
                jedisPool.getResource().set("provinces",s);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
            System.out.println("现在使用redis缓存");
        }
        return s;
    }
}
