package com.uniandes.sistransg81.repository;

import com.uniandes.sistransg81.model.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountRepository extends JpaRepository<Account, String> {
}
