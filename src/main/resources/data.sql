-- Inserções na tabela USERS
INSERT INTO USERS (id, rm, password, name)
VALUES (SYS_GUID(), '558471', 'ricardo123', 'Lucas Rainha');
INSERT INTO USERS (id, rm, password, name)
VALUES (SYS_GUID(), '554944', 'futebol', 'Nicolas Barutti');
INSERT INTO USERS (id, rm, password, name)
VALUES (SYS_GUID(), '557887', 'paodequeijo', 'Kleber da Silva');
INSERT INTO USERS (id, rm, password, name)
VALUES (SYS_GUID(), '558472', 'senha123', 'Ana Silva');
INSERT INTO USERS (id, rm, password, name)
VALUES (SYS_GUID(), '554945', 'outrasenha', 'Carlos Oliveira');

-- Inserções na tabela SECTOR
INSERT INTO SECTOR (id, name) VALUES (SYS_GUID(), 'A');
INSERT INTO SECTOR (id, name) VALUES (SYS_GUID(), 'B');
INSERT INTO SECTOR (id, name) VALUES (SYS_GUID(), 'C');
INSERT INTO SECTOR (id, name) VALUES (SYS_GUID(), 'D');
INSERT INTO SECTOR (id, name) VALUES (SYS_GUID(), 'E');

-- Inserções na tabela SPOT
INSERT INTO SPOT (id, code, occupied, sector_id)
SELECT SYS_GUID(), 'A1', 0, (SELECT id FROM SECTOR WHERE name = 'A' AND ROWNUM = 1) FROM DUAL;
INSERT INTO SPOT (id, code, occupied, sector_id)
SELECT SYS_GUID(), 'A2', 1, (SELECT id FROM SECTOR WHERE name = 'A' AND ROWNUM = 1) FROM DUAL;

INSERT INTO SPOT (id, code, occupied, sector_id)
SELECT SYS_GUID(), 'A1', 0, (SELECT id FROM SECTOR WHERE name = 'B' AND ROWNUM = 1) FROM DUAL;
INSERT INTO SPOT (id, code, occupied, sector_id)
SELECT SYS_GUID(), 'A2', 0, (SELECT id FROM SECTOR WHERE name = 'B' AND ROWNUM = 1) FROM DUAL;

INSERT INTO SPOT (id, code, occupied, sector_id)
SELECT SYS_GUID(), 'A1', 1, (SELECT id FROM SECTOR WHERE name = 'C' AND ROWNUM = 1) FROM DUAL;
INSERT INTO SPOT (id, code, occupied, sector_id)
SELECT SYS_GUID(), 'A2', 1, (SELECT id FROM SECTOR WHERE name = 'C' AND ROWNUM = 1) FROM DUAL;

INSERT INTO SPOT (id, code, occupied, sector_id)
SELECT SYS_GUID(), 'A1', 1, (SELECT id FROM SECTOR WHERE name = 'D' AND ROWNUM = 1) FROM DUAL;
INSERT INTO SPOT (id, code, occupied, sector_id)
SELECT SYS_GUID(), 'A2', 0, (SELECT id FROM SECTOR WHERE name = 'E' AND ROWNUM = 1) FROM DUAL;

-- Inserções na tabela MOTORCYCLE
INSERT INTO MOTORCYCLE (id, sector_id, plate, plate_readable, type)
SELECT SYS_GUID(), (SELECT id FROM SECTOR WHERE name = 'A' AND ROWNUM = 1), 'ABC1D23', 1, 'ELECTRIC' FROM DUAL;
INSERT INTO MOTORCYCLE (id, sector_id, plate, plate_readable, type)
SELECT SYS_GUID(), (SELECT id FROM SECTOR WHERE name = 'B' AND ROWNUM = 1), 'XYZ9K87', 1, 'COMBUSTION' FROM DUAL;
INSERT INTO MOTORCYCLE (id, sector_id, plate, plate_readable, type)
SELECT SYS_GUID(), (SELECT id FROM SECTOR WHERE name = 'C' AND ROWNUM = 1), 'JHK4T56', 1, 'ELECTRIC' FROM DUAL;
INSERT INTO MOTORCYCLE (id, sector_id, plate, plate_readable, type)
SELECT SYS_GUID(), (SELECT id FROM SECTOR WHERE name = 'D' AND ROWNUM = 1), 'LMN7R88', 1, 'COMBUSTION' FROM DUAL;
INSERT INTO MOTORCYCLE (id, sector_id, plate, plate_readable, type)
SELECT SYS_GUID(), (SELECT id FROM SECTOR WHERE name = 'E' AND ROWNUM = 1), 'QWE2Z45', 1, 'ELECTRIC' FROM DUAL;

-- Atualizações na tabela USER_UPDATE
INSERT INTO USER_UPDATE (id, user_id, motorcycle_id, update_date, update_message)
SELECT SYS_GUID(),
    (SELECT id FROM USERS WHERE rm = '558471' AND ROWNUM = 1),
    (SELECT id FROM MOTORCYCLE WHERE plate = 'ABC1D23' AND ROWNUM = 1),
    SYSDATE - 1,
    'Revisão completa do sistema elétrico'
FROM DUAL;

INSERT INTO USER_UPDATE (id, user_id, motorcycle_id, update_date, update_message)
SELECT SYS_GUID(),
    (SELECT id FROM USERS WHERE rm = '554944' AND ROWNUM = 1),
    (SELECT id FROM MOTORCYCLE WHERE plate = 'XYZ9K87' AND ROWNUM = 1),
    SYSDATE - 2,
    'Troca de óleo e filtros realizada'
FROM DUAL;

INSERT INTO USER_UPDATE (id, user_id, motorcycle_id, update_date, update_message)
SELECT SYS_GUID(),
    (SELECT id FROM USERS WHERE rm = '557887' AND ROWNUM = 1),
    (SELECT id FROM MOTORCYCLE WHERE plate = 'JHK4T56' AND ROWNUM = 1),
    SYSDATE - 3,
    'Lavagem completa e polimento'
FROM DUAL;

INSERT INTO USER_UPDATE (id, user_id, motorcycle_id, update_date, update_message)
SELECT SYS_GUID(),
    (SELECT id FROM USERS WHERE rm = '558471' AND ROWNUM = 1),
    (SELECT id FROM MOTORCYCLE WHERE plate = 'LMN7R88' AND ROWNUM = 1),
    SYSDATE - 4,
    'Transferência para área de armazenamento'
FROM DUAL;

INSERT INTO USER_UPDATE (id, user_id, motorcycle_id, update_date, update_message)
SELECT SYS_GUID(),
    (SELECT id FROM USERS WHERE rm = '554944' AND ROWNUM = 1),
    (SELECT id FROM MOTORCYCLE WHERE plate = 'QWE2Z45' AND ROWNUM = 1),
    SYSDATE,
    'Inspeção de rotina - sem problemas encontrados'
FROM DUAL;