#  ___           _   _     _           _   _                  ____    ____  
# |_ _|  _ __   (_) | |_  (_)   __ _  | | (_)  ____   ___    |  _ \  | __ ) 
#  | |  | '_ \  | | | __| | |  / _` | | | | | |_  /  / _ \   | | | | |  _ \ 
#  | |  | | | | | | | |_  | | | (_| | | | | |  / /  |  __/   | |_| | | |_) |
# |___| |_| |_| |_|  \__| |_|  \__,_| |_| |_| /___|  \___|   |____/  |____/ 

DROP DATABASE FederalAgencies;
CREATE DATABASE FederalAgencies;
USE FederalAgencies;

#   ____                         _              _____           _       _              
#  / ___|  _ __    ___    __ _  | |_    ___    |_   _|   __ _  | |__   | |   ___   ___ 
# | |     | '__|  / _ \  / _` | | __|  / _ \     | |    / _` | | '_ \  | |  / _ \ / __|
# | |___  | |    |  __/ | (_| | | |_  |  __/     | |   | (_| | | |_) | | | |  __/ \__ \
#  \____| |_|     \___|  \__,_|  \__|  \___|     |_|    \__,_| |_.__/  |_|  \___| |___/
                                                                                      

CREATE TABLE Agency(
	id				INT NOT NULL AUTO_INCREMENT,
	name 			VARCHAR(128),
	creationDate	DATE,
	website			VARCHAR(128),
	acronym			VARCHAR(8),
	motto			VARCHAR(128),
    PRIMARY KEY (id)
);

ALTER TABLE Agency AUTO_INCREMENT = 1000;

CREATE TABLE Director(
	id				INT NOT NULL AUTO_INCREMENT,
	lastName		VARCHAR(24),
	firstName		VARCHAR(24),
    title			VARCHAR(128),
	dateInOffice	DATE,
    PRIMARY KEY (id)
);

ALTER TABLE Director AUTO_INCREMENT = 2000;

CREATE TABLE Government_Branch(
	id				INT NOT NULL AUTO_INCREMENT,
    name			VARCHAR(128),
    PRIMARY KEY (id)
);

ALTER TABLE Government_Branch AUTO_INCREMENT = 3000;

CREATE TABLE Location(
	id				INT NOT NULL AUTO_INCREMENT,
    city			VARCHAR(48),
    stateDistrict	VARCHAR(48),
    PRIMARY KEY (id)
);

ALTER TABLE Location AUTO_INCREMENT = 4000;

CREATE TABLE Agency_Director(
	id				INT NOT NULL AUTO_INCREMENT,
    agencyID		INT,
    directorID		INT,
    FOREIGN KEY (agencyID) REFERENCES Agency(id),
    FOREIGN KEY (directorID) REFERENCES Director(id),
    PRIMARY KEY (id)
);

ALTER TABLE Agency_Director AUTO_INCREMENT = 5000;

CREATE TABLE Agency_Branch(
	id				INT NOT NULL AUTO_INCREMENT,
    agencyID		INT,
    branchID		INT,
    FOREIGN KEY (agencyID) REFERENCES Agency(id),
    FOREIGN KEY (branchID) REFERENCES Government_Branch(id),
    PRIMARY KEY (id)
);

ALTER TABLE Agency_Branch AUTO_INCREMENT = 6000;

CREATE TABLE Popular_Services(
	id				INT NOT NULL AUTO_INCREMENT,
    agencyID		INT,
    serviceName		VARCHAR(128),
    FOREIGN KEY (agencyID) REFERENCES Agency(id),
    PRIMARY KEY (id)
);

ALTER TABLE Popular_Services AUTO_INCREMENT = 7000;

CREATE TABLE Parent_Agency(
	id				INT NOT NULL AUTO_INCREMENT,
    agencyID		INT,
    parentID		INT,
    FOREIGN KEY (agencyID) REFERENCES Agency(id),
    FOREIGN KEY (parentID) REFERENCES Agency(id),
    PRIMARY KEY (id)
);

ALTER TABLE Parent_Agency AUTO_INCREMENT = 8000;

CREATE TABLE Agency_Location(
	id				INT NOT NULL AUTO_INCREMENT,
    agencyID		INT,
    locationID		INT,
    FOREIGN KEY (agencyID) REFERENCES Agency(id),
    FOREIGN KEY (locationID)  REFERENCES Location(id),
    PRIMARY KEY (id)
);

