package com.lms.hexa.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class ExecFileRunTime {
	
	public void pyhtonisfun(){
		try {
			Process p = Runtime.getRuntime().exec("C:\\Users\\jung\\oxygen-workspae\\HEXAA\\src\\main\\webapp\\resources\\batch\\TEST.bat");

			BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
			String line = null;

			while ((line = br.readLine()) != null) {
				System.out.println(line);
			}
		} catch (Exception e) {
			System.err.println(e);
		}
	}
}