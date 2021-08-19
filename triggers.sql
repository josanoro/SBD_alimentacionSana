drop trigger if exists crearDeUsuario;
DELIMITER ||
CREATE TRIGGER crearDeUsuario
	AFTER INSERT ON USUARIO
    FOR EACH ROW BEGIN
    INSERT INTO TABLERO_SEMANAL
		SET TABLERO_SEMANAL.id_usuario = NEW.id_usuario;
    INSERT INTO RESUMEN_SEMANAL
		SET RESUMEN_SEMANAL.id_usuario = NEW.id_usuario;
END ||
DELIMITER ;
/*trigger que crea tablero y resumen semanal cuando se ingresa un usuario (vacíos)*/

drop trigger if exists eliminarRecetasIngrediente;
DELIMITER ||
CREATE TRIGGER eliminarRecetasIngrediente
	BEFORE DELETE ON INGREDIENTE
    FOR EACH ROW BEGIN
    DELETE FROM RECETA
		WHERE RECETA.ID_RECETA = INGEREDIENTE.ID_RECETA;
END ||
DELIMITER ;

/* elimina las recetas que tienen el ingrediente que se va a eliminar*/