ALTER TABLE Agency_Location AUTO_INCREMENT = 9000;

#  _              _                         _       _     ____            _           
# | |       ___  | |_   ___      __ _    __| |   __| |   |  _ \    __ _  | |_    __ _ 
# | |      / _ \ | __| / __|    / _` |  / _` |  / _` |   | | | |  / _` | | __|  / _` |
# | |___  |  __/ | |_  \__ \   | (_| | | (_| | | (_| |   | |_| | | (_| | | |_  | (_| |
# |_____|  \___|  \__| |___/    \__,_|  \__,_|  \__,_|   |____/   \__,_|  \__|  \__,_|
#https://www.usa.gov/federal-agencies/

INSERT INTO Agency (name, creationDate, website, acronym, motto) VALUES
('AbilityOne Commision', '2011-01-01','www.abilityone.gov', NULL, NULL),
('U.S. Access Board', '1973-01-01','www.access-board.gov', NULL, NULL),
('Administration for Children and Families', '1991-04-15','www.acf.hhs.gov', 'ACF', NULL),
('Administration for Community Living', '2012-04-18', 'www.acl.gov', 'ACL', NULL),
('Administration for Native Americans','1974-01-01','www.acf.hhs.gov/ana', 'ANA', NULL),
('Administrative Conference of the United States', '1968-01-01', 'www.acus.gov', 'ACUS', NULL),
('Administrative Office of the U.S. Courts','1939-08-07','www.uscourts.gov', NULL, NULL),
('Advisory Council on Historic Preservation', '1966-01-01', 'www.achp.gov', 'ACHP', NULL),
('African Development Foundation','1980-01-01','www.usadf.gov', NULL, NULL),
('U.S. Agency for Global Media','1999-10-01','www.usagm.gov','USAGM',NULL),
('Agency for Healthcare Research and Quality','1999-12-06','www.ahrq.gov','AHRQ', NULL),
('U.S. Agency for International Development','1961-11-03','www.usaid.gov','USAID','From the American people'),
('Agency for Toxic Substances and Disease Registry', '1985-06-11', 'www.atsdr.cdc.gov', 'ATSDR', NULL),
('Agricultural Marketing Service', '1939-01-01', 'www.ams.usda.gov', 'AMS', NULL),
('Agricultural Research Service', '1953-11-02', 'www.ars.usda.gov', 'ARS', NULL),
('U.S. Department of Agriculture', '1862-05-15', 'www.usda.gov', 'USDA', NULL),
('National Library of Agriculture', '1862-04-15', 'www.nal.usda.gov', 'NAL', NULL),
('U.S. Air Force', '1947-09-18', 'www.af.mil', 'USAF', 'Integrity first, Service before self, Excellence in all we do'),
('U.S. Air Force Reserve Command', '1948-05-14', 'www.afrc.af.mil', NULL, NULL),
('Alcohol and Tobacco Tax and Trade Bureau', '2003-01-24', 'www.ttb.gov', 'TTB', NULL),
('Bureau of Alcohol, Tobacco, Firearms and Explosives', '1972-07-01', 'www.atf.gov', 'ATF', NULL),
('Middle East Broadcasting Networks','2002-01-01','www.usagm.gov/networks/mbn/', 'MBN', NULL),
('American Battle Monuments Commission', '1923-03-04', 'www.abmc.gov/','ABMC', 'Time will not dim the glory of their deeds'),
('AmeriCorps', '1994-01-01', 'www.americorps.gov', NULL, NULL),
('National Railroad Passenger Corporation', '1971-05-01', 'www.amtrak.com', 'AMTRAK', NULL),
('Animal and Plant Health Inspection Service', '1972-01-01', 'www.aphis.usda.gov', 'APHIS', NULL),
('Antitrust Division', '1919-01-01', 'www.justice.gov/atr', NULL, NULL),
('Appalachian Regional Commission', '1965-03-09', 'www.arc.gov', 'ARC', NULL),
('Architect of the Capitol', '1793-01-01', 'www.aoc.gov', 'AOC', NULL),
('National Archives and Records Administration', '1934-04-01', 'www.archives.gov', 'NARA', NULL),
('U.S. Arctic Research Commission', '1985-01-01', 'www.arctic.gov', 'USARC', NULL),
('Armed Forces Retirement Home', '2002-01-01', 'www.afrh.gov', 'AFRH', NULL),
('Arms Control and International Security', '1972-05-02', 'www.state.gov/bureaus-offices/under-secretary-for-arms-control-and-international-security-affairs/', NULL, NULL),
('U.S. Army', '1775-06-14', 'www.army.mil', 'USA', "This We'll Defend"),
('U.S. Army Corps of Engineers', '1779-01-01', 'www.usace.army.mil', 'USACE', 'Let Us Try'),
('National Institute of Arthritis, Musculoskeletal and Skin Diseases', '1950-08-01', 'www.niams.nih.gov', 'NIAMS', NULL),
('Bankruptcy Courts', '1984-04-01', 'www.uscourts.gov/services-forms/bankruptcy', NULL, NULL),
('Barry M. Goldwater Scholarship and Excellence in Education Program', '1986-01-01', 'goldwater.scholarsapply.org', NULL, NULL),
('Bonneville Power Administration', '1937-08-20', 'www.bpa.gov', 'BPA', NULL),
('U.S. Botanic Garden', '1842-01-01', 'www.usbg.gov', 'USBG', NULL),
('Bureau of Consular Affairs', '1952-01-01', 'travel.state.gov', 'CA', NULL),
('Consumer Financial Protection Bureau', '2011-07-21', 'www.consumerfinance.gov', 'CFPB', NULL),
('Bureau of Economic Analysis', '1972-01-01', 'www.bea.gov', 'BEA', NULL),
('Bureau of Engraving and Printing', '1862-08-29', 'www.moneyfactory.gov', 'BEP', NULL),
('Bureau of Indian Affairs', '1824-03-11', 'www.bia.gov', 'BIA', NULL),
('Bureau of Industry and Security', '2001-01-01', 'www.bis.doc.gov', 'BIS', NULL),
('Bureau of International Labor Affairs', '1947-10-10', 'www.dol.gov/ilab', 'ILAB', NULL),
('Bureau of Justice Statistics', '1979-12-27', 'www.bjs.gov', 'BJS', NULL),
('Bureau of Labor Statistics', '1884-06-27', 'www.bls.gov', 'BLS', NULL),
('Bureau of Land Management', '1946-01-01', 'www.blm.gov', 'BLM', NULL),
('Bureau of Ocean Energy Management', '2011-10-01', 'www.boem.gov', 'BOEM', NULL),
('Bureau of Prisons', '1930-05-14', 'www.bop.gov', 'BOP', 'Correctional Excellence. Respect. Integrity.'),
('Bureau of Reclamation', '1902-01-01', 'www.usbr.gov', 'USBR', NULL),
('Bureau of Safety and Environmental Enforcement', '2011-11-01', 'www.bsee.gov', 'BSEE', NULL),
('U.S. Census Bureau', '1902-07-01', 'www.census.gov', 'USCB', NULL),
('Bureau of the Fiscal Service', '2012-10-07', 'www.fiscal.treasury.gov', NULL, NULL),
('Bureau of Transportation Statistics', '1992-10-19', 'www.bts.gov', 'BTS', NULL),
('U.S. Capitol Police', '1828-05-02', 'www.uscp.gov', 'USCP', 'A Tradition of Service and Protection'),
('U.S. Capitol Visitor Center', '2008-12-02', 'www.visitthecapitol.gov', NULL, NULL),
('Office of Career, Technical, and Adult Education', '1980-01-01', 'www2.ed.gov/about/offices/list/ovae', NULL, NULL),
('Center for Food Safety and Applied Nutrition', '1984-01-01', 'www.fda.gov/about-fda/fda-organization/center-food-safety-and-applied-nutrition-cfsan', 'CFSAN', NULL),
('Center for Nutrition Policy and Promotion', '1994-12-01', 'www.fns.usda.gov/cnpp', 'CNPP', NULL),
('Center for Parent Information and Resources', NULL, 'www.parentcenterhub.org', 'CPIR', NULL),
('Centers for Disease Control and Prevention', '1946-07-01', 'www.cdc.gov', 'CDC', NULL),
('Centers for Medicare and Medicaid Services', '1965-07-30', 'www.cms.gov', 'CMS', NULL),
('U.S. Central Command', '1983-01-01', 'www.centcom.mil', 'CENTCOM', 'Persistent Excellence'),
('Central Intelligence Agency', '1947-09-18', 'www.cia.gov', 'CIA', 'The Work of a Nation. The Center of Intelligence.'),
('U.S. Chemical Safety Board', '1998-01-01', 'www.csb.gov', 'CSB', NULL),
('Chief Acquisition Officers Council', '2003-02-20', 'www.acquisition.gov/cao-home', 'CAOC', NULL),
('Chief Financial Officers Council', '1990-01-01', 'www.cfo.gov', 'CFO', NULL),
('Chief Human Capital Officers Council', '2020-11-25', 'www.chcoc.gov', 'CHCO', NULL),
('Chief Information Officers Council', '2002-01-01', 'www.cio.gov', 'CIO', NULL),
('Office of Child Support Enforcement', '1975-01-01', 'www.acf.hhs.gov/css', 'OCSE', NULL),
('U.S. Courts of Appeal', '1789-01-01', 'www.uscourts.gov', NULL, NULL),
("Citizens' Stamp Advisory Committee", '1957-01-01', 'about.usps.com/who/csac/', NULL, NULL),
('Civil Rights Division, Department of Justice', '1957-12-09', 'www.justice.gov/crt', NULL, NULL),
('Office for Civil Rights, Department of Education', '1979-10-17', 'www2.ed.gov/about/offices/list/ocr', 'OCR', NULL),
('Office for Civil Rights, Department of Health and Human Services', '1953-04-11', 'www.hhs.gov/ocr/', NULL, NULL),
('U.S. Coast Guard', '1790-08-04', 'www.uscg.mil', NULL, 'Semper Paratus Always ready'),
('U.S. Department of Commerce', '1903-02-14', 'www.commerce.gov', 'DOC', NULL),
('U.S. Commission of Fine Arts', '1910-05-17', 'www.cfa.gov', 'CFA', NULL),
('Commission on Civil Rights', '1957-01-01', 'www.usccr.gov', NULL, NULL),
('U.S. Commission on International Religious Freedom', '1998-10-28', 'www.uscirf.gov', NULL, NULL),
('Consumer Product Safety Commission', '1972-01-01', 'www.cpsc.gov', 'CPSC', NULL),
('Coordinating Council on Juvenile Justice and Delinquency Prevention', '1974-01-01', 'juvenilecouncil.ojp.gov', NULL, NULL),
('Commission on Presidential Scholars', '1964-01-01', 'www2.ed.gov/programs/psp', NULL, NULL),
('Commission on Security and Cooperation in Europe (Helsinki Commission)', '1975-01-01', 'www.csce.gov', 'CSCE', NULL),
('Committee for the Implementation of Textile Agreements', '1972-03-03', 'otexa.trade.gov/cita_otexa.htm', NULL, NULL),
('Committee on Foreign Investment in the United States', '1975-01-01', 'www.treasury.gov/about/organizational-structure/offices/International-Affairs/Pages/cfius-index.aspx', NULL, NULL),
('U.S. Commodity Futures Trading Commission', '1975-04-15', 'www.cftc.gov', 'CFTC', NULL),
('Community Oriented Policing Services', '1994-01-01', 'cops.usdoj.gov', 'COPS', NULL),
('Office of Community Planning and Development', NULL, 'www.hud.gov/program_offices/comm_planning', 'CPD', NULL),
('Office of Compliance', '1996-01-23', 'www.ocwr.gov', 'OOC', NULL),
('Office of the Comptroller of the Currency', '1863-02-25', 'www.occ.gov', 'OCC', NULL),
('Computer Emergency Readiness Team', '2003-09-01', 'us-cert.cisa.gov', 'US CERT', NULL),
('U.S. House of Representatives', '1789-03-04', 'www.house.gov', NULL, NULL),
('U.S. Senate', '1787-05-29', 'www.senate.gov', NULL, NULL),
('Congressional Budget Office', '1974-07-12', 'www.cbo.gov', 'CBO', NULL),
('Congressional Research Service', '1914-07-16', 'www.loc.gov/crsinfo/about/', 'CRS', NULL),
('Copyright Office', '1870-01-01', 'www.copyright.gov', NULL, NULL),
('Corporation for National and Community Service', '1993-01-01', 'www.nationalservice.gov', 'CNCS', NULL),
('Council of Economic Advisers', '1946-01-01', 'www.whitehouse.gov/cea/', 'CEA', NULL),
('Council of the Inspectors General on Integrity and Efficiency', '2008-01-01', 'www.ignet.gov', 'CIGIE', NULL),
('Council on Environmental Quality', '1969-01-01', 'www.whitehouse.gov/ceq/', 'CEO', NULL),
('Court of Appeals for the Armed Forces', '1951-01-01', 'www.armfor.uscourts.gov/newcaaf/home.htm', NULL, NULL),
('Court of Appeals for the Federal Circuit', '1982-10-01', 'www.cafc.uscourts.gov', 'CAFC', NULL),
('U.S. Court of Appeals for Veterans Claims', '1988-11-18', 'www.uscourts.cavc.gov', 'CAVC', NULL),
('Court of Federal Claims', '1855-01-01', 'www.uscfc.uscourts.gov', 'CFC', NULL),
('Court of International Trade', '1980-01-01', 'www.cit.uscourts.gov', NULL, NULL),
('Court Services and Offender Supervision Agency for the District of Columbia', '2000-08-04', 'www.csosa.gov', 'CSOSA', NULL),
('U.S. Customs and Border Protection', '2003-03-01', 'www.cbp.gov', 'CBP', NULL),
('Cybersecurity and Infrastructure Security Agency', '2018-11-16', 'www.cisa.gov', 'CISA', NULL);

