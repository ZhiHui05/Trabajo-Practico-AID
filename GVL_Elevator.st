(*
    GVL de E/S - Escenario Elevator (Advanced) LZH_MMC
    ---------------------------------------------------
    Estas variables van SIN direccion AT: se asignan en la pestana
    "Modbus TCP Server Device Asignacion E/S" del dispositivo
    ModbusTCP_Server_Device, en el mismo orden que la tabla:
        Tabla_IO_Elevator.md / Tabla_IO_Elevator.csv

    Base en este proyecto:
        Bobinas            -> %IX20.0 ...
        Entradas discretas -> %QX20.0 ...
        Registros Input    -> Display en %QW0

    Si en tu proyecto las direcciones son otras, lo importante es
    respetar el ORDEN de los canales (Coil 0, Coil 1, ...).
*)

VAR_GLOBAL
    // ============================================================
    // SENSORES: Factory I/O -> PLC  (Coils -> %IX20.x, %IX21.x...)
    // ============================================================
    xAt1                : BOOL;   // Coil 0  -> %IX20.0
    xAt2                : BOOL;   // Coil 1  -> %IX20.1
    xAt3                : BOOL;   // Coil 2  -> %IX20.2
    xAtElevator         : BOOL;   // Coil 3  -> %IX20.3
    xAtEntry            : BOOL;   // Coil 4  -> %IX20.4
    xAtExit             : BOOL;   // Coil 5  -> %IX20.5
    xAt0_Low            : BOOL;   // Coil 6  -> %IX20.6
    xAt0_High           : BOOL;   // Coil 7  -> %IX20.7
    xAt1_Low            : BOOL;   // Coil 8  -> %IX21.0
    xAt1_High           : BOOL;   // Coil 9  -> %IX21.1
    xAt2_Low            : BOOL;   // Coil 10 -> %IX21.2
    xAt2_High           : BOOL;   // Coil 11 -> %IX21.3
    xAt3_Low            : BOOL;   // Coil 12 -> %IX21.4
    xAt3_High           : BOOL;   // Coil 13 -> %IX21.5
    xStart              : BOOL;   // Coil 14 -> %IX21.6
    xReset              : BOOL;   // Coil 15 -> %IX21.7
    xStop               : BOOL;   // Coil 16 -> %IX22.0
    xEmergencyStop      : BOOL;   // Coil 17 -> %IX22.1
    xAuto               : BOOL;   // Coil 18 -> %IX22.2
    xFIORunning         : BOOL;   // Coil 19 -> %IX22.3
    xManual             : BOOL;   // Coil 20 -> %IX22.4  (anadir en Factory I/O)
    xPusherFrontLimit   : BOOL;   // Coil 21 -> %IX22.5  (anadir)
    xPusherBackLimit    : BOOL;   // Coil 22 -> %IX22.6  (anadir)
    xVision1            : BOOL;   // Coil 23 -> %IX22.7  (anadir)
    xVision2            : BOOL;   // Coil 24 -> %IX23.0  (anadir)
    xVision3            : BOOL;   // Coil 25 -> %IX23.1  (anadir)
    xSensorPusher       : BOOL;   // Coil 26 -> %IX23.2  (anadir)

    // ============================================================
    // ACTUADORES: PLC -> Factory I/O  (Inputs -> %QX20.x...)
    // ============================================================
    yConveyor0          : BOOL;   // Input 0  -> %QX20.0
    yConveyor1          : BOOL;   // Input 1  -> %QX20.1
    yConveyor2          : BOOL;   // Input 2  -> %QX20.2
    yConveyor3          : BOOL;   // Input 3  -> %QX20.3
    // Input 4: libre (no usar)
    yLoad               : BOOL;   // Input 5  -> %QX20.5
    yUnload             : BOOL;   // Input 6  -> %QX20.6
    yUp                 : BOOL;   // Input 7  -> %QX20.7
    yDown               : BOOL;   // Input 8  -> %QX21.0
    ySlow               : BOOL;   // Input 9  -> %QX21.1
    yWarningLight       : BOOL;   // Input 10 -> %QX21.2
    yStartLight         : BOOL;   // Input 11 -> %QX21.3
    yResetLight         : BOOL;   // Input 12 -> %QX21.4
    yStopLight          : BOOL;   // Input 13 -> %QX21.5
    yFloor1             : BOOL;   // Input 14 -> %QX21.6
    yFloor2             : BOOL;   // Input 15 -> %QX21.7
    yFloor3             : BOOL;   // Input 16 -> %QX22.0
    yGreen1             : BOOL;   // Input 17 -> %QX22.1
    yYellow1            : BOOL;   // Input 18 -> %QX22.2
    yRed1               : BOOL;   // Input 19 -> %QX22.3
    yGreen2             : BOOL;   // Input 20 -> %QX22.4
    yYellow2            : BOOL;   // Input 21 -> %QX22.5
    yRed2               : BOOL;   // Input 22 -> %QX22.6
    yGreen3             : BOOL;   // Input 23 -> %QX22.7
    yYellow3            : BOOL;   // Input 24 -> %QX23.0
    yRed3               : BOOL;   // Input 25 -> %QX23.1
    yEmitter0           : BOOL;   // Input 26 -> %QX23.2  (anadir)
    yEmitter1           : BOOL;   // Input 27 -> %QX23.3  (anadir)
    yEmitter2           : BOOL;   // Input 28 -> %QX23.4  (anadir)
    yEmitter3           : BOOL;   // Input 29 -> %QX23.5  (anadir)
    yPusher             : BOOL;   // Input 30 -> %QX23.6  (anadir)
    ySalidaGood         : BOOL;   // Input 31 -> %QX23.7  (anadir)
    ySalidaDefective    : BOOL;   // Input 32 -> %QX24.0  (anadir)
    yRemoverGood        : BOOL;   // Input 33 -> %QX24.1  (anadir)
    yRemoverDefective   : BOOL;   // Input 34 -> %QX24.2  (anadir)

    // ============================================================
    // VALOR ENTERO
    // ============================================================
    wDisplay            : WORD;   // Input Reg 0 -> %QW0
END_VAR
