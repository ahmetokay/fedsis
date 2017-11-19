package tr.gov.fedsis.profile.repository;

import com.tr.core.repository.repository.jpa.EntityJpaRepository;
import org.springframework.stereotype.Repository;
import tr.gov.fedsis.profile.entity.Country;

/**
 * @author bocal
 */
@Repository
public interface CountryRepository extends EntityJpaRepository<Country> {

}