INSERT INTO Location (city, stateDistrict) VALUES
('Arlington', 'Virginia'),
('Washington', 'District of Columbia'),
('Rockville', 'Maryland'),
('Atlanta', 'Georgia'),
('Beltsville', 'Maryland'),
('Robins Air Force Base', 'Georgia'),
('Springfield', 'Virginia'),
('Arlington', 'Virginia'),
('College Park', 'Maryland'),
('Bethesda', 'Maryland'),
('Portland', 'Oregon'),
(NULL, NULL),
('Alexandria', 'Virginia'),
('Clinton', 'Iowa'),
('Newark', 'New Jersey'),
('Baltimore', 'Maryland'),
('MacDill Air Force Base', 'Florida'),
('New York', 'New York');

INSERT INTO Director (lastName, firstName, title, dateInOffice) VALUES
('Ballard', 'Tina','Executive Director & Chief Executive Officer',NULL),
('Robertson', 'Lance','Chair','2018-03-14'),
('Milner', 'Jerry', 'Acting Commissioner','2017-06-05'),
('Robertson', 'Lance', 'Administrator and Assistant Secretary for Aging', '2017-08-11'),
('Hovland', 'Jeannie', 'Commissioner','2018-07-10'),
('Wiener', 'Matthew', 'Vice Chairman, Executive Director, Acting Agency Head', NULL),
('Duff', 'James', 'Director', '2015-01-01'),
('Fowler', 'John', 'Executive Director', NULL),
('Glin', 'C.D.','President and Chief Executive Officer','2016-09-01'),
('Pack', 'Michael', 'Chief Executive Officer','2020-06-04'),
('Khanna', 'Gopal', 'Director', '2017-05-09'),
('Barsa', 'John', 'Acting Administrator', '2020-04-11'),
('Redfield', 'Robert', 'Administrator', '2018-03-26'),
('Summers','Bruce', 'Administrator', '2020-05-26'),
('Jacobs-Young', 'Chavonda', 'Administrator', '2014-02-01'),
('Perdue', 'George', 'Secretary', '2017-04-25'),
('Wester', 'Paul', 'Director', '2015-01-01'),
('Barrett', 'Barbara', 'Secretary', '2019-10-18'),
('Scobee', 'Richard', 'Commander', '2018-01-01'),
('Ryan', 'Mary', 'Acting Administrator', NULL),
('Lombardo', 'Regina', 'Acting Director', '2019-05-01'),
('Fernandez', 'Alberto', 'President', '2017-07-01'),
('Matz', 'William', 'Secretary', '2018-01-09'),
('Spellman', 'Chester', 'Director', '2017-08-01'),
('Flynn', 'William', 'President and Chief Executive Officer', '2020-04-15'),
('Shea', 'Kevin', 'Administrator', '2013-06-18'),
('Delrahim', 'Makan', 'Assistant Attorney General', '2017-09-17'),
('Thomas', 'Tim', 'Federal Co-Chair', '2018-04-03'),
('Blanton', 'J. Brett', 'Architect of the Capitol', '2020-01-16'),
('Ferriero', 'David', 'Archivist of the United States', '2009-11-06'),
('Farrell', 'John', 'Executive Director', NULL),
('Rippe', 'Stephen', 'Chief Executive Officer', '2017-11-01'),
('Ford', 'Christopher', 'Assistant Secretary', '2018-01-09'),
('McCarthy', 'Ryan', 'Secretary', '2019-09-30'),
('Semonite', 'Todd', 'Chief of Engineers and Commanding General', '2016-05-09'),
('Lindsey', 'Criswell', 'Director', '2021-01-01'),
(NULL, NULL, NULL, NULL),
('Mateja', 'John', 'President and Executive Secretary', '2016-01-01'),
('Mainzer', 'Elliot', 'Administrator', '2014-01-01'),
('Chapotin', 'Saharah', 'Executive Director', '2018-02-01'),
('Risch', 'Carl', 'Assistant Secretary', '2017-08-11'),
('Kraninger', 'Kathy', 'Director', '2018-12-01'),
('Bohman', 'Mary', 'Acting Deputy Director', '2019-03-01'),
('Olijar', 'Leonard', 'Director', '2015-01-01'),
('Sweeney', 'Tara', 'Assistant Secretary', '2018-08-01'),
('Hull', 'Cordell', 'Under Secretary of Commerce for Industry and Security', '2018-10-01'),
('Newton', 'Martha', 'Deputy Undersecretary for International Affairs', '2017-09-01'),
('Anderson', 'Jeffrey', 'Director', '2017-11-21'),
('Beach', 'William', 'Commissioner', '2019-03-13'),
('Pendley', 'William', 'Acting Director', '2019-07-15'),
('Cruickshank', 'Walter', 'Acting Director', '2011-10-01'),
('Carvajal', 'Michael', 'Director', '2020-02-25'),
('Burman', 'Brenda', 'Commissioner', '2017-11-16'),
('Angelle', 'Scott', 'Director', '2017-05-24'),
('Dillingham', 'Steve', 'Director', '2019-01-07'),
('Gribben', 'Timothy', 'Commissioner', '2019-05-13'),
('Hu', 'Patricia', 'Director', NULL),
('Sund', 'Steven', 'Chief of Police', '2017-06-01'),
('Stump', 'Scott', 'Assistant Secretary', '2018-07-18'),
('Mayne', 'Susan', 'Director', '2015-01-01'),
('Miller', 'Pam', 'Administrator', '2019-08-19'),
('Jennings', 'Debra', 'Director', NULL),
('Redfield', 'Robert', 'Director', '2018-03-26'),
('Verma', 'Seema', 'Administrator', '2017-03-14'),
('McKenzie', 'Kenneth', 'Commander', '2019-03-28'),
('Haspel', 'Gina', 'Director', '2018-05-21'),
('Lemos', 'Katherine', 'Chairperson and CEO', '2020-03-01'),
('Badorrek', 'Gerard', 'Chief Financial Officer', '2014-12-01'),
('York', 'John', 'Senior Advisor', NULL),
('Roat', 'Maria', 'Deputy Federal Chief Information Officer', '2016-09-01'),
('Dreiband', 'Eric', 'Assistant Attorney General', '2018-10-12'),
('Richey', 'Kimberly', 'Acting Assistant Secretary', NULL),
('Severino', 'Roger', 'Director', '2017-01-01'),
('Schultz', 'Karl', 'Commandant', '2018-06-01'),
('Ross', 'Wilbur', 'Secretary', '2017-02-28'),
('Powell', 'Earl', 'Chairman', '2016-12-22'),
('Morales', 'Mauro', 'Director', NULL),
('Singshinuk', 'Erin', 'Executive Director', NULL),
('Adler', 'Robert', 'Chairman', '2019-10-01'),
('Hastings', 'Alcee', 'Chair', '2019-01-01'),
('Tabert', 'Heath', 'Chairman', '2019-07-15'),
('Keith', 'Phil', 'Director', '2018-04-01'),
('Gibbs', 'John', 'Assistant Secretary', '2017-08-01'),
('Grundmann', 'Susan', 'Executive Director', '2017-01-01'),
('Books', 'Brian', 'Comptroller', '2020-05-29'),
('Pelosi', 'Nancy', 'Speaker', '2019-01-03'),
('McConnell', 'Mitch', 'Majority Leader', '2019-01-03'),
('Swagel', 'Phillip', 'Director', '2019-06-03'),
('Mazanec', 'Mary', 'Director', '2011-01-01'),
('Strong', 'Maria', 'Register of Copyrights', '2020-01-05'),
('Stewart', 'Barbara', 'Chief Executive Officer', '2018-02-01'),
('Goodspeed', 'Tyler', 'Acting Chair', '2020-06-24'),
('Rigas', 'Michael', ' Executive Chair', NULL),
('Neumayr', 'Mary', 'Chairman', '2019-01-02'),
('Stucky', 'Scott', 'Chief Judge', '2009-12-20'),
('Prost', 'Sharon', 'Chief Judge', '2014-05-30'),
('Bartley', 'Margaret', 'Chief Judge', '2019-12-04'),
('Sweeney', 'Margaret', 'Chief Judge', '2018-07-12'),
('Stanceu', 'Timothy', 'Chief Judge', '2014-07-01'),
('Tischner', 'Richard', 'Director', '2019-02-11'),
('Morgan', 'Mark', 'Acting Commissioner', '2019-07-05'),
('Krebs', 'Christopher', 'Director', '2018-11-06');

