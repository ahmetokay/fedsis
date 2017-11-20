package tr.gov.fedsis.profile;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.ConfigurableApplicationContext;

/**
 * Hello world!
 */
@SpringBootApplication
public class FedsisServerApplication {

  public static void main(String[] args) {
    SpringApplicationBuilder builder = new SpringApplicationBuilder(FedsisServerApplication.class,
        FedsisServerConfiguration.class);
    ConfigurableApplicationContext run = builder.build().run(args);
    System.out.println("\u001B[32mFEDSIS Server started.\u001B[32m");
  }
}