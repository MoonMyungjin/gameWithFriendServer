package com.lms.hexa.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.dto.ParentVO;
import com.lms.hexa.dto.StudentVO;

public class Parent implements UserDetails {

	private ParentVO parent;

	public Parent(ParentVO parent) {
		this.parent = parent;
	}

	public ParentVO getParentVO() {
		return this.parent;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();	
		roles.add(new SimpleGrantedAuthority("test"));
		return roles;
	}

	@Override
	public String getPassword() {
		return parent.getPw();
	}

	@Override
	public String getUsername() {
		return parent.getId();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}
}
