package net.wkbae.assignment.wp;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by William on 2016-12-25.
 */
public class Users {
	private Users() {}
	
	private static Map<String, User> loadedUsers = new HashMap<>();
	
	private static boolean userExists(String id) {
		return Files.isRegularFile(Paths.get("C:", "bankuser", id + ".txt"));
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
		return user;
	}
	
	public synchronized static boolean removeUser(String id) throws IOException {
		User u = loadedUsers.remove(id);
		if(u == null) {
			return false;
		}
		Files.deleteIfExists(Paths.get("C:", "bankuser", id + ".txt"));
		Files.deleteIfExists(Paths.get("C:", "bankuser", id + "_log.txt"));
		Files.deleteIfExists(Paths.get("C:", "bankuser", id + "_account.txt"));
		return true;
	}
	public synchronized static boolean removeUser(User user) throws IOException {
		return removeUser(user.getId());
	}
}
