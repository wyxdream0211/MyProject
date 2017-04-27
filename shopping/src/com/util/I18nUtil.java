package com.util;

import java.util.*;
//internationalization
public class I18nUtil {

	public static ResourceBundle getResourceBundle(Locale locale){
		ResourceBundle rb = ResourceBundle.getBundle("myproperites", locale);
		return rb;
	}
}
