create schema vehicle;
show schemas;
use vehicle;
CREATE TABLE `vehicle`.`ADVAIT_customer` (
  `cust_id` VARCHAR(20) NOT NULL,
  `cust_fname` VARCHAR(45) NOT NULL,
  `cust_lname` VARCHAR(45) NOT NULL,
  `cust_dob` DATE NOT NULL,
  `cust_gender` CHAR(2) NOT NULL,
  `cust_address` VARCHAR(45) NOT NULL,
  `cust_mob_number` INT NOT NULL UNIQUE,
  `cust_email` VARCHAR(45) NOT NULL UNIQUE,
  `cust_passport_num` VARCHAR(45) NOT NULL UNIQUE,
  `cust_maritial_status` VARCHAR(45) NOT NULL,
  `cust_pps_number` INT NOT NULL UNIQUE,
  PRIMARY KEY (`cust_id`),
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);

CREATE TABLE `vehicle`.`ADVAIT_application` (
  `application_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `vehicle_id` VARCHAR(45) NOT NULL ,
  `application_status` CHAR(8) NOT NULL,
  `coverage` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`application_id`),
  UNIQUE INDEX `application_id_UNIQUE` (`application_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);
  
alter table `vehicle`.`ADVAIT_application` add
constraint fk_cust_id foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);


CREATE TABLE `ADVAIT_quote` (
  `quote_id` VARCHAR(20) NOT NULL UNIQUE,
  `application_id` VARCHAR(20) NOT NULL ,
  `cust_id` VARCHAR(20) NOT NULL ,
  `issue_date` DATETIME NOT NULL,
  `valid_from_date` DATETIME NOT NULL,
  `valid_till_date` DATETIME NOT NULL,
  `description` VARCHAR(100) NULL,
  `product_id` VARCHAR(20) NOT NULL,
  `coverage_level` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`quote_id`),
  UNIQUE INDEX `quote_id_UNIQUE` (`quote_id` ASC) VISIBLE,
  UNIQUE INDEX `application_id_UNIQUE` (`application_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);
  

alter table `vehicle`.`ADVAIT_quote` add
constraint fk_application_id foreign key (`application_id`) references `vehicle`.`ADVAIT_application`(`application_id`); 

alter table `vehicle`.`ADVAIT_quote` add
constraint fk_cust_id1 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);  



CREATE TABLE `vehicle`.`ADVAIT_insurance_policy` (
  `agreement_id` VARCHAR(20) NOT NULL ,
  `application_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `department_name` VARCHAR(20) NOT NULL,
  `policy_number` VARCHAR(20) NOT NULL UNIQUE,
  `start_date` DATETIME NOT NULL,
  `expiry_date` DATETIME NOT NULL,
  `term_condition_description` VARCHAR(100) NULL,
  PRIMARY KEY (`agreement_id`),
  UNIQUE INDEX `agreement_id_UNIQUE` (`agreement_id` ASC) VISIBLE,
  UNIQUE INDEX `application_id_UNIQUE` (`application_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);
  
alter table `vehicle`.`ADVAIT_insurance_policy` add
constraint fk_application_id2 foreign key (`application_id`) references `vehicle`.`ADVAIT_application`(`application_id`); 

alter table `vehicle`.`ADVAIT_insurance_policy` add
constraint fk_cust_id2 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);  


CREATE TABLE `ADVAIT_premium_payment` (
  `premium_payment_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `policy_number` VARCHAR(20) NOT NULL UNIQUE,
  `premium_payment_schedule` DATETIME NOT NULL,
  `premium_payment_amount` INT NOT NULL,
  `receipt_id` VARCHAR(20) NOT NULL UNIQUE,
  UNIQUE INDEX `premium_payment_id_UNIQUE` (`premium_payment_id` ASC) VISIBLE,
  PRIMARY KEY (`premium_payment_id`),
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);
  
alter table `vehicle`.`ADVAIT_premium_payment` add
constraint fk_cust_id3 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);



CREATE TABLE `ADVAIT_vehicle` (
  `vehicle_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `policy_id` VARCHAR(20) NOT NULL UNIQUE,
  `dependent_nok_id` VARCHAR(20) NOT NULL ,
  `vehicle_registration_number` VARCHAR(20) NOT NULL UNIQUE,
  `vehicle_value` INT NOT NULL,
  `vehicle_type` VARCHAR(20) NOT NULL,
  `vehicle_size` INT NOT NULL,
  `vehicle_number_of_seat` INT NOT NULL,
  `vehicle_manufacturer` VARCHAR(20) NOT NULL,
  `vehicle_engine_number` INT NOT NULL UNIQUE,
  `vehicle_chasis_number` INT NOT NULL UNIQUE,
  `vehicle_number` VARCHAR(20) NOT NULL UNIQUE,
  `vehicle_model_number` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`vehicle_id`),
  UNIQUE INDEX `vehicle_id_UNIQUE` (`vehicle_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);
  

