package com.hm.poc.SpringSecurityPoc.api;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/greet")
    public String greet(HttpServletRequest request) {
        return "Hello and Welcome " + request.getSession().getId();
    }
}
