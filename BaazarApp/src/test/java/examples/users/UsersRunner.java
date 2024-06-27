package examples.users;

import com.intuit.karate.junit5.Karate;

class UsersRunner {
//    
//    @Karate.Test
//    Karate testUsers() {
//        return Karate.run("examples").relativeTo(getClass());
//    }  
    
    @Karate.Test
    Karate testTags() {
    	return Karate.run("classpath:examples/users").tags("@SN21").relativeTo(getClass());
    	
    }
   
 
}
