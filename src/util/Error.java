package util;

import java.util.Objects;

import org.springframework.http.HttpStatus;

import groovy.transform.builder.Builder;

public class Error {
	
	private HttpStatus code;
	private String message;
	
	@Builder
	public Error(HttpStatus code,String message) {
		this.code = code;
		this.message = message;
	}
	
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Error error = (Error) o;
        return code == error.code && Objects.equals(message, error.message);
    }

    @Override
    public int hashCode() {
        return Objects.hash(code, message);
    }
	
	public HttpStatus getCode() {
		return code;
	}

	public String getMessage() {
		return message;
	}
	
	
}
