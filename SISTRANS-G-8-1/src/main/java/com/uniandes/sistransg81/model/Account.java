package com.uniandes.sistransg81.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "account")
public class Account {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq")
    @SequenceGenerator(name = "seq", sequenceName = "seq", allocationSize = 1)
    private Long id;

    /*
    * id          INT PRIMARY KEY NOT NULL,
    account_number VARCHAR(255) UNIQUE NOT NULL,
    balance     DECIMAL(10, 2) NOT NULL,
    last_transaction TIMESTAMP NOT NULL,
    state      VARCHAR(255) NOT NULL,
    user_id     INT NOT NULL,
    office_id   INT NOT NULL,
    * */
    private String account_number;
    private double balance;
    private String last_transaction;
    private String state;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "office_id")
    private Office office;


}
