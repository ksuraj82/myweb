package com.learnitguide.util;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import java.util.Date;

public class JwtUtil {

	private static final String SECRET_KEY = "Omnamahshivaya";
	private static final long EXPIRATION_TIME = 3600000;
	
	public static  String generateToken(String username) {
		
		return Jwts.builder()
				.setSubject(username)
				.setExpiration(new Date(System.currentTimeMillis()+ EXPIRATION_TIME))
				.setIssuedAt(new Date())
				.signWith(SignatureAlgorithm.HS256,SECRET_KEY)
				.compact();
		
	}
	
	// Called by JWT FILTER
    public static boolean validateToken(String token) {
        try {
            Jwts.parser().setSigningKey(SECRET_KEY).parseClaimsJws(token);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    
    public static String getUsernameFromToken(String token) {
    	try {
    		String username = Jwts.parser().setSigningKey(SECRET_KEY).parseClaimsJws(token).getBody().getSubject();
    		return username;
    	}
    	catch(Exception e) {
    		return null;
    	}
    }
	
}
