<%@page import="java.util.Calendar"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Date today = new Date();
SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
SimpleDateFormat sdf2 = new SimpleDateFormat("MM월 dd일");

String titleDate = sdf1.format(today);

Date day = null;
try {
	day = sdf1.parse(titleDate);
} catch (java.text.ParseException e) {
	e.printStackTrace();
}
String nowDate = sdf2.format(today);

Calendar cal1 = new GregorianCalendar(Locale.KOREA);
cal1.setTime(day);
cal1.add(Calendar.DATE,1);
String tomorrow = sdf1.format(cal1.getTime());
String day1 = sdf2.format(cal1.getTime());

Calendar cal2 = new GregorianCalendar(Locale.KOREA);
cal2.setTime(day);
cal2.add(Calendar.DATE,2);
String after = sdf1.format(cal2.getTime());
String day2 = sdf2.format(cal2.getTime());

Calendar cal3 = new GregorianCalendar(Locale.KOREA);
cal3.setTime(day);
cal3.add(Calendar.DATE,3);
String day3 = sdf2.format(cal3.getTime());

Calendar cal4 = new GregorianCalendar(Locale.KOREA);
cal4.setTime(day);
cal4.add(Calendar.DATE,4);
String day4 = sdf2.format(cal4.getTime());

Calendar cal5 = new GregorianCalendar(Locale.KOREA);
cal5.setTime(day);
cal5.add(Calendar.DATE,5);
String day5 = sdf2.format(cal5.getTime());

Calendar cal6 = new GregorianCalendar(Locale.KOREA);
cal6.setTime(day);
cal6.add(Calendar.DATE,6);
String day6 = sdf2.format(cal6.getTime());

Calendar cal7 = new GregorianCalendar(Locale.KOREA);
cal7.setTime(day);
cal7.add(Calendar.DATE,7);
String day7 = sdf2.format(cal7.getTime());

Calendar cal8 = new GregorianCalendar(Locale.KOREA);
cal8.setTime(day);
cal8.add(Calendar.DATE,8);
String day8 = sdf2.format(cal8.getTime());

Calendar cal9 = new GregorianCalendar(Locale.KOREA);
cal9.setTime(day);
cal9.add(Calendar.DATE,9);
String day9 = sdf2.format(cal9.getTime());

Calendar cal10 = new GregorianCalendar(Locale.KOREA);
cal10.setTime(day);
cal10.add(Calendar.DATE,10);
String day10 = sdf2.format(cal10.getTime());
%>
