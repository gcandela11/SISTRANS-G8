package com.uniandes.sistransg81.controller;

import com.uniandes.sistransg81.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/accounts")
public class AccountController {

    private final AccountRepository accountRepository;

    public AccountController(AccountRepository accountRepository) {
        this.accountRepository = accountRepository;
    }

    @GetMapping()
    public String index() {
        return "accounts";
    }

    @GetMapping("/new")
    public String newAccount() {
        return "newAccount";
    }
}