alter table `vehicle`.`ADVAIT_vehicle` add
constraint fk_cust_id4 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);


CREATE TABLE `vehicle`.`ADVAIT_claim` (
  `claim_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `agreement_id` VARCHAR(20) NOT NULL,
  `claim_amount` INT NOT NULL,
  `incident_id` VARCHAR(20) NOT NULL UNIQUE,
  `damage_type` VARCHAR(20) NOT NULL,
  `date_of_claim` DATE NOT NULL,
  `calim_status` CHAR(10) NOT NULL,
  PRIMARY KEY (`claim_id`),
  UNIQUE INDEX `claim_id_UNIQUE` (`claim_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);


alter table `vehicle`.`ADVAIT_claim` add
constraint fk_cust_id5 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);


CREATE TABLE `vehicle`.`ADVAIT_claim_statement` (
  `claim_statement_id` VARCHAR(20) NOT NULL ,
  `claim_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `vehicle_id` VARCHAR(20) NOT NULL,
  `date_settled` DATE NOT NULL,
  `amount_paid` INT NOT NULL,
  `coverage_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`claim_statement_id`),
  UNIQUE INDEX `claim_statement_id_UNIQUE` (`claim_statement_id` ASC) VISIBLE,
  UNIQUE INDEX `claim_id_UNIQUE` (`claim_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);


alter table `vehicle`.`ADVAIT_claim_statement` add
constraint fk_cust_id6 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);

alter table `vehicle`.`ADVAIT_claim_statement` add
constraint fk_claim_id foreign key (`claim_id`) references `vehicle`.`ADVAIT_claim`(`claim_id`);


CREATE TABLE `vehicle`.`ADVAIT_staff` (
  `staff_id` VARCHAR(20) NOT NULL,
  `company_name` VARCHAR(20) NOT NULL,
  `staff_fname` VARCHAR(10) NOT NULL,
  `staff_lname` VARCHAR(10) NOT NULL,
  `staff_address` VARCHAR(20) NOT NULL,
  `staff_contact` INT NOT NULL UNIQUE,
  `staff_gender` CHAR(2) NOT NULL,
  `staff_maritial_status` CHAR(8) NOT NULL,
  `staff_nationality` CHAR(15) NOT NULL,
  `staff_qualification` VARCHAR(20) NOT NULL,
  `staff_allowance` INT NOT NULL,
  `staff_pps_number` INT NOT NULL UNIQUE,
  PRIMARY KEY (`staff_id`),
  UNIQUE INDEX `staff_id_UNIQUE` (`staff_id` ASC) VISIBLE,
  UNIQUE INDEX `company_name_UNIQUE` (`company_name` ASC) VISIBLE);
  

alter table `vehicle`.`ADVAIT_staff` add
constraint fk_company_name foreign key (`company_name`) references `vehicle`.`ADVAIT_insurance_company`(`company_name`);



CREATE TABLE `vehicle`.`ADVAIT_department`(
    `department_name` VARCHAR(10) NOT NULL,
    `company_name` VARCHAR(20) NOT NULL ,
    `office` VARCHAR(10) NOT NULL,
    `contact_information` VARCHAR(20) NOT NULL,
    `department_staff` VARCHAR(50) NOT NULL,
    `department_leader` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`department_name`),
	UNIQUE INDEX `department_name_UNIQUE` (`department_name` ASC) VISIBLE,
    UNIQUE INDEX `company_name_UNIQUE` (`company_name` ASC) VISIBLE);
    
alter table `vehicle`.`ADVAIT_department` add
constraint fk_company_name2 foreign key (`company_name`) references `vehicle`.`ADVAIT_insurance_company`(`company_name`);


CREATE TABLE `vehicle`.`ADVAIT_office`(
    `office_name` VARCHAR(20) NOT NULL,
    `department_name` VARCHAR(10) NOT NULL ,
    `company_name` VARCHAR(20) NOT NULL,
    `office_leader` VARCHAR(10) NOT NULL,
    `contact_information` VARCHAR(20) NOT NULL,
    `adderss` VARCHAR(20) NOT NULL,
    `admin_cost` INT NOT NULL,
    `staff` VARCHAR(50) NOT NULL,
    PRIMARY KEY (office_name),
    UNIQUE INDEX `department_name_UNIQUE` (`department_name` ASC) VISIBLE,
    UNIQUE INDEX `company_name_UNIQUE` (`company_name` ASC) VISIBLE
);

alter table `vehicle`.`ADVAIT_office` add
constraint fk_company_name3 foreign key (`company_name`) references `vehicle`.`ADVAIT_insurance_company`(`company_name`);

alter table `vehicle`.`ADVAIT_office` add
constraint fk_department_name foreign key (`department_name`) references `vehicle`.`ADVAIT_department`(`department_name`);



CREATE TABLE `vehicle`.`ADVAIT_membership`(
    `membership_id` VARCHAR(20) NOT NULL ,
    `cust_id` VARCHAR(20)NOT NULL ,
    `membership_type` VARCHAR(20) NOT NULL,
    `organisation_contact` CHAR(15) NOT NULL,
    PRIMARY KEY (`membership_id`),
	UNIQUE INDEX `membership_id_UNIQUE` (`membership_id` ASC) VISIBLE,
	UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE
);

alter table `vehicle`.`ADVAIT_membership` add
constraint fk_cust_id7 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);


CREATE TABLE `vehicle`.`ADVAIT_vehicle_service` (
  `vehicle_service` VARCHAR(20) NOT NULL,
  `vehicle_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `department_name` CHAR(20) NOT NULL,
  `vehicle_service_address` VARCHAR(20) NOT NULL,
  `vehicle_sevice_contact` VARCHAR(20) NOT NULL,
  `vehicle_service_incharge` CHAR(20) NOT NULL,
  `vehicle_service_type` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`vehicle_service`),
  UNIQUE INDEX `vehicle_service_UNIQUE` (`vehicle_service` ASC) VISIBLE,
  UNIQUE INDEX `vehicle_id_UNIQUE` (`vehicle_id` ASC) VISIBLE);
    
    
