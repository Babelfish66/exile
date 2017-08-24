// Put this somewhere in your own init.sqf outside of any other brackets and if statements
[] execVM "R3F_LOG\init.sqf"; // ADD THIS LINE TO YOUR OWN INIT AT THE VERY TOP OR BOTTOM
if hasInterface then
{

	//[] ExecVM "VEMFr_client\sqf\initClient.sqf"; // Client-side part of VEMFr
	//[] ExecVM "ExAdClient\XM8\Apps\BRAmaRecipes\init.sqf"; //Recepies
	[] ExecVM "rouletttrader.sqf"
	
};
