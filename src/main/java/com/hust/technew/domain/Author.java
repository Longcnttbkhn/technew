package com.hust.technew.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;
import java.util.Objects;

import com.hust.technew.domain.enumeration.Status;

/**
 * A Author.
 */
@Entity
@Table(name = "author")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Author implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotNull
    @Size(max = 45)
    @Column(name = "name", length = 45, nullable = false)
    private String name;

    @Column(name = "birth_day")
    private LocalDate birthDay;

    @Size(max = 45)
    @Column(name = "address", length = 45)
    private String address;

    @Size(max = 14)
    @Column(name = "phone", length = 14)
    private String phone;

    @Size(max = 45)
    @Column(name = "avatar", length = 45)
    private String avatar;

    @NotNull
    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    private Status status;

    @Size(max = 200)
    @Column(name = "about_me", length = 200)
    private String aboutMe;

    @OneToOne
    @JoinColumn(unique = true)
    private User user;

    @OneToMany(mappedBy = "author")
    @JsonIgnore
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    private Set<Post> posts = new HashSet<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public Author name(String name) {
        this.name = name;
        return this;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getBirthDay() {
        return birthDay;
    }

    public Author birthDay(LocalDate birthDay) {
        this.birthDay = birthDay;
        return this;
    }

    public void setBirthDay(LocalDate birthDay) {
        this.birthDay = birthDay;
    }

    public String getAddress() {
        return address;
    }

    public Author address(String address) {
        this.address = address;
        return this;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public Author phone(String phone) {
        this.phone = phone;
        return this;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public Author avatar(String avatar) {
        this.avatar = avatar;
        return this;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Status getStatus() {
        return status;
    }

    public Author status(Status status) {
        this.status = status;
        return this;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public String getAboutMe() {
        return aboutMe;
    }

    public Author aboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
        return this;
    }

    public void setAboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
    }

    public User getUser() {
        return user;
    }

    public Author user(User user) {
        this.user = user;
        return this;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<Post> getPosts() {
        return posts;
    }

    public Author posts(Set<Post> posts) {
        this.posts = posts;
        return this;
    }

    public Author addPost(Post post) {
        posts.add(post);
        post.setAuthor(this);
        return this;
    }

    public Author removePost(Post post) {
        posts.remove(post);
        post.setAuthor(null);
        return this;
    }

    public void setPosts(Set<Post> posts) {
        this.posts = posts;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Author author = (Author) o;
        if(author.id == null || id == null) {
            return false;
        }
        return Objects.equals(id, author.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }

    @Override
    public String toString() {
        return "Author{" +
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
