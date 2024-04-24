package com.uniandes.sistransg81.controller;

import com.uniandes.sistransg81.model.Office;
import com.uniandes.sistransg81.model.User;
import com.uniandes.sistransg81.repository.OfficeRepository;
import com.uniandes.sistransg81.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/offices")
public class OfficeController {
    private final OfficeRepository officeRepository;

    private final UserRepository userRepository;

    public OfficeController(OfficeRepository officeRepository, UserRepository userRepository) {
        this.officeRepository = officeRepository;
        this.userRepository = userRepository;
    }

    @GetMapping
    public String getOffices(Model model) {
        model.addAttribute("offices", officeRepository.findAll());
        return "offices";
    }

    @GetMapping("{id}/delete")
    public String deleteOffice(@PathVariable("id") Long id) {
        officeRepository.deleteById(id);
        return "redirect:/offices";
    }

    @GetMapping("/new")
    public String newOffice(Model model) {
        Office office = new Office();
        office.setManager(new User());
        model.addAttribute("office", office);
        model.addAttribute("managers", userRepository.findOfficeManagers());
        return "newOffice";
    }

    @PostMapping("/new/save")
    public String saveOffice(@ModelAttribute Office office) {
        office.setManager(userRepository.findById(office.getManager().getId()).get());
        officeRepository.save(office);
        return "redirect:/offices";
    }


}