alter table `vehicle`.`ADVAIT_vehicle_service` add
constraint fk_cust_id8 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);

alter table `vehicle`.`ADVAIT_vehicle_service` add
constraint fk_vehicle_id foreign key (`vehicle_id`) references `vehicle`.`ADVAIT_vehicle`(`vehicle_id`);
    

CREATE TABLE `vehicle`.`ADVAIT_NOK` (
  `NOK_id` VARCHAR(20) NOT NULL ,
  `agreement_id` VARCHAR(20) NOT NULL ,
  `application_id` VARCHAR(20) NOT NULL ,
  `cust_id` VARCHAR(20) NOT NULL ,
  `NOK_name` VARCHAR(20) NOT NULL,
  `NOK_address` VARCHAR(20) NOT NULL,
  `NOK_phone_number` INT NOT NULL UNIQUE,
  `NOK_martial_status` CHAR(8) NOT NULL,
  `NOK_gender` CHAR(2) NOT NULL,
  PRIMARY KEY (`NOK_id`),
  UNIQUE INDEX `NOK_id_UNIQUE` (`NOK_id` ASC) VISIBLE,
  UNIQUE INDEX `agreement_id_UNIQUE` (`agreement_id` ASC) VISIBLE,
  UNIQUE INDEX `application_id_UNIQUE` (`application_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);
  
  
alter table `vehicle`.`ADVAIT_NOK` add
constraint fk_cust_id9 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);

alter table `vehicle`.`ADVAIT_NOK` add
constraint fk_application_id3 foreign key (`application_id`) references `vehicle`.`ADVAIT_application`(`application_id`); 

alter table `vehicle`.`ADVAIT_NOK` add
constraint fk_agreement_id foreign key (`agreement_id`) references `vehicle`.`ADVAIT_insurance_policy_coverage`(`agreement_id`); 



CREATE TABLE `vehicle`.`ADVAIT_insurance_company` (
  `company_name` VARCHAR(20) NOT NULL,
  `company_address` VARCHAR(20) NOT NULL,
  `company_contact_number` INT NOT NULL,
  `company_fax` INT NOT NULL UNIQUE UNIQUE,
  `company_email` VARCHAR(20) NOT NULL UNIQUE,
  `company_website` VARCHAR(20) NOT NULL UNIQUE,
  `company_location` VARCHAR(20) NOT NULL,
  `company_departmant_name` VARCHAR(20) NOT NULL,
  `company_office_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`company_name`),
  UNIQUE INDEX `company_name_UNIQUE` (`company_name` ASC) VISIBLE);
    

CREATE TABLE `vehicle`.`ADVAIT_policy_renewable` (
  `policy_renewable_id` VARCHAR(20) NOT NULL,
  `agreement_id` VARCHAR(20) NOT NULL,
  `application_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `date_of_renewal` DATE NOT NULL,
  `type_of_renewal` CHAR(15) NOT NULL,
  PRIMARY KEY (`policy_renewable_id`),
  UNIQUE INDEX `policy_renewable_id_UNIQUE` (`policy_renewable_id` ASC) VISIBLE,
  UNIQUE INDEX `agreement_id_UNIQUE` (`agreement_id` ASC) VISIBLE,
  UNIQUE INDEX `application_id_UNIQUE` (`application_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);
  

alter table `vehicle`.`ADVAIT_policy_renewable` add
constraint fk_cust_id10 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);

