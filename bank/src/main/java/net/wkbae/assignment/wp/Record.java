package net.wkbae.assignment.wp;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by William on 2016-12-28.
 */
public class Record implements Comparable<Record> {
	
	private Date time;
	private long balance;
	private long amount;
	String message;
	
	private Record() {
		
	}
	
	public Record(User user, long amount, String message) {
		this.time = new Date();
		this.balance = user.getBalance();
		this.amount = amount;
		this.message = message;
	}
	
	public Record(String user, long amount, String message) throws IOException {
		this(Users.findUser(user), amount, message);
	}
	
	public Date getTime() {
		return time;
	}
	
	public long getBalance() {
		return balance;
	}
	
	public long getAmount() {
		return amount;
	}
	
	public String getMessage() {
		return message;
	}
	
	@Override
	public int compareTo(Record o) {
		int timeCompare = time.compareTo(o.time);
		if(timeCompare != 0) {
			return timeCompare;
		} else {
			if(this.balance == o.balance && this.amount == o.amount) {
				return 0;
			} else if(this.balance + this.amount == o.balance) {
				return -1;
			} else if(this.balance == o.balance + o.amount) {
				return 1;
			} else {
				return (int) (this.balance - o.balance);
			}
		}
	}
	
	public static Record from(String formatted) throws ParseException, NumberFormatException {
		String[] splitted = formatted.split("\\s+", 5);
		if(splitted.length < 5) return null;
		
		Record record = new Record();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		record.time = df.parse(splitted[0]);
		record.balance = Long.parseLong(splitted[1]);
		record.amount = Long.parseLong(splitted[3]);
		if("출금".equals(splitted[2])) record.amount = -record.amount;
		record.message = splitted[4];
		
		
		return record;
	}
	
	@Override
	public String toString() {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss"); // yyyyMMddHHmmssSSS
		
		StringBuilder sb = new StringBuilder();
		sb.append(df.format(new Date()));
		sb.append('\t');
		sb.append(balance);
		if(amount >= 0) {
			sb.append("\t입금\t");
			sb.append(amount);
		} else {
			sb.append("\t출금\t");
			sb.append(-amount);
		}
		sb.append('\t');
		sb.append(message);
		return sb.toString();
	}
	
	@Override
	public boolean equals(Object obj) {
		return obj instanceof Record
				&& this.compareTo((Record) obj) == 0;
	}
}
