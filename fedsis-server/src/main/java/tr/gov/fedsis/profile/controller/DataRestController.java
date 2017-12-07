package tr.gov.fedsis.profile.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import tr.gov.fedsis.profile.model.BloodTypeDto;
import tr.gov.fedsis.profile.model.CityDto;
import tr.gov.fedsis.profile.model.CountryDto;
import tr.gov.fedsis.profile.model.CountyDto;
import tr.gov.fedsis.profile.model.GenderDto;
import tr.gov.fedsis.profile.service.DataService;

/**
 * @author bocal
 */
@RestController
@RequestMapping(value = "/data")
public class DataRestController {

  private DataService dataService;

  @Autowired
  public DataRestController(DataService dataService) {
    this.dataService = dataService;
  }

  @RequestMapping(value = "/county", method = RequestMethod.POST)
  public ResponseEntity<List<CountyDto>> county(@RequestParam("identifier") Long pkid) {
    return new ResponseEntity<>(dataService.listCounty(pkid), HttpStatus.OK);
  }

  @RequestMapping(value = "/city", method = RequestMethod.POST)
  public ResponseEntity<List<CityDto>> city(@RequestParam("identifier") Long pkid) {
    return new ResponseEntity<>(dataService.listCity(pkid), HttpStatus.OK);
  }

  @RequestMapping(value = "/country", method = RequestMethod.POST)
  public ResponseEntity<List<CountryDto>> country() {
    return new ResponseEntity<>(dataService.listCountry(), HttpStatus.OK);
  }

  @RequestMapping(value = "/gender", method = RequestMethod.POST)
  public ResponseEntity<List<GenderDto>> gender() {
    return new ResponseEntity<>(dataService.listGender(), HttpStatus.OK);
  }

  @RequestMapping(value = "/blood_type", method = RequestMethod.POST)
  public ResponseEntity<List<BloodTypeDto>> bloodType() {
    return new ResponseEntity<>(dataService.listBloodType(), HttpStatus.OK);
  }
}