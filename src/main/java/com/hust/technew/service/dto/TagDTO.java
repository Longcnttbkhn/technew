package com.hust.technew.service.dto;

import javax.validation.constraints.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import java.util.Objects;


/**
 * A DTO for the Tag entity.
 */
public class TagDTO implements Serializable {

    private Long id;

    @NotNull
    @Size(min = 0, max = 30)
    private String name;

    @NotNull
    @Min(value = 0)
    private Integer count;


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
    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        TagDTO tagDTO = (TagDTO) o;

        if ( ! Objects.equals(id, tagDTO.id)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }

    @Override
    public String toString() {
        return "TagDTO{" +
            "id=" + id +
            ", name='" + name + "'" +
            ", count='" + count + "'" +
            '}';
    }
}
