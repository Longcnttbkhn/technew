package com.hust.technew.service.dto;

import java.io.Serializable;
import java.util.Objects;

public class AvatarDTO implements Serializable {
	
	private String avatar;

	public AvatarDTO(String avatar) {
		this.avatar = avatar;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	@Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        AvatarDTO avatarDTO = (AvatarDTO) o;

        if ( ! Objects.equals(avatar, avatarDTO.avatar)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(avatar);
    }

    @Override
    public String toString() {
        return "AvatarDTO{" +
            "avatar = " + avatar + 
            '}';
    }
}

