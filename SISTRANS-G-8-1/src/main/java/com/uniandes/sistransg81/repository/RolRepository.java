package com.uniandes.sistransg81.repository;

import com.uniandes.sistransg81.model.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RolRepository extends JpaRepository<UserRole, Long> {
}
