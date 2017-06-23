package fr.xebia.clickcount;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.inject.Singleton;

@Singleton
public class Configuration {

    public final String redisHost;
    public final int redisPort;
    public final int redisConnectionTimeout;  //milliseconds

    public Configuration() throws IOException  {
    	Properties prop = getProperties();
  
        redisHost = prop.getProperty("redis.host");       
        redisPort = 6379;
        redisConnectionTimeout = 2000;
    }
    
    private Properties getProperties() throws IOException {
    	Properties prop = new Properties();
    	String propFn = "config.properties";
    	
    	InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFn);
    	 
        if (inputStream != null) {
            prop.load(inputStream);
        } else {
            throw new FileNotFoundException("property file '" + propFn + "' not found in the classpath");
        }
        
        return prop;
    }
}
