package util;


public class HduoResponse<T> {
	private static String RESULT_SUCCESS ="SUCCESS";
	private static String RESULT_FAIL = "ERROR";
	
	private Error error;
	
	private T data;
	
	private String result;
	
	
	public HduoResponse(Error error, T data, String result) {
		this.error = error;
		this.data = data;
		this.result = result;
	}

	public static <T> BodyBuilder<T> create() {
        return new BodyBuilder<>();
    }
	
	public static class BodyBuilder<T> {
        private Error error;
        private String result;

        public BodyBuilder<T> succeed() {
            this.result = RESULT_SUCCESS;
            return this;
        }

        public BodyBuilder<T> fail(Error error) {
            this.result = RESULT_FAIL;
            this.error = error;
            return this;
        }

        public <T> HduoResponse<T> buildWith( T data) {
            return new HduoResponse<T>(error, data, result);
        }
    }

	public static String getRESULT_SUCCESS() {
		return RESULT_SUCCESS;
	}

	public static String getRESULT_FAIL() {
		return RESULT_FAIL;
	}

	public Error getError() {
		return error;
	}

	public T getData() {
		return data;
	}

	public String getResult() {
		return result;
	}
	
	
}
