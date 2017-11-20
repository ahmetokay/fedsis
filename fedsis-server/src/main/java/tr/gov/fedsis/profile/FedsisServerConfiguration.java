package tr.gov.fedsis.profile;

import com.core.tr.entity.BaseEntity;
import com.tr.core.repository.configuration.RepositoryConfiguration;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * @author bocal
 */
@Configuration
@EnableAutoConfiguration
@ComponentScan(basePackages = "tr")
@EntityScan(basePackages = {"tr"}, basePackageClasses = {BaseEntity.class})
public class FedsisServerConfiguration extends RepositoryConfiguration {

}