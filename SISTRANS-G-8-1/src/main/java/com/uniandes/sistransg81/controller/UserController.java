package com.uniandes.sistransg81.controller;

import com.uniandes.sistransg81.model.User;
import com.uniandes.sistransg81.model.UserRole;
import com.uniandes.sistransg81.repository.RolRepository;
import com.uniandes.sistransg81.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@Slf4j
@RequestMapping("/users")
public class UserController {
    private final UserRepository userRepository;

    private final RolRepository rolRepository;

    public UserController(UserRepository userRepository, RolRepository rolRepository) {
        this.userRepository = userRepository;
        this.rolRepository = rolRepository;
    }

    @GetMapping
    public String getUsers(Model model) {
        model.addAttribute("users", userRepository.findAll());
        return "users";
    }

    @GetMapping("/new")
    public String newUser(Model model) {
        User user = new User();
        user.setUser_role(new UserRole());
        model.addAttribute("user", user);
        model.addAttribute("roles", rolRepository.findAll());
        return "newUser";
    }

    @PostMapping("/new/save")
    public String saveUser(@ModelAttribute User user) {
        user.setUser_role(rolRepository.findById(user.getUser_role().getId()).get());
        System.out.println(user);
        userRepository.save(user);
        return "redirect:/users";
    }

    @GetMapping("/{id}/delete")
    public String deleteUser(@PathVariable("id") Long id) {
        userRepository.deleteById(id);
        return "redirect:/users";
    }
}
