package com.uniandes.sistransg81.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "service_points")
@Data
public class ServicePoint {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq")
    @SequenceGenerator(name = "seq", sequenceName = "seq", allocationSize = 1)
    private Long id;

    private String name;

    @ManyToOne
    @JoinColumn(name = "office_id")
    private Office office;

    @OneToOne
    @JoinColumn(name = "employee_id")
    private User employee;

    private String type;


}
