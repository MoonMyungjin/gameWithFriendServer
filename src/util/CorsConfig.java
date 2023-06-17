package util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Configuration
@EnableWebMvc
public class CorsConfig extends WebMvcConfigurerAdapter{

	   @Override
	    public void addCorsMappings(CorsRegistry registry) {
	        registry.addMapping("/**")
	        	.allowedOrigins("*") // 모든 오리진을 허용합니다.
	            .allowedMethods("GET", "POST", "PUT", "DELETE") // 허용할 HTTP 메소드를 설정합니다.
	            .allowedHeaders("header1", "header2", "header3") // 허용할 헤더를 설정합니다.
	            .allowCredentials(true) // 자격증명(쿠키, 인증 헤더 등)을 허용할지 여부를 설정합니다.
	            .maxAge(3600); // 사전 요청(Preflight)의 유효기간을 설정합니다.
	    }
	   
	   @Override
	    public void addInterceptors(InterceptorRegistry registry) {
	        registry.addInterceptor(new ApiKeyInterceptor()).addPathPatterns("/**");
	    }

	    private static class ApiKeyInterceptor extends HandlerInterceptorAdapter {

	        @Override
	        public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	            String apiKey = request.getHeader("API-Key");
	            if(apiKey == null) {
	            	response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid API Key");
	            	return false; // 유효하지 않은 API 키인 경우 요청을 거부합니다.
	            }
	            if (isValidApiKey(apiKey)) {
	                return true; // 유효한 API 키인 경우 요청 처리를 허용합니다.
	            } else {
	                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid API Key");
	                return false; // 유효하지 않은 API 키인 경우 요청을 거부합니다.
	            }
	        }

	        private boolean isValidApiKey(String apiKey) {
	            // API 키의 유효성을 확인하는 로직을 구현합니다.
	            // 유효한 키인 경우 true를 반환하고, 그렇지 않은 경우 false를 반환합니다.
	        	if(apiKey != null && apiKey.equals("9b16cd1321d748389bbd7e0422de77d0")) {
	        		return true;
	        	} else {
	        		return false;
	        	}
	        }
	    }
}
