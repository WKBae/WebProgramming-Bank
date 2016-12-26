package net.wkbae.assignment.wp;

import java.io.*;
import java.sql.Connection;

/**
 * Created by William on 2016-12-25.
 */
public class User {
	
	private String id;
	private String name;
	private String pass;
	private String accountnum;
	
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
}
