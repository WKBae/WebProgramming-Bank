package net.wkbae.assignment.wp;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by William on 2016-12-25.
 */
public class User {
	
	final static File USER_DIR = new File(Users.BASE_DIR, "user");
	final static File LOG_DIR = new File(Users.BASE_DIR, "log");
	final static File ACCOUNT_DIR = new File(Users.BASE_DIR, "account");
	
	private String id;
	private String name;
	private String pass;
	private String accountnum;
	
	private TreeSet<Date> loginLog;
	
	private TreeSet<Record> records;
	private long balance;
	
	User(String id) throws IOException {
		this.id = id;
		this.loginLog = new TreeSet<>();
		this.records = new TreeSet<>();
		readFile();
	}
	User(String id, String name, String pass, String accountnum) throws IOException {
		this.id = id;
		this.name = name;
		this.pass = pass;
		this.accountnum = accountnum;
		this.loginLog = new TreeSet<>();
		this.records = new TreeSet<>();
		updateFile();
	}
	
	private void readFile() throws IOException {
		try(BufferedReader br = new BufferedReader(new FileReader(new File(USER_DIR, id + ".txt")))) {
			name = br.readLine();
			id = br.readLine();
			pass = br.readLine();
			accountnum = br.readLine();
		}
		
		readLoginLog();
		readRecords();
	}
	
	private void readLoginLog() throws IOException {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		
		try(BufferedReader br = new BufferedReader(new FileReader(new File(LOG_DIR, id + ".txt")))) {
			String line;
			while((line = br.readLine()) != null) {
				try {
					loginLog.add(df.parse(line));
				} catch(ParseException e) {
					e.printStackTrace();
				}
			}
		} catch (FileNotFoundException ignore) {}
	}
	
	private void saveLoginLog() throws IOException {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss\r\n");
		
		try(BufferedWriter bw = new BufferedWriter(new FileWriter(new File(LOG_DIR, id + ".txt")))) {
			for(Date log : loginLog) {
				bw.write(df.format(log));
			}
		}
	}
	
	public void doLogin() throws IOException {
		loginLog.add(new Date());
		saveLoginLog();
	}
	
	private void readRecords() throws IOException {
		try(BufferedReader br = new BufferedReader(new FileReader(new File(ACCOUNT_DIR, id + ".txt")))) {
			String line = "";
			while((line = br.readLine()) != null) {
				try {
					Record r = Record.from(line);
					if(r != null) records.add(r);
				} catch(ParseException|NumberFormatException e) {
					new Exception("\"" + line + "\" failed to be parsed.", e).printStackTrace();
				}
			}
		} catch (FileNotFoundException ignore) {}
		try {
			this.balance = records.last().getBalance();
		} catch (NoSuchElementException e) {
			this.balance = 0;
		}
	}
	
	private void saveRecords() throws IOException {
		try (BufferedWriter bw = new BufferedWriter(new FileWriter(new File(ACCOUNT_DIR, id + ".txt")))) {
			for(Record record : records) {
				bw.write(record.toString());
				bw.write("\r\n");
			}
		}
	}
	
	private void updateFile() throws IOException {
		try (BufferedWriter bw = new BufferedWriter(new FileWriter(new File(USER_DIR, id + ".txt")))) {
			bw.write(name);
			bw.write("\r\n");
			bw.write(id);
			bw.write("\r\n");
			bw.write(pass);
			bw.write("\r\n");
			bw.write(accountnum);
			bw.write("\r\n");
		}
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) throws IOException {
		this.id = id;
		updateFile();
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) throws IOException {
		this.name = name;
		updateFile();
	}
	
	public String getPass() {
		return pass;
	}
	
	public void setPass(String pass) throws IOException {
		this.pass = pass;
		updateFile();
	}
	
	public String getAccountnum() {
		return accountnum;
	}
	
	public void setAccountnum(String accountnum) throws IOException {
		this.accountnum = accountnum;
		updateFile();
	}
	
	public long getBalance() {
		return balance;
	}
	
	public long deposit(long amount, String message) throws NotEnoughBalanceException, IOException {
		if(amount < 0) {
			return withdraw(-amount, message);
		}
		
		balance += amount;
		records.add(new Record(this, amount, message));
		saveRecords();
		return balance;
	}
	public long withdraw(long amount, String message) throws NotEnoughBalanceException, IOException {
		if(amount < 0) {
			return deposit(-amount, message);
		}
		if(amount > balance)
			throw new NotEnoughBalanceException("Balance " + balance + " is not enough to withdraw " + amount);
		
		balance -= amount;
		records.add(new Record(this, -amount, message));
		saveRecords();
		return balance;
	}
	
	public SortedSet<Record> getRecords() {
		return Collections.unmodifiableSortedSet(records);
	}
	
	public SortedSet<Date> getLoginLog() {
		return Collections.unmodifiableSortedSet(loginLog);
	}
	public static class NotEnoughBalanceException extends Exception {
		public NotEnoughBalanceException() {
		}
		
		public NotEnoughBalanceException(String message) {
			super(message);
		}
	}
	
}
