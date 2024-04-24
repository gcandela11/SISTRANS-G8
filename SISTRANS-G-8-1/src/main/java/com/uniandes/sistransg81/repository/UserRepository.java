package com.uniandes.sistransg81.repository;

import com.uniandes.sistransg81.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    @Query(nativeQuery = true, value = """
    SELECT U.* FROM USERS U JOIN USER_ROLES UR ON UR.ID = U.USER_ROLE_ID WHERE UR.ROLE_NAME = 'GERENTE DE OFICINA'
""" )
    List<User> findOfficeManagers();

    @Query(nativeQuery = true, value = """
    SELECT U.* FROM USERS U JOIN USER_ROLES UR ON UR.ID = U.USER_ROLE_ID WHERE UR.ROLE_NAME = 'CAJERO'
""" )
    List<User> findCashiers();
}
