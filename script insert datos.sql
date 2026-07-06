USE bd_steven_herrera_cumbia;


INSERT INTO riwi_city (id_riwi_city, name_riwi_city) VALUES
(1, 'Bogotá'),
(2, 'Medellin'),
(3, 'Cali'),
(4, 'Barranquilla'),
(5, 'Cartagena'),
(6, 'Pereira'),
(7, 'Bucaramanga'),
(8, 'Cúcuta'),
(9, 'Manizales'),
(10, 'Santa Marta');


INSERT INTO riwi_branch (id_riwi_branch, name_riwi_branch, id_riwi_city) VALUES
(1, 'North Office', 1),
(2, 'Headquarters', 2),
(3, 'West', 3),
(4, 'Main Office', 4),
(5, 'Coast', 5),
(6, 'Coffee', 6),
(7, 'East Office', 7),
(8, 'NorthEast', 8),
(9, 'Central Office', 9),
(10, 'Caribbean', 10);


INSERT INTO riwi_client (id_riwi_client, name_riwi_client, id_riwi_branch) VALUES
(1, 'Acme LTDA', 1),
(2, 'Innova S.A.S.', 2),
(3, 'NovaTech', 3),
(4, 'BioHealth', 4),
(5, 'SoftCorp', 5),
(6, 'Vision S.A.', 6),
(7, 'RetailOne', 7),
(8, 'EduCenter', 8),
(9, 'HealthPlus', 9),
(10, 'MegaFoods', 10);


INSERT INTO riwi_technician (id_riwi_technician, name_riwi_technician) VALUES
(1, 'Juan Perez'),
(2, 'Maria Gomez'),
(3, 'Carlos Ruiz'),
(4, 'Laura Diaz'),
(5, 'Andres Mora');


INSERT INTO riwi_service (id_riwi_service, name_riwi_service ) VALUES
(1, 'Preventive Maintenance'),
(2, 'Corrective Maintenance'),
(3, 'Repair'),
(4, 'Installation');


INSERT INTO riwi_equipment_category (id_riwi_equipment_category, name_riwi_equipment_category) VALUES
(1, 'Laptops'),
(2, 'Desktops'),
(3, 'Network'),
(4, 'Printers');


INSERT INTO riwi_equipment (id_riwi_equipment, name_riwi_equipment, id_riwi_equipment_category) VALUES
(1, 'Dell Latitude 5420', 1),
(2, 'HP Pro Desk', 2),
(3, 'Cisco Switch 2960', 3),
(4, 'Canon Pixma', 4),
(5, 'Lenovo ThinkPad', 1);


INSERT INTO riwi_work_order (id_riwi_work_order, riwi_work_order , riwi_service_date, riwi_hours, riwi_cost, id_riwi_technician, id_riwi_client, id_riwi_equipment, id_riwi_service) VALUES
(1, 'WO1001', '2026-05-01', 2, 120, 1, 1, 1, 1),
(2, 'WO1002', '2026-05-02', 3, 180, 1, 2, 2, 2),
(3, 'WO1003', '2026-05-03', 4, 250, 2, 3, 3, 3),
(4, 'WO1004', '2026-05-04', 2, 150, 2, 4, 4, 4),
(5, 'WO1005', '2026-05-05', 5, 500, 3, 5, 5, 1),
(6, 'WO1006', '2026-05-06', 4, 450, 3, 6, 1, 2),
(7, 'WO1007', '2026-05-07', 2, 130, 4, 7, 2, 3),
(8, 'WO1008', '2026-05-08', 3, 200, 4, 8, 3, 4),
(9, 'WO1009', '2026-05-09', 2, 140, 5, 9, 4, 1),
(10, 'WO1010', '2026-05-10', 3, 190, 5, 10, 5, 2),
(11, 'WO1011', '2026-05-11', 6, 550, 1, 1, 1, 3),
(12, 'WO1012', '2026-05-12', 5, 520, 1, 2, 2, 4),
(13, 'WO1013', '2026-05-13', 2, 160, 2, 3, 3, 1),
(14, 'WO1014', '2026-05-14', 3, 210, 2, 4, 4, 2),
(15, 'WO1015', '2026-05-15', 2, 125, 3, 5, 5, 3),
(16, 'WO1016', '2026-05-16', 2, 135, 3, 6, 1, 4),
(17, 'WO1017', '2026-05-17', 4, 400, 4, 7, 2, 1),
(18, 'WO1018', '2026-05-18', 5, 430, 4, 8, 3, 2),
(19, 'WO1019', '2026-05-19', 3, 220, 5, 9, 4, 3),
(20, 'WO1020', '2026-05-20', 4, 260, 5, 10, 5, 4);
