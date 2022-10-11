package com.project.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity //security를 설정한 클래스라고 정의함
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	// PasswordEncoder : security에서 제공하는 비밀번호 암호화 객체	
	
	@Override
	public void configure(WebSecurity web) throws Exception {
				
		web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/lib/**");
	}
	// WebSecurity : FilterChainProxy를 생성하는 필터
	// web.ignoring().antMatchers : static 디렉터리의 하위 파일은 항상 security가 무시함
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			// 페이지 권한 설정
			//.antMatchers("/securityAdmin/**").hasRole("ADMIN")
			//.antMatchers("/boardList").access("hasRole('USER') or hasRole('ADMIN')")
			.antMatchers("/**").permitAll()
		.and() // 로그인 설정
			.formLogin()
			.loginPage("/login").permitAll() 
			.defaultSuccessUrl("/boardList")
			.permitAll()
		.and() // 로그아웃 설정
			.logout()
			//.logoutRequestMatcher(new AntPathRequestMatcher("/"))// 변경필요
			.logoutSuccessUrl("/login")
			.invalidateHttpSession(true)
		.and() // 403 예외처리 핸들링
			.exceptionHandling().accessDeniedPage("/securityDenied");	// 권한없는 자의 접근
	}
	// HttpSecurity : HTTP 요청에 대한 웹 기반 보안을 구성할 수 있다.

	// 페이지 권한 설정
	// antMatchers() 메서드로 특정 경로를 지정하여 역할에 따른 접근설정을 잡아준다.
	// .antMatchers("/admin/**").hasRole("ADMIN")은 ADMIN롤만 해당 경로로 접근이 가능하다.
	// .antMatchers("/boardList").hasRole("MEMBER")는 MEMBER롤만 접근이 가능하다.
	// .antMatchers("/**").permitAll()는 모든 경로에 대해 모든 구성원이 접근 가능하다.
	
	// 로그인 설정
	// .formLogin() : form기반으로 인증을 하며 기본적으로 HttpSession을 이용한다.
	// .loginPage("/user/login") : 기본 제공 form이 아닌 커스텀 로그인 폼 사용시 사용한다.
	// .defaultSuccessUrl("/user/login/result") : 로그인 성공시 이동되는 페이지, 컨트롤러 매핑이 필요
	// .usernameParameter("파라미터명") : 이 설정으로 파라미터명 변경가능
	
	// 로그아웃 설정
	// 기본적으로 "/logout"에 접근하면 HTTP 세션을 제거
	// .logoutRequestMatcher(new AntPathRequestMatcher("/user/logout"))
	// : 기본으로 다른 url을 사용하는 경우 재정의
	// .invalidateHttpSession(true) : 로그아웃시 HTTP 세션을 제거
	// deleteCookies("KEY명") : 로그아웃시 특정 쿠키 제거
	
	// 예외처리 핸들링
	// .exceptionHandling().accessDeniedPage("/");	
	// : 접근 권한이 없을때 로그인 첫페이지로 이동
	
	/*@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(memberService).passwordEncoder(passwordEncoder());
	}	*/
	// AuthenticationManagerBuilder
	// : 모든 인증이 AuthenticationManager에서 진행되려 그러기 위해 해당 프로퍼티를 사용한다.
	// 인증을 위해서는 userDetailsService로 필요한 정보들을 가져오는데
	// memberService의 UserDetailsService를 implements하여 loadUserByUsername를 구현한다.
}