alter table `vehicle`.`ADVAIT_policy_renewable` add
constraint fk_application_id4 foreign key (`application_id`) references `vehicle`.`ADVAIT_application`(`application_id`); 

alter table `vehicle`.`ADVAIT_policy_renewable` add
constraint fk_agreement_id2 foreign key (`agreement_id`) references `vehicle`.`ADVAIT_insurance_policy_coverage`(`agreement_id`); 
    

CREATE TABLE `vehicle`.`ADVAIT_incident` (
  `incident_id` VARCHAR(20) NOT NULL,
  `incident_type` VARCHAR(30) NOT NULL,
  `incident_date` DATE NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`incident_id`),
  UNIQUE INDEX `incident_id_UNIQUE` (`incident_id` ASC) VISIBLE);


  CREATE TABLE `vehicle`.`ADVAIT_incident_report` (
  `incident_report_id` VARCHAR(20) NOT NULL,
  `incident_id` VARCHAR(20) NOT NULL ,
  `cust_id` VARCHAR(20) NOT NULL,
  `incident_inspector` VARCHAR(20) NOT NULL,
  `incident_cost` INT NOT NULL,
  `incident_type` CHAR(10) NOT NULL,
  `incident_report_description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`incident_report_id`),
  UNIQUE INDEX `incident_report_id_UNIQUE` (`incident_report_id` ASC) VISIBLE,
  UNIQUE INDEX `incident_id_UNIQUE` (`incident_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);
  

alter table `vehicle`.`ADVAIT_incident_report` add
constraint fk_cust_id11 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);

alter table `vehicle`.
`ADVAIT_incident_report` add
constraint fk_incident_id foreign key (`incident_id`) references `vehicle`.`ADVAIT_incident`(`incident_id`);




  CREATE TABLE `vehicle`.`ADVAIT_coverage` (
  `coverage_id` VARCHAR(20) NOT NULL,
  `company_name` VARCHAR(20) NOT NULL,
  `coverage_amount` INT NOT NULL,
  `coverage_type` CHAR(10) NOT NULL,
  `coverage_level` CHAR(15) NOT NULL,
  `product_id` VARCHAR(20) NOT NULL,
  `coverage_description` VARCHAR(100) NOT NULL,
  `coverage_terms` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`coverage_id`),
  UNIQUE INDEX `coverage_id_UNIQUE` (`coverage_id` ASC) VISIBLE,
  UNIQUE INDEX `company_name_UNIQUE` (`company_name` ASC) VISIBLE);


alter table `vehicle`.`ADVAIT_coverage` add
constraint fk_company_name4 foreign key (`company_name`) references `vehicle`.`ADVAIT_insurance_company`(`company_name`);


  CREATE TABLE `vehicle`.`ADVAIT_product` (
  `product_number` VARCHAR(20) NOT NULL,
  `company_name` VARCHAR(20) NOT NULL,
  `product_price` INT NOT NULL,
  `product_type` CHAR(15) NOT NULL,
  PRIMARY KEY (`product_number`),
  UNIQUE INDEX `product_number_UNIQUE` (`product_number` ASC) VISIBLE,
  UNIQUE INDEX `company_name_UNIQUE` (`company_name` ASC) VISIBLE);
  
  
alter table `vehicle`.`ADVAIT_product` add
constraint fk_company_name5 foreign key (`company_name`) references `vehicle`.`ADVAIT_insurance_company`(`company_name`);


  
  CREATE TABLE `vehicle`.`ADVAIT_receipt` (
  `receipt_id` VARCHAR(20) NOT NULL,
  `premium_payment_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `cost` INT NOT NULL,
  `time` DATE NOT NULL,
  PRIMARY KEY (`receipt_id`),
  UNIQUE INDEX `receipt_id_UNIQUE` (`receipt_id` ASC) VISIBLE,
  UNIQUE INDEX `premium_payment_id_UNIQUE` (`premium_payment_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);
  
alter table `vehicle`.`ADVAIT_receipt` add
constraint fk_cust_id12 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);

