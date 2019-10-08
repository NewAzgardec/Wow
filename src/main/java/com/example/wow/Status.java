package com.example.wow;

import org.springframework.security.core.GrantedAuthority;

public enum Status implements GrantedAuthority {
    Done, InProgress;

    @Override
    public String getAuthority() {
        return name();
    }
}
