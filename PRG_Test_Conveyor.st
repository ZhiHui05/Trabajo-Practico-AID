(*
    Prueba de comunicacion PLC -> Factory I/O
    ------------------------------------------
    Escenario: Elevator
    Driver: Modbus TCP/IP Client (127.0.0.1:502, Slave ID 1)

    Mapeo utilizado:
        Coil 0  (At 1)        -> %IX20.0   (Factory I/O -> PLC)
        Input 0 (Conveyor 0)  -> %QX20.0   (PLC -> Factory I/O)

    Si en la pestana "Asignacion E/S" del ModbusTCP_Server_Device
    las direcciones son distintas, cambia aqui %IX20.0 / %QX20.0
    por las que aparezcan en la columna "Direccion" de los canales
    Bit0 de Bobinas y Entradas discretas.
*)

PROGRAM PRG_Test_Conveyor
VAR
    xMarcha   : BOOL := TRUE;    // TRUE = Conveyor 0 en marcha / FALSE = parado
    xLatido   : BOOL;            // Parpadeo 1 Hz: confirma que el PLC ejecuta
    tonLatido : TON;
    xAt1      : BOOL;            // Sensor "At 1" (Coil 0)
END_VAR

// ------------------------------------------------------------------
// Latido de 1 Hz (solo para ver que el programa se esta ejecutando)
// ------------------------------------------------------------------
tonLatido(IN := NOT tonLatido.Q, PT := T#1S);
IF tonLatido.Q THEN
    xLatido := NOT xLatido;
END_IF;

// ------------------------------------------------------------------
// Lectura de un sensor: Factory I/O -> PLC
// Coil 0 = At 1
// ------------------------------------------------------------------
xAt1 := %IX20.0;

// ------------------------------------------------------------------
// Escritura de un actuador: PLC -> Factory I/O
// Input 0 = Conveyor 0
// ------------------------------------------------------------------
%QX20.0 := xMarcha;

// Si el conveyor 0 no responde, prueba con otro Input (comenta el anterior):
// %QX20.1 := xMarcha;   // Input 1
// %QX20.2 := xMarcha;   // Input 2
