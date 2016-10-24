package com.hust.technew.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.io.Serializable;
import java.time.ZonedDateTime;
import java.util.HashSet;
import java.util.Set;
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
    @Size(max = 150)
    @Column(name = "title", length = 150, nullable = false)
    private String title;

    @NotNull
    @Size(max = 10000)
    @Column(name = "content", length = 10000, nullable = false)
    private String content;

    @NotNull
    @Size(max = 150)
    @Column(name = "decription", length = 150, nullable = false)
    private String decription;

    @NotNull
    @Size(max = 100)
    @Column(name = "avatar", length = 100, nullable = false)
    private String avatar;

    @NotNull
    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    private Status status;

    @NotNull
    @Column(name = "created_date", nullable = false)
    private ZonedDateTime createdDate;

    @NotNull
    @Column(name = "view", nullable = false)
    private Integer view;

    @OneToMany(mappedBy = "post")
    @JsonIgnore
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    private Set<Comment> comments = new HashSet<>();

    @ManyToMany
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @JoinTable(name = "post_tag",
               joinColumns = @JoinColumn(name="posts_id", referencedColumnName="ID"),
               inverseJoinColumns = @JoinColumn(name="tags_id", referencedColumnName="ID"))
    private Set<Tag> tags = new HashSet<>();

    @ManyToOne
    private Author author;

    @ManyToOne
    private Category category;

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

    public Integer getView() {
        return view;
    }

    public Post view(Integer view) {
        this.view = view;
        return this;
    }

    public void setView(Integer view) {
        this.view = view;
    }

    public Set<Comment> getComments() {
        return comments;
    }

    public Post comments(Set<Comment> comments) {
        this.comments = comments;
        return this;
    }

    public Post addComment(Comment comment) {
        comments.add(comment);
        comment.setPost(this);
        return this;
    }

    public Post removeComment(Comment comment) {
        comments.remove(comment);
        comment.setPost(null);
        return this;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    public Set<Tag> getTags() {
        return tags;
    }

    public Post tags(Set<Tag> tags) {
        this.tags = tags;
        return this;
    }

    public Post addTag(Tag tag) {
        tags.add(tag);
        tag.getPosts().add(this);
        return this;
    }

    public Post removeTag(Tag tag) {
        tags.remove(tag);
        tag.getPosts().remove(this);
        return this;
    }

    public void setTags(Set<Tag> tags) {
        this.tags = tags;
    }

    public Author getAuthor() {
        return author;
    }

    public Post author(Author author) {
        this.author = author;
        return this;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public Category getCategory() {
        return category;
    }

    public Post category(Category category) {
        this.category = category;
        return this;
    }

    public void setCategory(Category category) {
        this.category = category;
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
            ", status='" + status + "'" +
            ", createdDate='" + createdDate + "'" +
            ", view='" + view + "'" +
            '}';
    }
}
