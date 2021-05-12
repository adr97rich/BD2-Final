-- cuando se crea un reporte de averia sobre un vehiculo, si su prioridad es alta, cambiar estado del vehiculo a mantenimiento
create or replace TRIGGER enviar_a_mantenimiento
    BEFORE UPDATE OR INSERT ON reportes_de_averias
    FOR EACH ROW
    WHEN (NEW.prioridad > 1)
DECLARE
    -- pragma autonomous_transaction;
    prioridad NUMBER;
    id_vehiculo NUMBER;
BEGIN
    UPDATE vehiculos v SET v.estado = 'mantenimiento' WHERE v.id_vehiculo = :NEW.id_vehiculo;
    insert into temporal values (:NEW.id_vehiculo, :NEW.prioridad);
END;

-- cuando se añada un vehiculo a la tabla mantenimiento, su estado de cambiar a mantenimiento



