package com.uniandes.sistransg81.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "offices")
@Data
public class Office {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq")
    @SequenceGenerator(name = "seq", sequenceName = "seq", allocationSize = 1)
    private Long id;

    /*
    * id          INT PRIMARY KEY NOT NULL,
    name        VARCHAR(50)     NOT NULL,
    address     VARCHAR(50)     NOT NULL,
    city        VARCHAR(50)     NOT NULL,
    region      VARCHAR(50)     NOT NULL,
    postal_code VARCHAR(50)     NOT NULL,
    max_points  INT             NOT NULL,
    manager_id  INT             NOT NULL,
    constraint office_manager_foreign foreign key (manager_id) references users (id)
    * */
    private String name;
    private String address;
    private String city;
    private String region;
    private String postal_code;
    private int max_points;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "manager_id")
    private User manager;

}
