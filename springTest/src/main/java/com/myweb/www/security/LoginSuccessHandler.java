package com.myweb.www.security;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import com.myweb.www.service.MemberService;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


@Component
@Slf4j
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Getter
	@Setter
	private String authEmail;
	
	@Getter
	@Setter
	private String authUrl;
	
	// redirect 로 데이터를 가져가는 역할
	private RedirectStrategy rdstg = new DefaultRedirectStrategy();
	// 실제 로그인 정보, 경로 등을 저장해서 rdstg가 가지고 감 
	private RequestCache reqCache = new HttpSessionRequestCache();
	
	@Inject
	private MemberService msv;
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		setAuthEmail(authentication.getName()); // 권한을 가지는 객체의 이메일의 네임
		setAuthUrl("/board/list"); //성공후 경로
		
		boolean isOk = msv.updateLastLogin(getAuthEmail()); // 마지막 로그인 정보 띄우기
		
		//이미 세션의 저장된 정보
		HttpSession ses = request.getSession();
		if(!isOk || ses == null) {
			return;
		}else {
			ses.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION); // 인증 실패에 대한 익셉션
		}
		SavedRequest saveReq = reqCache.getRequest(request, response);
		rdstg.sendRedirect(request, response, (saveReq != null ? saveReq.getRedirectUrl() : getAuthUrl()));
		

	}

}
