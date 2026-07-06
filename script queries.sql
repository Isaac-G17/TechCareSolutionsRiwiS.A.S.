USE bd_isaac_guzman_cumbia;

-- Consulta 1
SELECT
    t.id_riwi_technician,
    t.name_riwi_technician ,
    COUNT(wo.id_riwi_work_order) AS total_orders
FROM riwi_technician t
LEFT JOIN riwi_work_order wo ON wo.id_riwi_technician = t.id_riwi_technician
GROUP BY t.id_riwi_technician, t.name_riwi_technician 
ORDER BY total_orders DESC;

-- Consulta 2

SELECT
    ct.name_riwi_city,
    COUNT(wo.id_riwi_work_order) AS total_services
FROM riwi_city ct
JOIN riwi_branch b ON b.id_riwi_city = ct.id_riwi_city
JOIN riwi_client c ON c.id_riwi_branch = b.id_riwi_branch
JOIN riwi_work_order wo ON wo.id_riwi_client = c.id_riwi_client
GROUP BY ct.name_riwi_city
ORDER BY total_services DESC;

-- Consulta 3

SELECT
    st.name_riwi_service ,
    COUNT(wo.id_riwi_work_order) AS total_orders,
    SUM(wo.riwi_cost) AS total_cost
FROM riwi_service st
LEFT JOIN riwi_work_order wo ON wo.id_riwi_service = st.id_riwi_service
GROUP BY st.name_riwi_service 
ORDER BY total_orders DESC;

-- Consulta 4

SELECT
    e.name_riwi_equipment,
    ec.name_riwi_equipment_category ,
    COUNT(wo.id_riwi_work_order) AS total_maintenances
FROM riwi_equipment e
JOIN riwi_equipment_category ec ON ec.id_riwi_equipment_category = e.id_riwi_equipment_category
LEFT JOIN riwi_work_order wo ON wo.id_riwi_equipment = e.id_riwi_equipment
GROUP BY e.name_riwi_equipment, ec.name_riwi_equipment_category 
ORDER BY total_maintenances DESC;

-- Consulta 5

SELECT
    c.name_riwi_client ,
    COUNT(wo.id_riwi_work_order) AS total_orders
FROM riwi_client c
LEFT JOIN riwi_work_order wo ON wo.id_riwi_client = c.id_riwi_client
GROUP BY c.name_riwi_client 
ORDER BY total_orders DESC;

-- Consulta 6

SELECT
    b.name_riwi_branch,
    ct.name_riwi_city ,
    COUNT(wo.id_riwi_work_order) AS total_orders
FROM riwi_branch b
JOIN riwi_city ct ON ct.id_riwi_city = b.id_riwi_city
LEFT JOIN riwi_client c ON c.id_riwi_branch = b.id_riwi_branch
LEFT JOIN riwi_work_order wo ON wo.id_riwi_client = c.id_riwi_client
GROUP BY b.name_riwi_branch, ct.name_riwi_city 
ORDER BY total_orders DESC;