/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

ExileRouletteChairs = [];
ExileRouletteChairPositions = [];

// 5 Vehicles
private _vehicles = [
["Exile_Sign_RussianRoulette", [3812.01, 14048.22, 312.035], [-0.417614, -0.908624, 0], [0, 0, 1], true],
["Exile_RussianRouletteChair", [3805.33, 14044.21, 311.188], [0.921879, -0.387478, 0], [0, 0, 1], true],
["Exile_RussianRouletteChair", [3803.45, 14045.18, 311.188], [-0.916838, 0.39926, 0], [0, 0, 1], true],
["Land_WoodenTable_large_F_Preview", [3804.46, 14044.89, 311.62], [0.42735, 0.904086, 0], [0, 0, 1], true],
["Land_Money_F", [3804.1, 14044.13, 312.088], [0, 1, 0], [0, 0, 1], true]
];

{
    private _vehicle = (_x select 0) createVehicle (_x select 1);
    _vehicle allowDamage false;
    _vehicle setPosWorld (_x select 1);
    _vehicle setVectorDirAndUp [_x select 2, _x select 3];
    _vehicle enableSimulationGlobal (_x select 4);
    _vehicle setVariable ["ExileIsLocked", -1, true];
    
    if (_vehicle isKindOf "Exile_RussianRouletteChair") then
    {
        ExileRouletteChairs pushBack _vehicle;
        ExileRouletteChairPositions pushBack [_x select 1, getDir _vehicle];
    };
}
forEach _vehicles;

// 0 Simple Objects
private _invisibleSelections = ["zasleh", "zasleh2", "box_nato_grenades_sign_f", "box_nato_ammoord_sign_f", "box_nato_support_sign_f"];
private _simpleObjects = [

];

{
    private _simpleObject = createSimpleObject [_x select 0, _x select 1];
    _simpleObject setVectorDirAndUp [_x select 2, _x select 3];
    
    {
        if ((toLower _x) in _invisibleSelections) then 
        {
            _simpleObject hideSelection [_x, true];
        };
    }
    forEach (selectionNames _simpleObject);
}
forEach _simpleObjects;