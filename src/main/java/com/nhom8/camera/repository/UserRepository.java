package com.nhom8.camera.repository;

import com.nhom8.camera.entity.User;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUserName(String userName);

    @Query("select u from User u where u.id = :id")
    User findUserById(@Param("id") Long id);

    @Query("select u from User u where u.id = :id and u.userName <> :username")
    User findUserByIdAndNotAuth(@Param("id") Long id, @Param("username") String username);

    User findUserByEmail(String email);

    @Query("select u from User u where u.email = :email")
    User findByEmail(@Param(value = "email") String email);

    @Query("select u from User u where u.userName = :param or u.email = :param")
    User findByUserNameOrEmail(@Param(value = "param") String param);

    @Query("select u from User u where u.userName <> :username and u.active = true")
    List<User> findUserList(@Param(value = "username") String username, Pageable pageable);

    int countAllByActiveTrue();
}
