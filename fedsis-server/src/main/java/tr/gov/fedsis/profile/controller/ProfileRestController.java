package tr.gov.fedsis.profile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import tr.gov.fedsis.profile.model.ProfileDto;
import tr.gov.fedsis.profile.service.ProfileService;

/**
 * @author bocal
 */

@RestController
@RequestMapping(value = "/profile")
public class ProfileRestController {

  private ProfileService profileService;

  @Autowired
  public ProfileRestController(ProfileService profileService) {
    this.profileService = profileService;
  }

  @RequestMapping(value = "/create", method = RequestMethod.POST)
  public ResponseEntity<ProfileDto> create(@RequestBody ProfileDto profileDto) {
    return new ResponseEntity<>(profileService.create(profileDto), HttpStatus.OK);
  }

  @RequestMapping(value = "/update", method = RequestMethod.POST)
  public ResponseEntity<ProfileDto> update(@RequestBody ProfileDto profileDto) {
    return new ResponseEntity<>(profileService.update(profileDto), HttpStatus.OK);
  }


  @RequestMapping(value = "/delete", method = RequestMethod.POST)
  public ResponseEntity<Void> delete(@RequestParam("identifier") Long identifier) {
    profileService.delete(identifier);
    return new ResponseEntity<>(HttpStatus.OK);
  }


  @RequestMapping(value = "/find", method = RequestMethod.POST)
  public ResponseEntity<ProfileDto> create(@RequestParam("identifier") Long identifier) {
    return new ResponseEntity<>(profileService.findById(identifier), HttpStatus.OK);
  }

}