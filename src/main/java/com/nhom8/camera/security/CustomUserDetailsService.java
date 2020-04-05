package com.nhom8.camera.security;

import com.nhom8.camera.entity.Role;
import com.nhom8.camera.entity.User;
import com.nhom8.camera.repository.UserRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Set;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    @Autowired
    private UserRepository iUserRepository;

    @Transactional(propagation= Propagation.REQUIRED, readOnly=true, noRollbackFor=Exception.class)
    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        User user = iUserRepository.findByUserNameOrEmail(userName);

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();

        for (Role role : user.getRoles()) {
            grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
        }

        UserDetails userDetail = new CustomUserDetails(user.getUserName(), user.getPassword(), grantedAuthorities);

        BeanUtils.copyProperties(user, userDetail);

        return userDetail;
    }

    @Transactional(propagation= Propagation.REQUIRED, readOnly=true, noRollbackFor=Exception.class)
    public UserDetails loadUserById(Long userId) {
        User user = iUserRepository.findUserById(userId);

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        //Hibernate.initialize(user.getRoles());
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        for (Role role : user.getRoles()) {
            grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
        }

        UserDetails userDetail = new CustomUserDetails(user.getUserName(), user.getPassword(), grantedAuthorities);

        BeanUtils.copyProperties(user, userDetail);

        return userDetail;
    }
}
