package com.lms.hexa.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.lms.hexa.dto.ManagerVO;

public class Manager implements UserDetails {

	private ManagerVO manager;

	public Manager(ManagerVO manager) {
		this.manager = manager;
	}

	public ManagerVO getManagerVO() {
		return this.manager;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();	
		roles.add(new SimpleGrantedAuthority("test"));
		return roles;
	}

	@Override
	public String getPassword() {
		return manager.getPw();
	}

	@Override
	public String getUsername() {
		return manager.getId();
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
