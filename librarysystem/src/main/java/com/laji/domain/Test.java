package com.laji.domain;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Test {
	public static void main(String[] args) {
//		Date date = new Date();
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
//		System.out.println(simpleDateFormat.format(date));
//		String string = "201812081111";
//		String barcode = "xx";
//		barcode = barcode + string.substring(8);
//		System.out.println(barcode);
//		int a = 1;
//		DecimalFormat decimalFormat = new DecimalFormat("0000");
//		System.out.println(decimalFormat.format(a));
//		int random = (int) (Math.random()*10000);
//		System.out.println(random);
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		System.out.println(date);
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_YEAR,10);//日期加10天
		Date d = calendar.getTime();
		System.out.println(d);
		//返回一个由calendar得到的Date对象
	}
}
