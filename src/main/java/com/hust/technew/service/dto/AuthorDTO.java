package com.hust.technew.service.dto;

import java.time.LocalDate;
import javax.validation.constraints.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import java.util.Objects;

import com.hust.technew.domain.enumeration.Status;

/**
 * A DTO for the Author entity.
 */
public class AuthorDTO implements Serializable {

    private Long id;

    @NotNull
    @Size(max = 45)
    private String name;

    private LocalDate birthDay;

    @Size(max = 45)
    private String address;

    @Size(max = 14)
    private String phone;

    @Size(max = 45)
    private String avatar;

    @NotNull
    private Status status;

    @Size(max = 200)
    private String aboutMe;


    private Long userId;
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public LocalDate getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(LocalDate birthDay) {
        this.birthDay = birthDay;
    }
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
    public String getAboutMe() {
        return aboutMe;
    }

    public void setAboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        AuthorDTO authorDTO = (AuthorDTO) o;

        if ( ! Objects.equals(id, authorDTO.id)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }

    @Override
    public String toString() {
        return "AuthorDTO{" +
            "id=" + id +
            ", name='" + name + "'" +
            ", birthDay='" + birthDay + "'" +
            ", address='" + address + "'" +
            ", phone='" + phone + "'" +
            ", avatar='" + avatar + "'" +
            ", status='" + status + "'" +
            ", aboutMe='" + aboutMe + "'" +
            '}';
    }
}
