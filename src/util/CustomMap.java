package util;

import java.util.LinkedHashMap;

import com.google.common.base.CaseFormat;

@SuppressWarnings("serial")
public class CustomMap extends LinkedHashMap<String, Object> {
	
	@Override
    public Object put(String key, Object value) {
        return super.put(toLowerCamel((String) key), value);
    }

    private static String toLowerCamel(String key) {
        return CaseFormat.UPPER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL, key);
    }
}
