# Tabla de E/S - Elevator (Advanced) LZH_MMC

Escenario guardado el 25/11/2026 00:41. Base CODESYS: bobinas en `%IX20.x`, entradas discretas en `%QX20.x`.

## Sensores (Factory I/O -> PLC)

| Coil | Etiqueta | Direccion | Variable | Estado |
|---:|---|---|---|---|
| 0 | At 1 | `%IX20.0` | `xAt1` | mapeado |
| 1 | At 2 | `%IX20.1` | `xAt2` | mapeado |
| 2 | At 3 | `%IX20.2` | `xAt3` | mapeado |
| 3 | At elevator | `%IX20.3` | `xAtElevator` | mapeado |
| 4 | At entry | `%IX20.4` | `xAtEntry` | mapeado |
| 5 | At exit | `%IX20.5` | `xAtExit` | mapeado |
| 6 | At 0 (low) | `%IX20.6` | `xAt0_Low` | mapeado |
| 7 | At 0 (high) | `%IX20.7` | `xAt0_High` | mapeado |
| 8 | At 1 (low) | `%IX21.0` | `xAt1_Low` | mapeado |
| 9 | At 1 (high) | `%IX21.1` | `xAt1_High` | mapeado |
| 10 | At 2 (low) | `%IX21.2` | `xAt2_Low` | mapeado |
| 11 | At 2 (high) | `%IX21.3` | `xAt2_High` | mapeado |
| 12 | At 3 (low) | `%IX21.4` | `xAt3_Low` | mapeado |
| 13 | At 3 (high) | `%IX21.5` | `xAt3_High` | mapeado |
| 14 | Start | `%IX21.6` | `xStart` | mapeado |
| 15 | Reset | `%IX21.7` | `xReset` | mapeado |
| 16 | Stop | `%IX22.0` | `xStop` | mapeado |
| 17 | Emergency stop | `%IX22.1` | `xEmergencyStop` | mapeado |
| 18 | Auto | `%IX22.2` | `xAuto` | mapeado |
| 19 | FACTORY I/O (Running) | `%IX22.3` | `xFIORunning` | mapeado |
| 20 | Manual | `%IX22.4` | `xManual` | ANADIR |
| 21 | Pusher(Front Limit) | `%IX22.5` | `xPusherFrontLimit` | ANADIR |
| 22 | Pusher (Back Limit) | `%IX22.6` | `xPusherBackLimit` | ANADIR |
| 23 | Vision Sensor 1 | `%IX22.7` | `xVision1` | ANADIR |
| 24 | Vision Sensor 2 | `%IX23.0` | `xVision2` | ANADIR |
| 25 | Vision Sensor 3 | `%IX23.1` | `xVision3` | ANADIR |
| 26 | Sensor_Pusher | `%IX23.2` | `xSensorPusher` | ANADIR |

## Actuadores (PLC -> Factory I/O)

| Input | Etiqueta | Direccion | Variable | Estado |
|---:|---|---|---|---|
| 0 | Conveyor 0 | `%QX20.0` | `yConveyor0` | mapeado |
| 1 | Conveyor 1 | `%QX20.1` | `yConveyor1` | mapeado |
| 2 | Conveyor 2 | `%QX20.2` | `yConveyor2` | mapeado |
| 3 | Conveyor 3 | `%QX20.3` | `yConveyor3` | mapeado |
| 4 | (libre) | `-` | `-` | libre |
| 5 | Load | `%QX20.5` | `yLoad` | mapeado |
| 6 | Unload | `%QX20.6` | `yUnload` | mapeado |
| 7 | Up | `%QX20.7` | `yUp` | mapeado |
| 8 | Down | `%QX21.0` | `yDown` | mapeado |
| 9 | Slow | `%QX21.1` | `ySlow` | mapeado |
| 10 | Warning light | `%QX21.2` | `yWarningLight` | mapeado |
| 11 | Start light | `%QX21.3` | `yStartLight` | mapeado |
| 12 | Reset light | `%QX21.4` | `yResetLight` | mapeado |
| 13 | Stop light | `%QX21.5` | `yStopLight` | mapeado |
| 14 | Floor 1 | `%QX21.6` | `yFloor1` | mapeado |
| 15 | Floor 2 | `%QX21.7` | `yFloor2` | mapeado |
| 16 | Floor 3 | `%QX22.0` | `yFloor3` | mapeado |
| 17 | Green 1 | `%QX22.1` | `yGreen1` | mapeado |
| 18 | Yellow 1 | `%QX22.2` | `yYellow1` | mapeado |
| 19 | Red 1 | `%QX22.3` | `yRed1` | mapeado |
| 20 | Green 2 | `%QX22.4` | `yGreen2` | mapeado |
| 21 | Yellow 2 | `%QX22.5` | `yYellow2` | mapeado |
| 22 | Red 2 | `%QX22.6` | `yRed2` | mapeado |
| 23 | Green 3 | `%QX22.7` | `yGreen3` | mapeado |
| 24 | Yellow 3 | `%QX23.0` | `yYellow3` | mapeado |
| 25 | Red 3 | `%QX23.1` | `yRed3` | mapeado |
| 26 | Emitter 0 | `%QX23.2` | `yEmitter0` | ANADIR |
| 27 | Emitter 1 | `%QX23.3` | `yEmitter1` | ANADIR |
| 28 | Emitter 2 | `%QX23.4` | `yEmitter2` | ANADIR |
| 29 | Emitter 3 | `%QX23.5` | `yEmitter3` | ANADIR |
| 30 | Pusher | `%QX23.6` | `yPusher` | ANADIR |
| 31 | Cinta_Salida_GOOD | `%QX23.7` | `ySalidaGood` | ANADIR |
| 32 | Cinta_Salida_Defetuoso | `%QX24.0` | `ySalidaDefective` | ANADIR |
| 33 | Remover_GOOD | `%QX24.1` | `yRemoverGood` | ANADIR |
| 34 | Remover_Defectuosos | `%QX24.2` | `yRemoverDefective` | ANADIR |
| Input Reg 0 | Display | `%QW0` | `wDisplay` | mapeado |
