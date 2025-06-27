package com.hm.poc.SpringSecurityPoc.service;

import com.hm.poc.SpringSecurityPoc.model.CustomUser;
import com.hm.poc.SpringSecurityPoc.model.Users;
import com.hm.poc.SpringSecurityPoc.repo.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Users user = userRepository.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException(username + "not found in DB");
        }
        return new CustomUser(user);
    }
}
