CREATE TABLE address (
    id_address bigserial NOT NULL,
    city character varying(45) NOT NULL,
    house_number integer NOT NULL,
    street character varying(45) NOT NULL,
    zip_code character varying(45)
);

ALTER TABLE address OWNER TO postgres;

CREATE TABLE contact (
    id_contact bigserial NOT NULL,
    contact character varying(45) NOT NULL,
    id_contact_type bigint,
    id_person bigint
);

ALTER TABLE contact OWNER TO postgres;

CREATE TABLE contact_type (
    id_contact_type bigserial NOT NULL,
    title character varying(45) NOT NULL
);

ALTER TABLE contact_type OWNER TO postgres;

CREATE TABLE meeting (
    id_meeting bigserial NOT NULL,
    duration bigint NOT NULL,
    note character varying(1000),
    place character varying(200) NOT NULL,
    start_time timestamp without time zone NOT NULL
);


ALTER TABLE meeting OWNER TO postgres;

CREATE TABLE person (
    id_person bigserial NOT NULL,
    age integer,
    birthday date,
    email character varying(100) NOT NULL,
    first_name character varying(45) NOT NULL,
    nickname character varying(45) NOT NULL,
    pwd character varying(255) NOT NULL,
    surname character varying(45) NOT NULL,
    id_address bigint
);

ALTER TABLE person OWNER TO postgres;

CREATE TABLE person_has_meeting (
    id_person bigint NOT NULL,
    id_meeting bigint NOT NULL
);

ALTER TABLE person_has_meeting OWNER TO postgres;

CREATE TABLE person_role (
    id_person bigint NOT NULL,
    role character varying(255) NOT NULL
);

ALTER TABLE person_role OWNER TO postgres;

CREATE TABLE relationship (
    id_relationship bigserial NOT NULL,
    note character varying(200),
    id_person1 bigint,
    id_person2 bigint,
    id_relationship_type bigint
);

ALTER TABLE relationship OWNER TO postgres;

CREATE TABLE relationship_type (
    id_relationship_type bigserial NOT NULL,
    title character varying(255) NOT NULL
);

ALTER TABLE relationship_type OWNER TO postgres;

ALTER TABLE relationship_type OWNER TO postgres;

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id_address);
ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id_contact);
ALTER TABLE ONLY contact_type
    ADD CONSTRAINT contact_type_pkey PRIMARY KEY (id_contact_type);
ALTER TABLE ONLY meeting
    ADD CONSTRAINT meeting_pkey PRIMARY KEY (id_meeting);
ALTER TABLE ONLY person_has_meeting
    ADD CONSTRAINT person_has_meeting_pkey PRIMARY KEY (id_person, id_meeting);
ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id_person);
ALTER TABLE ONLY person_role
    ADD CONSTRAINT person_role_pkey PRIMARY KEY (id_person, role);
ALTER TABLE ONLY relationship
    ADD CONSTRAINT relationship_pkey PRIMARY KEY (id_relationship);
ALTER TABLE ONLY relationship_type
    ADD CONSTRAINT relationship_type_pkey PRIMARY KEY (id_relationship_type);
ALTER TABLE ONLY contact_type
    ADD CONSTRAINT uk_1fq45jis28gt2u2qt757e04vy UNIQUE (title);
ALTER TABLE ONLY relationship_type
    ADD CONSTRAINT uk_r42xwql4glcbqp0y3r3mo4tac UNIQUE (title);
ALTER TABLE ONLY relationship
    ADD CONSTRAINT fk3b7pcnfgfdblhublf8t8dvn9l FOREIGN KEY (id_relationship_type) REFERENCES relationship_type(id_relationship_type);
ALTER TABLE ONLY person_has_meeting
    ADD CONSTRAINT fk6nyhtkxr5sh5ffdcxefbnwfjj FOREIGN KEY (id_meeting) REFERENCES person(id_person);
ALTER TABLE ONLY person_has_meeting
    ADD CONSTRAINT fk92pqvoxbjila4o02fp18rstq4 FOREIGN KEY (id_person) REFERENCES meeting(id_meeting);
ALTER TABLE ONLY relationship
    ADD CONSTRAINT fkahw6wujjfkm21yqfhar09k3fk FOREIGN KEY (id_person1) REFERENCES person(id_person);
ALTER TABLE ONLY relationship
    ADD CONSTRAINT fkdkyv2jjonl0trwvbsnmw7wugr FOREIGN KEY (id_person2) REFERENCES person(id_person);
ALTER TABLE ONLY person_role
    ADD CONSTRAINT fkqbljdqxhnn666ss0ex4fnbm34 FOREIGN KEY (id_person) REFERENCES person(id_person);
ALTER TABLE ONLY contact
    ADD CONSTRAINT fksdofi6j6flua1it19rnx6xcvb FOREIGN KEY (id_person) REFERENCES person(id_person);
ALTER TABLE ONLY person
    ADD CONSTRAINT fksukp9r53qgth8ex065xwuw86t FOREIGN KEY (id_address) REFERENCES address(id_address);
ALTER TABLE ONLY contact
    ADD CONSTRAINT fkx0wbmi3et03b7xwys8sa0d7 FOREIGN KEY (id_contact_type) REFERENCES contact_type(id_contact_type);