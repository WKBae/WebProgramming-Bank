package net.wkbae.assignment.wp;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;

/**
 * Created by William on 2016-12-25.
 */
public class Users {
	private Users() {}
	
	final static File BASE_DIR = new File("C:/bankuser");
	
	private static Map<String, User> loadedUsers;
	private static Set<String> joinedUsers;
	
	static void init() throws IOException {
		BASE_DIR.mkdirs();
		User.USER_DIR.mkdir();
		User.LOG_DIR.mkdir();
		User.ACCOUNT_DIR.mkdir();
		
		loadedUsers = new WeakHashMap<>();
		
		joinedUsers = new TreeSet<>();
		File usersFile = new File(BASE_DIR, "users.txt");
		if(usersFile.isFile()) {
			try(BufferedReader br = new BufferedReader(new FileReader(usersFile))) {
				String user;
				while((user = br.readLine()) != null) {
					joinedUsers.add(user);
				}
			}
		}
	}
	
	private static void writeUsers() throws IOException {
		try (BufferedWriter bw = new BufferedWriter(new FileWriter(new File(BASE_DIR, "users.txt")))) {
			for(String id : joinedUsers) {
				bw.write(id);
				bw.write("\r\n");
			}
		}
	}
	
	private static boolean userExists(String id) {
		return new File(User.USER_DIR, id + ".txt").isFile();
	}
	
	public synchronized static User findUser(String id) throws IOException {
		if(id == null) {
			return null;
		}
		// 유저는 하나씩만 생성해둠
		if(loadedUsers.containsKey(id)) {
			return loadedUsers.get(id);
		}
		
		//File file = new File("c:/bankuser/" + id + ".txt");
		if(userExists(id)) {
			User user = new User(id);
			loadedUsers.put(id, user);
			return user;
		} else {
			return null;
		}
	}
	
	public synchronized static User createUser(String id, String name, String pass, String accountnum) throws IOException {
		if(id == null) {
			throw new IllegalArgumentException("User's id cannot be null");
		}
		if(userExists(id)) {
			return null; // already exists, don't create one.
		}
		
		User user = new User(id, name, pass, accountnum);
		loadedUsers.put(id, user);
		joinedUsers.add(id);
		writeUsers();
		return user;
	}
	
	public synchronized static boolean removeUser(String id) throws IOException {
		if(!joinedUsers.remove(id)) {
			return false;
		}
		writeUsers();
		loadedUsers.remove(id);
		Files.deleteIfExists(User.USER_DIR.toPath().resolve(id + ".txt"));
		Files.deleteIfExists(User.LOG_DIR.toPath().resolve(id + ".txt"));
		Files.deleteIfExists(User.ACCOUNT_DIR.toPath().resolve(id + ".txt"));
		return true;
	}
	public synchronized static boolean removeUser(User user) throws IOException {
		return removeUser(user.getId());
	}
	
	public static Set<String> getUsers() {
		return Collections.unmodifiableSet(joinedUsers);
	}
}