INSERT INTO Government_Branch (name) VALUES
('Executive Department Sub-Office/Agency/Bureau'),
('Independent Agency'),
('Judicial'),
('Independent Board, Commission, Committee'),
('Executive Department'),
('None'),
('Legislative'),
('Quasi-official'),
('Executive Office of the President');

INSERT INTO Agency_Director (agencyID, directorID) VALUES
(1000,2000),
(1001,2001),
(1002,2002),
(1003,2003),
(1004,2004),
(1005,2005),
(1006,2006),
(1007,2007),
(1008,2008),
(1009,2009),
(1010,2010),
(1011,2011),
(1012,2012),
(1013,2013),
(1014,2014),
(1015,2015),
(1016,2016),
(1017,2017),
(1018,2018),
(1019,2019),
(1020,2020),
(1021,2021),
(1022,2022),
(1023,2023),
(1024,2024),
(1025,2025),
(1026,2026),
(1027,2027),
(1028,2028),
(1029,2029),
(1030,2030),
(1031,2031),
(1032,2032),
(1033,2033),
(1034,2034),
(1035,2035),
(1036,2036),
(1037,2037),
(1038,2038),
(1039,2039),
(1040,2040),
(1041,2041),
(1042,2042),
(1043,2043),
(1044,2044),
(1045,2045),
(1046,2046),
(1047,2047),
(1048,2048),
(1049,2049),
(1050,2050),
(1051,2051),
(1052,2052),
(1053,2053),
(1054,2054),
(1055,2055),
(1056,2056),
(1057,2057),
(1058,2028),
(1059,2058),
(1060,2059),
(1061,2060),
(1062,2061),
(1063,2062),
(1064,2063),
(1065,2064),
(1066,2065),
(1067,2066),
(1068,2036),
(1069,2067),
(1070,2068),
(1071,2069),
(1072,2036),
(1073,2036),
(1074,2036),
(1075,2070),
(1076,2071),
(1077,2072),
(1078,2073),
(1079,2074),
(1080,2075),
(1081,2076),
(1082,2077),
(1083,2078),
(1084,2036),
(1085,2036),
(1086,2079),
(1087,2036),
(1088,2036),
(1089,2080),
(1090,2081),
(1091,2082),
(1092,2083),
(1093,2084),
(1094,2036),
(1095,2085),
(1096,2086),
(1097,2087),
(1098,2088),
(1099,2089),
(1100,2090),
(1101,2091),
(1102,2092),
(1103,2093),
(1104,2094),
(1105,2095),
(1106,2096),
(1107,2097),
(1108,2098),
(1109,2099),
(1110,2100),
(1111,2101);

