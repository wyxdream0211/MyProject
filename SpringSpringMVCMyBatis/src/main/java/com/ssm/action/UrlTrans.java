package com.ssm.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2016/12/22.
 */
@Controller
public class UrlTrans {

    @RequestMapping("/url2Secrect")
    public String url2Secrect(String url){
        System.out.println(url+"***");
        return "forward:/WEB-INF/manager/"+url;
    }
}
