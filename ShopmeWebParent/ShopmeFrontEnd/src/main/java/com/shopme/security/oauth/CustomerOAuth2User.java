package com.shopme.security.oauth;

import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

public class CustomerOAuth2User implements OAuth2User {
	
	private String clientName;
	private String fullName;
	private OAuth2User oauthUser;

	public CustomerOAuth2User(OAuth2User user, String clientName) {
		this.oauthUser = user;
		this.clientName = clientName;
	}

	@Override
	public Map<String, Object> getAttributes() {
		return oauthUser.getAttributes();
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return oauthUser.getAuthorities();
	}

	@Override
	public String getName() {
		return oauthUser.getAttribute("name");
	}
	
	public String getEmail() {
		return oauthUser.getAttribute("email");
	}

	public String getFullName() {
		return fullName != null ? fullName : oauthUser.getAttribute("name");
	}

	public String getClientName() {
		return clientName;
	}
	
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
}