INSERT INTO Agency_Branch (agencyID, branchID) VALUES
(1000,3000),
(1001,3000),
(1002,3000),
(1003,3000),
(1004,3000),
(1005,3001),
(1006,3002),
(1007,3003),
(1008,3001),
(1009,3001),
(1010,3000),
(1011,3001),
(1012,3000),
(1013,3000),
(1014,3000),
(1015,3004),
(1016,3000),
(1017,3000),
(1018,3000),
(1019,3000),
(1020,3000),
(1021,3000),
(1022,3003),
(1023,3005),
(1024,3001),
(1025,3000),
(1026,3000),
(1027,3003),
(1028,3006),
(1029,3001),
(1030,3003),
(1031,3000),
(1032,3000),
(1033,3000),
(1034,3000),
(1035,3000),
(1036,3002),
(1037,3003),
(1038,3000),
(1039,3006),
(1040,3000),
(1041,3001),
(1042,3000),
(1043,3000),
(1044,3000),
(1045,3000),
(1046,3000),
(1047,3000),
(1048,3000),
(1049,3000),
(1050,3000),
(1051,3000),
(1052,3000),
(1053,3000),
(1054,3000),
(1055,3000),
(1056,3000),
(1057,3006),
(1058,3006),
(1059,3000),
(1060,3000),
(1061,3000),
(1062,3007),
(1063,3000),
(1064,3000),
(1065,3000),
(1066,3001),
(1067,3003),
(1068,3005),
(1069,3005),
(1070,3005),
(1071,3005),
(1072,3000),
(1073,3002),
(1074,3003),
(1075,3000),
(1076,3000),
(1077,3000),
(1078,3000),
(1079,3004),
(1080,3003),
(1081,3001),
(1082,3000),
(1083,3001),
(1084,3003),
(1085,3001),
(1086,3001),
(1087,3000),
(1088,3003),
(1089,3001),
(1090,3000),
(1091,3000),
(1092,3006),
(1093,3000),
(1094,3000),
(1095,3006),
(1096,3006),
(1097,3006),
(1098,3006),
(1099,3006),
(1100,3001),
(1101,3008),
(1102,3003),
(1103,3008),
(1104,3002),
(1105,3002),
(1106,3002),
(1107,3002),
(1108,3002),
(1109,3000),
(1110,3000),
(1111,3000);

