USE bd_isaac_guzman_cumbia;


START TRANSACTION;

INSERT INTO riwi_client (name_riwi_client , id_riwi_branch)
VALUES ('Global Tech Corp', 1); 

INSERT INTO riwi_work_order (riwi_work_order, riwi_service_date, riwi_hours, riwi_cost,
                              id_riwi_technician, id_riwi_client,
                              id_riwi_equipment, id_riwi_service)
VALUES ('WO1021', CURDATE(), 3, 210,
        1,                              
        LAST_INSERT_ID(),               
        1,                              
        1);                             

COMMIT;

-- Verificar
SELECT c.id_riwi_client, c.name_riwi_client, wo.riwi_work_order, wo.riwi_service_date
FROM riwi_client c
JOIN riwi_work_order wo ON wo.id_riwi_client = c.id_riwi_client
WHERE c.name_riwi_client = 'Global Tech Corp';


-- actualizar 

UPDATE riwi_technician
SET name_riwi_technician  = 'Isaac Guzman'
WHERE id_riwi_technician = 1;

SELECT * FROM riwi_technician WHERE id_riwi_technician = 1;


-- eliminar


SELECT e.id_riwi_equipment, e.name_riwi_equipment  
FROM riwi_equipment e
LEFT JOIN riwi_work_order wo ON wo.id_riwi_equipment = e.id_riwi_equipment
WHERE wo.id_riwi_work_order IS NULL;


INSERT INTO riwi_equipment (name_riwi_equipment, id_riwi_equipment_category)
VALUES ('Lenovo portatil (equipo de prueba)', 4);


DELETE FROM riwi_equipment
WHERE name_riwi_equipment = 'Lenovo portatil (equipo de prueba)';




