CREATE TABLE applications (
    id SERIAL PRIMARY KEY,
    applicant_name VARCHAR(100),
  application_type VARCHAR(50),M  
    application_status VARCHAR(20),
    submitted_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO applications (id,applicant_name, application_type, application_status,submitted_date)
VALUES
(10033,'John Doe', 'Building Permit', 'Pending','2024-02-23'),
(78322,'Jane Smith', 'Fire Safety Certificate', 'Approved','2023-02-24'),
(98499,'Mike Johnson', 'Occupancy Certificate', 'Rejected','2024-02-22');


CREATE TABLE inspections (
    id SERIAL PRIMARY KEY,
    application_id INT REFERENCES applications(id),
    inspector_name VARCHAR(100),
    inspection_date TIMESTAMP,
    inspection_status VARCHAR(20),
    comments TEXT
);
INSERT INTO inspections (id,application_id, inspector_name, inspection_date, inspection_status, comments)
VALUES
(24398,1, 'Inspector A', '2024-09-01 10:00:00', 'Completed', 'Inspection went smoothly, no issues found.'),
(34978,2, 'Inspector B', '2024-08-25 14:30:00', 'Pending', 'Inspection scheduled but not yet completed.'),
(43892,1, 'Inspector C', '2024-09-03 09:15:00', 'Failed', 'Fire alarms were non-functional.'),
(27238,3, 'Inspector D', '2024-09-02 11:45:00', 'Completed', 'Inspection completed, minor issues noted.');


CREATE TABLE nocs (
    id SERIAL PRIMARY KEY,
    application_id INT REFERENCES applications(id),
    issued_date TIMESTAMP,
    expiry_date TIMESTAMP,
    noc_status VARCHAR(20)
);
INSERT INTO nocs (id,application_id, issued_date, expiry_date, noc_status)
VALUES
(37488,2, '2024-09-01 12:00:00', '2025-09-01 12:00:00', 'Active'),
(87592,1, '2024-09-04 08:00:00', '2025-09-04 08:00:00', 'Expired'),
(23794,3, '2024-09-05 15:00:00', '2025-09-05 15:00:00', 'Active');
select * from applications;
select * from inspections;
select * from nocs;