alter table `vehicle`.`ADVAIT_receipt` add
constraint fk_premium_payment_id foreign key (`premium_payment_id`) references `vehicle`.`ADVAIT_premium_payment`(`premium_payment_id`);


  CREATE TABLE `vehicle`.`ADVAIT_insurance_policy_coverage` (
  `agreement_id` VARCHAR(20) NOT NULL,
  `coverage_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`agreement_id`),
  UNIQUE INDEX `agreement_id_UNIQUE` (`agreement_id` ASC) VISIBLE,
  UNIQUE INDEX `coverage_id_UNIQUE` (`coverage_id` ASC) VISIBLE);
  


alter table `vehicle`.`ADVAIT_insurance_policy_coverage` add
constraint fk_coverage_id foreign key (`coverage_id`) references `vehicle`.`ADVAIT_coverage`(`coverage_id`);
  

show tables;


/* INSERT DATA */

insert into advait_customer values
('ethqeguh', 'vinayak', 'upadhyay', '2002-08-16', 'M', 'runkata', 2357795, 'efgb34ougbef@gmail.com', 'egnwrf4637', 'UNM', 879078),
('felidfbe', 'lucky', 'yadav', '2002-03-6', 'M', 'rajasthan', 79056744, ' iwrgoubv@gmail.com', 'qefuhsv547869', 'UNM', 54758674),
('egjnfb', 'tarun', 'sharma', '2001-07-1', 'M', 'haryana', 56869068, 'wfvjouhbev@gmail.com', 'egnero92442', 'UNM', 6548668),
('rutyb', 'hitarth', 'vyas', '2003-02-26', 'M', 'agra', 2356589, 'weoifuhsdvn@gmail.com', 'rthkjnfd3574', 'UNM', 6780945),
('ehpirhrnj', 'hemant', 'dhawale', '2002-09-12', 'M', 'bihar', 2454898, 'ouhsvnsvn@gmail.com', 'yioghasvd568', 'UNM', 53665847);

insert into advait_application values
('tukryukg', 'ethqeguh', 'fgberoihwr', 'V', 'whole'),
('wpijgsdv', 'felidfbe', 'ibhbwrrgu', 'UV', 'whole'),
('cwrghij', 'egjnfb', 'weifhsv', 'UV', 'partial'),
('vwsfvon', 'rutyb', 'vojnwoirfh', 'V', 'partial'),
('mjbvwfwi', 'ehpirhrnj', 'wfihsdv', 'V', 'whole');

insert into advait_quote values 
('evnjoeqrur', 'tukryukg', 'ethqeguh', '1989-09-12', '2050-09-12', 'Success is not final; failure is not fatal: it is the courage to continue that counts.', 'pid01', 'whole'),
('rktgjepir', 'wpijgsdv', 'felidfbe', '1990-02-02', '2060-02-02', 'Play by the rules, but be ferocious.', 'pid02', 'whole'),
('rpgjeer', 'cwrghij', 'egjnfb', '1989-18-05', '2050-18-05', 'Business opportunities are like buses, there’s always another one coming.', 'pid03', 'whole'),
('orjgrjg', 'vwsfvon', 'rutyb', '1984-23-07', '2050-09-07', 'Every problem is a gift—without problems we would not grow.', 'pid04', 'whole'),
('woufh3foh', 'mjbvwfwi', 'ehpirhrnj', '1992-19-10', '2050-09-12', 'You only have to do a few things right in your life so long as you don’t do too many things wrong.', 'pid05', 'whole');

insert into advait_insurance_policy values
('erfnoepov', 'tukryukg', 'ethqeguh', 'claims', 'ponum01', '1989-03-15', '1999-03-15', 'TERMS AND CONDITION' ),
('erhoiihgei', 'wpijgsdv', 'felidfbe', 'finance', 'ponum02', '1999-08-04', '2019-08-4', 'TERMS AND CONDITION' ),
('ouetghbrth', 'cwrghij', 'egjnfb', 'legal', 'ponum03', '2011-04-20', '2022-04-20', 'TERMS AND CONDITION' ),
('oiehjgdfn', 'vwsfvon', 'rutyb', 'marketing', 'ponum04', '2016-06-09', '2036-06-09', 'TERMS AND CONDITION' ),
('eihggefv', 'mjbvwfwi', 'ehpirhrnj', 'underwriting', 'ponum05', '2020-07-31', '2030-07-31', 'TERMS AND CONDITION' );


insert into advait_premium_payment values
('pp01', 'ethqeguh', 'ponum01', '1991-01-16', 20000, 'pprid01'),
('pp02', 'felidfbe', 'ponum02', '1997-05-11', 20000, 'pprid02'),
('pp03', 'egjnfb', 'ponum03', '1997-07-21', 20000, 'pprid03'),
('pp04', 'rutyb', 'ponum04', '2001-01-25', 20000, 'pprid04'),
('pp05', 'ehpirhrnj', 'ponum05', '2003-07-27', 20000, 'pprid05');

insert into advait_vehicle values
('vid01', 'ethqeguh', 'poid01', 'dnok01', 'vregno01', 1, 'car', 20, 6, 'suzuki', 03, 456, 'vno01', 'ap01'),
('vid02', 'felidfbe', 'poid02', 'dnok02', 'vregno02', 2, 'bike', 24, 6, 'pulsar', 04, 457, 'vno02', 'ap02'),
('vid03', 'egjnfb', 'poid03', 'dnok03', 'vregno03', 3, 'truck', 12, 6, 'mahindra', 05, 458, 'vno03', 'ap03'),
('vid04', 'rutyb', 'poid04', 'dnok04', 'vregno04', 4, 'van', 23, 6, 'volvo', 06, 459, 'vno04', 'ap04'),
('vid05', 'ehpirhrnj', 'poid05', 'dnok05', 'vregno05', 5, 'tractor', 43, 6, 'jhon deere', 07, 453, 'vno05', 'ap05');


insert into advait_claim values
('cid01', 'ethqeguh', 'erfnoepov', 24574, 'incid01', 'third party', '2005-08-03', 'prepared'),
('cid02', 'felidfbe', 'erhoiihgei', 46756, 'incid02', 'own damage', '2018-08-02', 'prepared'),
('cid03', 'egjnfb', 'ouetghbrth', 68456, 'incid03', 'fire damage', '2010-03-18', 'prepared'),
('cid04', 'rutyb', 'oiehjgdfn', 79676, 'incid04', 'personal accident cover', '2012-05-17', 'prepared'),
('cid05', 'ehpirhrnj', 'eihggefv', 46756, 'incid05', 'third party', '2016-11-14', 'prepared');

insert into advait_claim_statement values
('csid01', 'cid01', 'ethqeguh', 'vid01', '2005-08-04',  24000, 'covid01'),
('csid02', 'cid02', 'felidfbe', 'vid02', '2018-08-06',  46000, 'covid02'),
('csid03', 'cid03', 'egjnfb', 'vid03', '2010-03-18',  68000, 'covid03'),
('csid04', 'cid04', 'rutyb', 'vid04', '2012-05-17',  79000, 'covid04'),
('csid05', 'cid05', 'ehpirhrnj', 'vid05', '2016-11-14',  46000, 'covid05');


insert into advait_staff values
('stf01', 'TATA', 'sunil', 'patidar', 'RAJASTHAN', 912423553, 'M', 'UM', 'IN', 'Btech', 432, 123),
('stf02', 'MAHINDRA', 'rohan', 'singh', 'BIHAR', 93356367, 'M', 'UM', 'IN', 'Btech', 433, 124),
('stf03', 'SUZUKI', 'anup', 'jujagar', 'MAHARASTRA', 90346674, 'M', 'UM', 'IN', 'Btech', 434, 125),
('stf04', 'TATA', 'hemang', 'ranga', 'RAJASTHAN', 97324646, 'M', 'UM', 'IN', 'Btech', 435, 126),
('stf05', 'TATA', 'daulat', 'jha', 'BIHAR', 96342658, 'M', 'UM', 'IN', 'Btech', 436, 127);


insert into advait_department values
('claims',)

insert into ADVAIT_membership values
('thfstsj', 'ethqeguh', 'gold', 'ramesh'),
('wtetfsbg', 'felidfbe', 'silver', 'suresh'),
('yywehsy', 'egjnfb', 'diamond', 'kamlesh'),
('hjgvhjgd', 'rutyb', 'platinum', 'samuel'),
('vghchsj', 'ehpirhrnj', 'platinum', 'stanley');



insert into ADVAIT_vehicle_service values
('kjhyugy','','ethqeguh','tyre_department','wasseypur dhanbad','6876543209','satyam'),
('tjhrrgy','','felidfbe','glass_department','patna','7800543204','rahul'),
('djhegy','','egjnfb','engine_department','thane mumbai','9876543209','priyansh'),
('ffyugy','','rutyb','interior_department','hubli circle','8873543209','devansh'),
('hyuww','','ehpirhrnj','exterior_department','bokaro','7876543299','shivam');



insert into ADVAIT_NOK values
('tgddvd','dhhjb','tukryukg','ethqeguh','tony','delhi',8765453622,'yes','M'),
('teeddvd','vgfhd','wpijgsdv','felidfbe','rony','canout palace',8335453622,'yes','F'),
('tegdgdvd','chhdddb','cwrghij','egjnfb','remo','sarojni nagar',8766453622,'no','M'),
('tpoddvd','kifjfh','vwsfvon','rutyb','sriyansh','pune',8765483622,'yes','F'),
('ssnmvd','ccggdhs','mjbvwfwi','ehpirhrnj','neel','jaipur',8769453622,'no','F');


insert into ADVAIT_insurance_company values
('Go Digit General','Koramangala',7885899065,101,'GoDigit@gmail.com','Go.com','Bengaluru','Sales_department','G.D.G Insurance Ltd'),
('Bajaj Allianz','Commerce Zone',7888899065,102,'Bajaj@gmail.com','Bajaj.com','Pune','Mngt&Adm.department','B.A.G Insurance Ltd'),
('Cholamandalam','Hari nivas Towers',6885899065,103,'Cholam@gmail.com','Cholamandalam.com','Chennai','service_department','C. Insurance Ltd'),
('Navi General','kalyan nagar',7885899060,104,'Navi@gmail.com','Navi.com','Mumbai','parts_department','N.G Insurance Ltd'),
('Magma HDI General','howrah',7885899061,105,'Magma@gmail.com','Magma.com','kolkata','service_department','M.H.G Insurance Ltd');


insert into ADVAIT_policy_renewable values
('cvbmvd','dhhjb','tukryukg','ethqeguh',2018-01-12,''),
('ewqmvh','vgfhd','wpijgsdv','felidfbe',2018-01-12,''),
('ertmvr','chhdddb','cwrghij','egjnfb',2018-01-12,''),
('tghmvt','kifjfh','vwsfvon','rutyb',2018-01-12,''),
('uhgmtd','ccggdhs','mjbvwfwi','ehpirhrnj',2018-01-12,'');



insert into ADVAIT_incident values
('hjukvd','',2020-01-06,''),
('hrrkvd','',2020-03-02,''),
('hrtkvd','',2020-04-11,''),
('hhhkvd','',2020-05-10,''),
('hbnvkvd','',2020-03-08,'');




insert into ADVAIT_incident_report values
('kjkyjj','hjukvd','ethqeguh','tushar',5000,'',''),
('krryjj','hrrkvd','felidfbe','karan',6000,'',''),
('kggyjj','hrtkvd','egjnfb','akash',5700,'',''),
('khjyjj','hhhkvd','rutyb','gaurav',6600,'',''),
('kghjyj','hbnvkvd','ehpirhrnj','arjun',4500,'','');


insert into ADVAIT_coverage values
('eisusgd','Go Digit General',4000,'','','jfijfd','',''),
('eieesgd','Bajaj Allianz',6000,'','','jfrrfd','',''),
('eiffsgd','Cholamandalam',7000,'','','jftghfd','',''),
('edfsgd','Navi General',10000,'','','jfigfd','',''),
('ehyusgd','Magma HDI General',4500,'','','jkiujfd','','');




insert into ADVAIT_product values
('pertgs','Go Digit General',2000,''),
('peedrgs','Bajaj Allianz',3400,''),
('pcvbs','Cholamandalam',8000,''),
('phnbggs','Navi General',1200,''),
('plokjs','Magma HDI General',3800,'');


insert into ADVAIT_receipt values
('lkjygd','','ethqeguh',7000,2022-01-08),
('lkgggd','','felidfbe',8000,2022-02-11),
('lkhhgd','','egjnfb',9000,2022-03-01),
('lknngd','','rutyb',3400,2022-04-03),
('lkjjgd','','ehpirhrnj',5000,2022-01-02);




insert into ADVAIT_insurance_policy_coverage values
('dhhjb','eisusgd'),
('vgfhd','eieesgd'),
('chhdddb','eiffsgd'),
('kifjfh','edfsgd'),
('ccggdhs','ehyusgd');







/* QUERIES */

/* 1 */

select c.cust_id, v.vehicle_id from ADVAIT_customer as c, advait_vehicle as v
where c.cust_id in (select cust_id from advait_claim where calim_status is null);

/* 2 */ 

select c.cust_id from advait_customer as c 
where c.cust_id in (
			select cust_id from advait_premium_payment where premium_payment_amount > (
						select sum(cust_id) from advait_customer));
                        
/* 5 */ 

select v.vehicle_type from advait_vehicle as v where v.cust_id in (
						select cust_id from advait_premium_payment where premium_payment_amount > (
													select vehicle_number from advait_vehicle));

/* 6 */ 

select * from advait_customer as c where c.cust_id in (select cust_id from advait_claim where claim_amount < (select coverage_amount from advait_coverage) and claim_amount > 
(select claim_statement_id + vehicle_id + claim_id + cust_id from advait_claim_statement)); 










insert into ADVAIT_membership values
('thfstsj', 'ethqeguh', 'gold', 'ramesh'),
('wtetfsbg', 'felidfbe', 'silver', 'suresh'),
('yywehsy', 'egjnfb', 'diamond', 'kamlesh'),
('hjgvhjgd', 'rutyb', 'platinum', 'samuel'),
('vghchsj', 'ehpirhrnj', 'platinum', 'stanley');



insert into ADVAIT_vehicle_service values
('kjhyugy','','ethqeguh','tyre_department','wasseypur dhanbad','6876543209','satyam'),
('tjhrrgy','','felidfbe','glass_department','patna','7800543204','rahul'),
('djhegy','','egjnfb','engine_department','thane mumbai','9876543209','priyansh'),
('ffyugy','','rutyb','interior_department','hubli circle','8873543209','devansh'),
('hyuww','','ehpirhrnj','exterior_department','bokaro','7876543299','shivam');



insert into ADVAIT_NOK values
('tgddvd','dhhjb','tukryukg','ethqeguh','tony','delhi',8765453622,'yes','M'),
('teeddvd','vgfhd','wpijgsdv','felidfbe','rony','canout palace',8335453622,'yes','F'),
('tegdgdvd','chhdddb','cwrghij','egjnfb','remo','sarojni nagar',8766453622,'no','M'),
('tpoddvd','kifjfh','vwsfvon','rutyb','sriyansh','pune',8765483622,'yes','F'),
('ssnmvd','ccggdhs','mjbvwfwi','ehpirhrnj','neel','jaipur',8769453622,'no','F');


insert into ADVAIT_insurance_company values
('Go Digit General','Koramangala',7885899065,101,'GoDigit@gmail.com','Go.com','Bengaluru','Sales_department','G.D.G Insurance Ltd'),
('Bajaj Allianz','Commerce Zone',7888899065,102,'Bajaj@gmail.com','Bajaj.com','Pune','Mngt&Adm.department','B.A.G Insurance Ltd'),
('Cholamandalam','Hari nivas Towers',6885899065,103,'Cholam@gmail.com','Cholamandalam.com','Chennai','service_department','C. Insurance Ltd'),
('Navi General','kalyan nagar',7885899060,104,'Navi@gmail.com','Navi.com','Mumbai','parts_department','N.G Insurance Ltd'),
('Magma HDI General','howrah',7885899061,105,'Magma@gmail.com','Magma.com','kolkata','service_department','M.H.G Insurance Ltd');


insert into ADVAIT_policy_renewable values
('cvbmvd','dhhjb','tukryukg','ethqeguh',2018-01-12,''),
('ewqmvh','vgfhd','wpijgsdv','felidfbe',2018-01-12,''),
('ertmvr','chhdddb','cwrghij','egjnfb',2018-01-12,''),
('tghmvt','kifjfh','vwsfvon','rutyb',2018-01-12,''),
('uhgmtd','ccggdhs','mjbvwfwi','ehpirhrnj',2018-01-12,'');



insert into ADVAIT_incident values
('hjukvd','',2020-01-06,''),
('hrrkvd','',2020-03-02,''),
('hrtkvd','',2020-04-11,''),
('hhhkvd','',2020-05-10,''),
('hbnvkvd','',2020-03-08,'');




insert into ADVAIT_incident_report values
('kjkyjj','hjukvd','ethqeguh','tushar',5000,'',''),
('krryjj','hrrkvd','felidfbe','karan',6000,'',''),
('kggyjj','hrtkvd','egjnfb','akash',5700,'',''),
('khjyjj','hhhkvd','rutyb','gaurav',6600,'',''),
('kghjyj','hbnvkvd','ehpirhrnj','arjun',4500,'','');


insert into ADVAIT_coverage values
('eisusgd','Go Digit General',4000,'','','jfijfd','',''),
('eieesgd','Bajaj Allianz',6000,'','','jfrrfd','',''),
('eiffsgd','Cholamandalam',7000,'','','jftghfd','',''),
('edfsgd','Navi General',10000,'','','jfigfd','',''),
('ehyusgd','Magma HDI General',4500,'','','jkiujfd','','');




insert into ADVAIT_product values
('pertgs','Go Digit General',2000,''),
('peedrgs','Bajaj Allianz',3400,''),
('pcvbs','Cholamandalam',8000,''),
('phnbggs','Navi General',1200,''),
('plokjs','Magma HDI General',3800,'');


insert into ADVAIT_receipt values
('lkjygd','','ethqeguh',7000,2022-01-08),
('lkgggd','','felidfbe',8000,2022-02-11),
('lkhhgd','','egjnfb',9000,2022-03-01),
('lknngd','','rutyb',3400,2022-04-03),
('lkjjgd','','ehpirhrnj',5000,2022-01-02);




insert into ADVAIT_insurance_policy_coverage values
('dhhjb','eisusgd'),
('vgfhd','eieesgd'),
('chhdddb','eiffsgd'),
('kifjfh','edfsgd'),
('ccggdhs','ehyusgd');







/* QUERIES */

/* 1 */

select c.cust_id, v.vehicle_id from ADVAIT_customer as c, advait_vehicle as v
where c.cust_id in (select cust_id from advait_claim where calim_status is null);

/* 2 */ 

select c.cust_id from advait_customer as c 
where c.cust_id in (
			select cust_id from advait_premium_payment where premium_payment_amount > (
						select sum(cust_id) from advait_customer));
                        
/* 5 */ 

select v.vehicle_type from advait_vehicle as v where v.cust_id in (
						select cust_id from advait_premium_payment where premium_payment_amount > (
													select vehicle_number from advait_vehicle));

/* 6 */ 

select * from advait_customer as c where c.cust_id in (select cust_id from advait_claim where claim_amount < (select coverage_amount from advait_coverage) and claim_amount > 
(select claim_statement_id + vehicle_id + claim_id + cust_id from advait_claim_statement)); 



