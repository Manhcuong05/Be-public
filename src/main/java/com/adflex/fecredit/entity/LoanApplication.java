package com.adflex.fecredit.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "loan_applications")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoanApplication {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String phone;
    private String cccd;
    private String cmndOld;
    private Long amount;
    private Integer term;
    private Double rate;
    private Long monthlyPayment;
    private Boolean insurance;

    @CreationTimestamp
    @Column(name="created_at", updatable = false)
    private String createdAt;
}
