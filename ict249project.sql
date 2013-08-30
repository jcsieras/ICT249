/*******************************************************************************
 * Selected metadata objects
 * -------------------------
 * Extracted at 8/23/2013 4:56:30 PM
 ******************************************************************************/

/*******************************************************************************
 * Tables
 * ------
 * Extracted at 8/23/2013 4:56:30 PM
 ******************************************************************************/

CREATE TABLE student (
  stud_id                 Integer(5) NOT NULL AUTO_INCREMENT,
  stud_fname              Text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  stud_lname              Text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  stud_mname              Text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  stud_homeaddress        Text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  stud_campusadd          Text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  stud_gender             Char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  stud_college            Text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  stud_course             Text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  stud_scholarship_status Text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  stud_scholastic_status  Text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  password                Text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL, 
  PRIMARY KEY (
      stud_id
  )
) ENGINE=InnoDB DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
CREATE TABLE subject (
  subj_id      Integer(11) NOT NULL AUTO_INCREMENT,
  subj_code    Text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  subj_section Text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  subj_title   Text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  subj_days    Text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  subj_time    Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  subj_room    Text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  subj_lab     Integer(11) NOT NULL,
  subj_lec     Integer(11) NOT NULL,
  subj_units   Integer(11) NOT NULL, 
  PRIMARY KEY (
      subj_id
  )
) ENGINE=InnoDB DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
