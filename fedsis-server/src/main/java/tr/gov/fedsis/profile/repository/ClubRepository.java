package tr.gov.fedsis.profile.repository;

import com.tr.core.repository.repository.jpa.EntityJpaRepository;
import org.springframework.stereotype.Repository;
import tr.gov.fedsis.profile.entity.Club;

/**
 * @author bocal
 */
@Repository
public interface ClubRepository extends EntityJpaRepository<Club> {

}