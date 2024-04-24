package com.uniandes.sistransg81.controller;

import com.uniandes.sistransg81.model.Office;
import com.uniandes.sistransg81.model.ServicePoint;
import com.uniandes.sistransg81.model.User;
import com.uniandes.sistransg81.repository.OfficeRepository;
import com.uniandes.sistransg81.repository.ServicePointRepository;
import com.uniandes.sistransg81.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@Controller
@RequestMapping("/service-points")
public class ServicePointController {

    private final ServicePointRepository ServicePointRepository;

    private final UserRepository userRepository;

    private final OfficeRepository officeRepository;

    public ServicePointController(
            ServicePointRepository ServicePointRepository, OfficeRepository officeRepository, UserRepository userRepository) {
        this.ServicePointRepository = ServicePointRepository;
        this.officeRepository = officeRepository;
        this.userRepository = userRepository;
    }

    @GetMapping()
    public String servicePoints(Model model) {
        model.addAttribute("servicePoints", ServicePointRepository.findAll());
        return "servicePoints";
    }

    @GetMapping("/{id}/delete")
    public String deleteServicePoint(@PathVariable Long id) {
        ServicePointRepository.deleteById(id);
        return "redirect:/service-points";
    }

    @GetMapping("/new")
    public String newServicePoint(Model model) {
        ArrayList<String> types = new ArrayList<>();
        types.add("PHYSICAL");
        types.add("DIGITAL");
        model.addAttribute("types", types);
        ServicePoint servicePoint = new ServicePoint();
        servicePoint.setEmployee(new User());
        servicePoint.setOffice(new Office());
        model.addAttribute("offices", officeRepository.findAll());
        model.addAttribute("cashiers", userRepository.findCashiers());
        model.addAttribute("servicePoint", servicePoint);
        return "newServicePoint";
    }

    @PostMapping("/new/save")
    public String saveServicePoint(@ModelAttribute ServicePoint servicePoint) {
        System.out.println(servicePoint);
        if  (servicePoint.getOffice().getId() == 0) {
            servicePoint.setOffice(null);
        }
        if (servicePoint.getEmployee().getId() == 0) {
            servicePoint.setEmployee(null);
        }
        ServicePointRepository.save(servicePoint);
        return "redirect:/service-points";
    }
}
