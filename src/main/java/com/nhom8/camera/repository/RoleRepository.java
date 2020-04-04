package com.nhom8.camera.repository;

import com.nhom8.camera.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findRoleByName(String roleName);

    @Query("select r from Role r where r.id = :id")
    Role findOneById(@Param(value = "id") Long id);

    Role findByName(String name);
}
