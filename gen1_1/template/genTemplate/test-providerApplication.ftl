package ${paramMap.packageName}.test.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.minstone.platform.Application;

/**
 * Created by mazp on 2016/12/1.
 */
@SpringBootApplication
public class ${paramMap.modelName}ProviderApplication {

    protected static Logger logger = LoggerFactory.getLogger(${paramMap.modelName}ProviderApplication.class);

    public static void main(String[] args){
        logger.info("CommonProviderApplication Begin.");
        SpringApplication.run(Application.class, args);
        logger.info("CommonProviderApplication Loaded.");
    }
}
