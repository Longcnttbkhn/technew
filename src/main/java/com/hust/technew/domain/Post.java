package com.hust.technew.domain;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.io.Serializable;
import java.time.ZonedDateTime;
import java.util.Objects;

import com.hust.technew.domain.enumeration.Status;

/**
 * A Post.
 */
@Entity
@Table(name = "post")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Post implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotNull
    @Size(min = 10, max = 100)
    @Column(name = "title", length = 100, nullable = false)
    private String title;

    @NotNull
    @Size(min = 100, max = 1000)
    @Column(name = "content", length = 1000, nullable = false)
    private String content;

    @NotNull
    @Size(min = 10, max = 100)
    @Column(name = "decription", length = 100, nullable = false)
    private String decription;

    @NotNull
    @Column(name = "avatar", nullable = false)
    private String avatar;

    @NotNull
    @Column(name = "created_date", nullable = false)
    private ZonedDateTime createdDate;

    @NotNull
    @Min(value = 0)
    @Column(name = "views", nullable = false)
    private Integer views;

    @NotNull
    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    private Status status;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public Post title(String title) {
        this.title = title;
        return this;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public Post content(String content) {
        this.content = content;
        return this;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDecription() {
        return decription;
    }

    public Post decription(String decription) {
        this.decription = decription;
        return this;
    }

    public void setDecription(String decription) {
        this.decription = decription;
    }

    public String getAvatar() {
        return avatar;
    }

    public Post avatar(String avatar) {
        this.avatar = avatar;
        return this;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public ZonedDateTime getCreatedDate() {
        return createdDate;
    }

    public Post createdDate(ZonedDateTime createdDate) {
        this.createdDate = createdDate;
        return this;
    }

    public void setCreatedDate(ZonedDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public Integer getViews() {
        return views;
    }

    public Post views(Integer views) {
        this.views = views;
        return this;
    }

    public void setViews(Integer views) {
        this.views = views;
    }

    public Status getStatus() {
        return status;
    }

    public Post status(Status status) {
        this.status = status;
        return this;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Post post = (Post) o;
        if(post.id == null || id == null) {
            return false;
        }
        return Objects.equals(id, post.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }

    @Override
    public String toString() {
        return "Post{" +
            "id=" + id +
            ", title='" + title + "'" +
            ", content='" + content + "'" +
            ", decription='" + decription + "'" +
            ", avatar='" + avatar + "'" +
            ", createdDate='" + createdDate + "'" +
            ", views='" + views + "'" +
            ", status='" + status + "'" +
            '}';
    }
}
