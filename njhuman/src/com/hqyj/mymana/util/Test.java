package com.hqyj.mymana.util;

public class Test {

	public static void main(String[] args) {
		MdFive mdf = new MdFive();
		String adminPwd =mdf.countPwd("123", "admin");
		String lisiPwd =mdf.countPwd("123", "lisi");
		System.out.println("用户admin加密后的密码"+adminPwd);
		System.out.println("用户lisi加密后的密码"+lisiPwd);
		

	}

}
