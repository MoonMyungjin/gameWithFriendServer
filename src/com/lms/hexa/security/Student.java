package com.lms.hexa.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.dto.StudentVO;

public class Student implements UserDetails {

	private StudentVO student;

	public Student(StudentVO student) {
		this.student = student;
	}

	public StudentVO getStudentVO() {
		return this.student;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();	
		roles.add(new SimpleGrantedAuthority("test"));
		return roles;
	}

	@Override
	public String getPassword() {
		return student.getPw();
	}

	@Override
	public String getUsername() {
		return student.getId();
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
