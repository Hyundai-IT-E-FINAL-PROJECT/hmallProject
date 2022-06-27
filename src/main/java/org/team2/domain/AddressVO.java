package org.team2.domain;

import lombok.Data;

import java.util.Date;

@Data
public class AddressVO {

    private int user_address_seq;
    private int user_seq;
    private String user_address_address1;
    private String user_address_address2;
    private String user_address_address3;

//    private String user_name;
//    private String user_phone;
//
    private String user_address_name;
    private String user_address_phone_num;

    private Long basic_address;

    private Date created_at;
    private Date updated_at;
    private int user_basic_address;
}
