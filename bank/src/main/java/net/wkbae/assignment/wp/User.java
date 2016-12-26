package net.wkbae.assignment.wp;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by William on 2016-12-25.
 */
public class User {
	
	private String id;
	private String name;
	private String pass;
	private String accountnum;
	private long balance;
	
	User(String id) throws IOException {
		this.id = id;
		readFile();
	}
	User(String id, String name, String pass, String accountnum) throws IOException {
		this.id = id;
		this.name = name;
		this.pass = pass;
		this.accountnum = accountnum;
		updateFile();
	}
	
	private void readFile() throws IOException {
		try(FileInputStream fis = new FileInputStream("c:/bankuser/" + id + ".txt")) {
			DataInputStream dis = new DataInputStream(fis);
			
			name = dis.readUTF();
			id = dis.readUTF();
			pass = dis.readUTF();
			accountnum = dis.readUTF();
		}
		
		String balance = "";
		
		try(FileReader fr = new FileReader("C:/bankuser/" + id + "_account.txt");
		    BufferedReader br = new BufferedReader(fr)) {
			String line = "";
			while((line = br.readLine()) != null) {
				String[] split = line.split("\t");
				balance = split[1];
			}
		}
		this.balance = Long.parseLong(balance);
	}
	private void updateFile() throws IOException {
		try (FileOutputStream fos = new FileOutputStream("c:/bankuser/" + id + ".txt");
		     DataOutputStream dos = new DataOutputStream(fos)) {
			
			dos.writeUTF(name);
			dos.writeUTF(id);
			dos.writeUTF(pass);
			dos.writeUTF(accountnum);
			fos.write('\n');
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
	
	public void logSignIn() throws IOException {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss\r\n"); // yyyyMMddHHmmssSSS
		
		try(FileWriter bw = new FileWriter("c:/bankuser/" + id + "_log.txt", true);
		    PrintWriter pw = new PrintWriter(bw, true)) {
			pw.write(df.format(new Date()));
		}
	}
	
	public long getBalance() {
		return balance;
	}
	
	public long deposit(long amount, String message) throws NotEnoughBalanceException, IOException {
		if(amount < 0) {
			return withdraw(-amount, message);
		}
		
		balance += amount;
		logBalanceChange(amount, message);
		return balance;
	}
	public long withdraw(long amount, String message) throws NotEnoughBalanceException, IOException {
		if(amount < 0) {
			return deposit(-amount, message);
		}
		if(amount > balance)
			throw new NotEnoughBalanceException("Balance " + balance + " is not enough to withdraw " + amount);
		
		balance -= amount;
		logBalanceChange(-amount, message);
		return balance;
	}
	
	public static class NotEnoughBalanceException extends Exception {
		public NotEnoughBalanceException() {
		}
		
		public NotEnoughBalanceException(String message) {
			super(message);
		}
	}
	
	private void logBalanceChange(long amount, String message) throws IOException {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss\r\n"); // yyyyMMddHHmmssSSS
		
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
		sb.append("\r\n");
		
		try(FileWriter bw = new FileWriter("c:/bankuser/" + id + "_account.txt", true);
		    PrintWriter pw = new PrintWriter(bw, true)) {
			
			pw.write(sb.toString());
		}
	}
	
}