#INSERT INTO Parent_Agency (agencyID, parentID) VALUES
#();

INSERT INTO Agency_Location (agencyID, locationID) VALUES
(1000,4000),
(1001,4001),
(1002,4001),
(1003,4001),
(1004,4001),
(1005,4001),
(1006,4001),
(1007,4001),
(1008,4001),
(1009,4001),
(1010,4002),
(1011,4001),
(1012,4003),
(1013,4001),
(1014,4004),
(1015,4001),
(1016,4004),
(1017,4001),
(1018,4005),
(1019,4001),
(1020,4001),
(1021,4006),
(1022,4007),
(1023,4001),
(1024,4001),
(1025,4001),
(1026,4001),
(1027,4001),
(1028,4001),
(1029,4008),
(1030,4007),
(1031,4001),
(1032,4001),
(1033,4001),
(1034,4001),
(1035,4009),
(1036,4010),
(1037,4011),
(1038,4012),
(1039,4001),
(1040,4001),
(1041,4013),
(1042,4001),
(1043,4001),
(1044,4001),
(1045,4001),
(1046,4001),
(1047,4001),
(1048,4001),
(1049,4001),
(1050,4001),
(1051,4001),
(1052,4001),
(1053,4001),
(1054,4001),
(1055,4001),
(1056,4001),
(1057,4001),
(1058,4001),
(1059,4001),
(1060,4008),
(1061,4012),
(1062,4014),
(1063,4001),
(1064,4015),
(1065,4016),
(1066,4001),
(1067,4001),
(1068,4011),
(1069,4011),
(1070,4011),
(1071,4011),
(1072,4001),
(1073,4005),
(1074,4001),
(1075,4001),
(1076,4001),
(1077,4001),
(1078,4001),
(1079,4001),
(1080,4001),
(1081,4001),
(1082,4001),
(1083,4009),
(1084,4001),
(1085,4001),
(1086,4001),
(1087,4001),
(1088,4001),
(1089,4001),
(1090,4001),
(1091,4001),
(1092,4001),
(1093,4001),
(1094,4001),
(1095,4001),
(1096,4001),
(1097,4001),
(1098,4001),
(1099,4001),
(1100,4001),
(1101,4001),
(1102,4001),
(1103,4001),
(1104,4001),
(1105,4001),
(1106,4001),
(1107,4001),
(1108,4017),
(1109,4001),
(1110,4001),
(1111,4001);

SELECT Agency.name, Agency.creationDate, Agency.website, Agency.acronym, Agency.motto, Director.lastName, Director.firstName, Director.title, Director.dateInOffice FROM Agency
INNER JOIN Agency_Director ON Agency_Director.agencyID = Agency.id
INNER JOIN Director ON Agency_Director.directorID = Director.id
ORDER BY Agency.id;