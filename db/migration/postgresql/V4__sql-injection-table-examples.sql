CREATE TABLE sql_injection_table1 (
    id bigserial NOT NULL,
    email character varying(255) NOT NULL,
	password character varying(255) NOT NULL,
	full_name character varying(255) NOT NULL
);

CREATE TABLE sql_injection_table2 (
    id bigserial NOT NULL,
    email character varying(255) NOT NULL,
	password character varying(255) NOT NULL,
	full_name character varying(255) NOT NULL
);

INSERT INTO sql_injection_table1 (email,password,full_name) VALUES ('sedap@vut.cz','batman','pavel');
INSERT INTO sql_injection_table1 (email,password,full_name) VALUES ('sedap2@vut.cz','test','petr');
INSERT INTO sql_injection_table1 (email,password,full_name) VALUES ('sedap3@vut.cz','pwd','miloš');
INSERT INTO sql_injection_table1 (email,password,full_name) VALUES ('sedap4@vut.cz','pwd2','karolína');
INSERT INTO sql_injection_table1 (email,password,full_name) VALUES ('sedap5@vut.cz','12345','václav');
INSERT INTO sql_injection_table1 (email,password,full_name) VALUES ('sedap6@vut.cz','12345','václav');
INSERT INTO sql_injection_table1 (email,password,full_name) VALUES ('sedap7@vut.cz','12345','karolína');
INSERT INTO sql_injection_table1 (email,password,full_name) VALUES ('sedap8@vut.cz','12345','miloš');
INSERT INTO sql_injection_table1 (email,password,full_name) VALUES ('sedap9@vut.cz','12345','pepa');

INSERT INTO sql_injection_table2 (email,password,full_name) VALUES ('sedap@vut.cz','12345','jonáš');
INSERT INTO sql_injection_table2 (email,password,full_name) VALUES ('sedap2@vut.cz','12345','marvel');
INSERT INTO sql_injection_table2 (email,password,full_name) VALUES ('sedap3@vut.cz','12345','koblížek');
INSERT INTO sql_injection_table2 (email,password,full_name) VALUES ('sedap4@vut.cz','12345','karolína');
INSERT INTO sql_injection_table2 (email,password,full_name) VALUES ('sedap5@vut.cz','123456','kačenka');
INSERT INTO sql_injection_table2 (email,password,full_name) VALUES ('sedap6@vut.cz','123456','kocour');
INSERT INTO sql_injection_table2 (email,password,full_name) VALUES ('sedap7@vut.cz','12345612','zdeňka');
INSERT INTO sql_injection_table2 (email,password,full_name) VALUES ('sedap8@vut.cz','12345612','nela');
