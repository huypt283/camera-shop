package com.nhom8.camera.repository;

import com.nhom8.camera.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUserName(String userName);

    @Query("select u from User u where u.id = :id")
    User findUserById(@Param("id") Long id);

    User findUserByEmail(String email);

    @Query("select u from User u where u.email = :email")
    User findByEmail(@Param(value = "email") String email);

    @Query("select u from User u where u.userName = :param or u.email = :param")
    User findByUserNameOrEmail(@Param(value = "param") String param);
}
