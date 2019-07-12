//Modifed by Thomas [T.K.O] 
///////////////////////////////////////////////////////////////////////////////
// Static Objects
///////////////////////////////////////////////////////////////////////////////


/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com  31089.324  5368.399
 */

if (!hasInterface || isServer) exitWith {};



// 57 NPCs
private _npcs = [
["Exile_Trader_WasteDump", ["c5efe_MichalLoop"], "Exile_Trader_WasteDump", "WhiteHead_14", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [5357.08, 15494.2, 47.453], [-0.542531, -0.840036, 0], [0, 0, 1]],
["Exile_Trader_Office", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Office", "GreekHead_A3_08", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [5352.33, 15515.8, 47.7177], [0.999891, -0.0147732, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["c5efe_MichalLoop"], "Exile_Trader_Vehicle", "WhiteHead_12", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"Exile_Headgear_SantaHat","G_Tactical_Clear",[],["","","","","",""]], [5338.13, 15513.8, 47.7722], [0.244377, -0.96968, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["InBaseMoves_table1"], "Exile_Trader_VehicleCustoms", "WhiteHead_10", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [5343.03, 15523, 46.8302], [-0.965074, -0.013402, 0.261635], [0.261, 0.03707, 0.964627]],
["Exile_Trader_Hardware", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Hardware", "WhiteHead_06", [[],[],[],["U_C_WorkerCoveralls",[]],["V_BandollierB_rgr",[]],["B_UAV_01_backpack_F",[]],"Exile_Headgear_SantaHat","G_Tactical_Clear",[],["","","","","",""]], [5356.71, 15506.5, 47.8089], [0.615111, 0.788441, 0], [0, 0, 1]],
["Exile_Trader_Food", ["HubSittingChairUB_idle3"], "Exile_Trader_Food", "AfricanHead_03", [[],[],[],["U_C_Poloshirt_blue",[]],[],[],"Exile_Headgear_SantaHat","",[],["","","","","",""]], [5358.96, 15512.4, 47.431], [-0.940749, -0.339104, 0], [0, 0, 1]],
["Exile_Trader_Equipment", [], "Exile_Trader_Equipment", "GreekHead_A3_05", [["arifle_MX_GL_Black_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_I_G_resistanceLeader_F",[]],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [5351.85, 15514.9, 50.4184], [0.716397, -0.697693, 0], [0, 0, 1]],
["Exile_Trader_Armory", ["HubSittingChairA_idle2"], "Exile_Trader_Armory", "WhiteHead_16", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_Rangemaster",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Shades_Black",[],["","","","","",""]], [5353.37, 15516.7, 50.4184], [0.597362, -0.801972, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", ["InBaseMoves_patrolling1"], "Exile_Trader_SpecialOperations", "WhiteHead_04", [["arifle_MX_Black_F","","","",[],[],""],[],[],["U_B_CTRG_1",[]],["V_PlateCarrierGL_blk",[]],["B_Parachute",[]],"Exile_Headgear_SantaHat","G_Balaclava_lowprofile",[],["","","","","","NVGoggles_OPFOR"]], [5345.56, 15510.9, 46.9921], [-0.284915, 0.958553, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["c5efe_MichalLoop"], "Exile_Trader_WasteDump", "WhiteHead_21", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Tactical_Clear",[],["","","","","",""]], [11085.7, 11770.8, 232.164], [0.941895, -0.335907, 0], [0, 0, 1]],
["Exile_Trader_Office", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Office", "WhiteHead_19", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","",[],["","","","","",""]], [11073.3, 11829.3, 242.166], [0.156706, -0.987645, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["c5efe_MichalLoop"], "Exile_Trader_Vehicle", "WhiteHead_07", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"Exile_Headgear_SantaHat","G_Tactical_Clear",[],["","","","","",""]], [11105.7, 11826.7, 229.126], [0.907073, 0.420973, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["InBaseMoves_table1"], "Exile_Trader_VehicleCustoms", "WhiteHead_15", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"Exile_Headgear_SantaHat","G_Aviator",[],["","","","","",""]], [11106.4, 11835.2, 227.184], [-0.394313, -0.828875, 0.396842], [0.248784, 0.319423, 0.914371]],
["Exile_Trader_Hardware", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Hardware", "WhiteHead_05", [[],[],[],["U_C_WorkerCoveralls",[]],["V_BandollierB_rgr",[]],["B_UAV_01_backpack_F",[]],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [11060.8, 11817.5, 231.582], [-0.348387, -0.937351, 0], [0, 0, 1]],
["Exile_Trader_Food", ["HubSittingChairUB_idle3"], "Exile_Trader_Food", "WhiteHead_06", [[],[],[],["U_C_Poloshirt_blue",[]],[],[],"Exile_Headgear_SantaHat","G_Tactical_Clear",[],["","","","","",""]], [11053.7, 11813, 231.836], [0.984908, -0.173081, 0], [0, 0, 1]],
["Exile_Trader_Equipment", [], "Exile_Trader_Equipment", "Sturrock", [["arifle_MX_GL_Black_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_I_G_resistanceLeader_F",[]],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [11083.2, 11824.2, 231.2], [-0.0765179, -0.997068, 0], [0, 0, 1]],
["Exile_Trader_Armory", [], "Exile_Trader_Armory", "WhiteHead_21", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_Rangemaster",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Shades_Black",[],["","","","","",""]], [11076.9, 11822.3, 231.672], [0.991115, -0.133008, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", ["InBaseMoves_patrolling1"], "Exile_Trader_SpecialOperations", "WhiteHead_17", [["arifle_MX_Black_F","","","",[],[],""],[],[],["U_B_CTRG_1",[]],["V_PlateCarrierGL_blk",[]],["B_Parachute",[]],"Exile_Headgear_SantaHat","G_Balaclava_lowprofile",[],["","","","","","NVGoggles_OPFOR"]], [11055, 11804.7, 232.053], [0.579841, 0.814729, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["c5efe_MichalLoop"], "Exile_Trader_WasteDump", "WhiteHead_12", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Tactical_Clear",[],["","","","","",""]], [14848.6, 14441, 18.8918], [-0.668965, 0.743294, 0], [0, 0, 1]],
["Exile_Trader_Office", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Office", "AfricanHead_03", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","",[],["","","","","",""]], [14852.2, 14475.6, 18.9589], [-0.994273, -0.0536216, 0.0924388], [0.0851755, 0.124767, 0.988523]],
["Exile_Trader_Vehicle", ["c5efe_MichalLoop"], "Exile_Trader_Vehicle", "WhiteHead_09", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [14853.6, 14422.6, 19.2627], [-0.535233, -0.844704, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["InBaseMoves_table1"], "Exile_Trader_VehicleCustoms", "GreekHead_A3_05", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"Exile_Headgear_SantaHat","",[],["","","","","",""]], [14851.2, 14425.3, 17.9675], [0.980393, 0.0919356, 0.17429], [-0.1759, 0.00963902, 0.984361]],
["Exile_Trader_Hardware", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Hardware", "GreekHead_A3_06", [[],[],[],["U_C_WorkerCoveralls",[]],["V_BandollierB_rgr",[]],["B_UAV_01_backpack_F",[]],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [14890.7, 14442, 17.9447], [-0.810329, 0.585976, 0], [0, 0, 1]],
["Exile_Trader_Food", ["HubSittingChairUB_idle3"], "Exile_Trader_Food", "GreekHead_A3_06", [[],[],[],["U_C_Poloshirt_blue",[]],[],[],"Exile_Headgear_SantaHat","G_Tactical_Clear",[],["","","","","",""]], [14889.3, 14449.5, 18.0259], [-0.429727, -0.902959, 0], [0, 0, 1]],
["Exile_Trader_Equipment", [], "Exile_Trader_Equipment", "WhiteHead_11", [["arifle_MX_GL_Black_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_I_G_resistanceLeader_F",[]],[],"Exile_Headgear_SantaHat","",[],["","","","","",""]], [14892.6, 14432.7, 17.9915], [-0.98316, 0.182744, 0], [0, 0, 1]],
["Exile_Trader_Armory", [], "Exile_Trader_Armory", "WhiteHead_06", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_Rangemaster",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Shades_Black",[],["","","","","",""]], [14891.4, 14439.2, 17.9432], [-0.238273, -0.971198, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", ["InBaseMoves_patrolling1"], "Exile_Trader_SpecialOperations", "WhiteHead_16", [["arifle_MX_Black_F","","","",[],[],""],[],[],["U_B_CTRG_1",[]],["V_PlateCarrierGL_blk",[]],["B_Parachute",[]],"Exile_Headgear_SantaHat","G_Balaclava_lowprofile",[],["","","","","","NVGoggles_OPFOR"]], [14848, 14459.5, 18.0802], [0.774768, 0.632246, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["c5efe_MichalLoop"], "Exile_Trader_WasteDump", "GreekHead_A3_09", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [2867.71, 6191.32, 66.1307], [-0.544086, -0.83903, 0], [0, 0, 1]],
["Exile_Trader_Office", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Office", "WhiteHead_10", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [2936.28, 6226.26, 68.8206], [-0.658001, 0.753017, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Vehicle", "WhiteHead_06", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"Exile_Headgear_SantaHat","",[],["","","","","",""]], [2865.21, 6229.45, 66.2829], [-0.678646, 0.734465, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["Acts_passenger_flatground_leanright"], "Exile_Trader_VehicleCustoms", "WhiteHead_18", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"Exile_Headgear_SantaHat","",[],["","","","","",""]], [2863.61, 6225.95, 66.1137], [-0.535241, 0.8447, 0], [0, 0, 1]],
["Exile_Trader_Hardware", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Hardware", "WhiteHead_02", [[],[],[],["U_C_WorkerCoveralls",[]],["V_BandollierB_rgr",[]],["B_UAV_01_backpack_F",[]],"Exile_Headgear_SantaHat","G_Tactical_Clear",[],["","","","","",""]], [2902.03, 6195.78, 68.5485], [0.400398, 0.916341, 0], [0, 0, 1]],
["Exile_Trader_Food", ["HubSittingChairUB_idle3"], "Exile_Trader_Food", "Barklem", [[],[],[],["U_C_Poloshirt_blue",[]],[],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [2909.07, 6198.8, 69.0732], [-0.973653, 0.228035, 0], [0, 0, 1]],
["Exile_Trader_Equipment", [], "Exile_Trader_Equipment", "GreekHead_A3_08", [["arifle_MX_GL_Black_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_I_G_resistanceLeader_F",[]],[],"Exile_Headgear_SantaHat","G_Tactical_Clear",[],["","","","","",""]], [2929.4, 6214, 69.5103], [-0.425466, 0.904975, 0], [0, 0, 1]],
["Exile_Trader_Armory", [], "Exile_Trader_Armory", "WhiteHead_14", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_Rangemaster",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Shades_Black",[],["","","","","",""]], [2933.09, 6218.73, 69.318], [-0.929724, -0.368257, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", ["InBaseMoves_patrolling1"], "Exile_Trader_SpecialOperations", "WhiteHead_10", [["arifle_MX_Black_F","","","",[],[],""],[],[],["U_B_CTRG_1",[]],["V_PlateCarrierGL_blk",[]],["B_Parachute",[]],"Exile_Headgear_SantaHat","G_Balaclava_lowprofile",[],["","","","","","NVGoggles_OPFOR"]], [2921.49, 6230.16, 69.1251], [0.00395264, -0.999992, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["c5efe_MichalLoop"], "Exile_Trader_WasteDump", "WhiteHead_05", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Tactical_Clear",[],["","","","","",""]], [17208.3, 3546.73, 303.914], [-0.0716404, 0.997431, 0], [0, 0, 1]],
["Exile_Trader_Office", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Office", "WhiteHead_07", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [17225.9, 3517.56, 303.856], [0.309608, 0.950864, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Vehicle", "WhiteHead_10", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"Exile_Headgear_SantaHat","",[],["","","","","",""]], [17170.7, 3463.93, 303.066], [-0.874319, 0.485351, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["Acts_passenger_flatground_leanright"], "Exile_Trader_VehicleCustoms", "WhiteHead_10", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"Exile_Headgear_SantaHat","",[],["","","","","",""]], [17163, 3461.28, 302.563], [0.451235, 0.892405, 0], [0, 0, 1]],
["Exile_Trader_Hardware", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Hardware", "WhiteHead_02", [[],[],[],["U_C_WorkerCoveralls",[]],["V_BandollierB_rgr",[]],["B_UAV_01_backpack_F",[]],"Exile_Headgear_SantaHat","G_Aviator",[],["","","","","",""]], [17187.5, 3536.13, 303.858], [-0.150187, -0.988658, 0], [0, 0, 1]],
["Exile_Trader_Food", ["HubSittingChairUB_idle3"], "Exile_Trader_Food", "WhiteHead_01", [[],[],[],["U_C_Poloshirt_blue",[]],[],[],"Exile_Headgear_SantaHat","",[],["","","","","",""]], [17181.5, 3531.4, 303.979], [0.999515, 0.0311299, 0], [0, 0, 1]],
["Exile_Trader_Equipment", [], "Exile_Trader_Equipment", "Sturrock", [["arifle_MX_GL_Black_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_I_G_resistanceLeader_F",[]],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [17206.4, 3502.74, 303.705], [0.122822, 0.992429, 0], [0, 0, 1]],
["Exile_Trader_Armory", [], "Exile_Trader_Armory", "WhiteHead_06", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_Rangemaster",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Shades_Black",[],["","","","","",""]], [17212, 3504.77, 303.69], [-0.982849, 0.184415, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", ["InBaseMoves_patrolling1"], "Exile_Trader_SpecialOperations", "WhiteHead_05", [["arifle_MX_Black_F","","","",[],[],""],[],[],["U_B_CTRG_1",[]],["V_PlateCarrierGL_blk",[]],["B_Parachute",[]],"Exile_Headgear_SantaHat","G_Balaclava_lowprofile",[],["","","","","","NVGoggles_OPFOR"]], [17203.3, 3543.88, 304.2], [-0.472852, -0.881142, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Aircraft", "Sturrock", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [18115.8, 2061.32, 135.126], [-0.678018, -0.735045, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["Acts_passenger_flatground_leanright"], "Exile_Trader_AircraftCustoms", "GreekHead_A3_08", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"Exile_Headgear_SantaHat","G_Tactical_Clear",[],["","","","","",""]], [18115.3, 2060.77, 135.189], [0.782466, -0.622693, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Aircraft", "WhiteHead_15", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"Exile_Headgear_SantaHat","G_Tactical_Black",[],["","","","","",""]], [4010.59, 4384.55, 72.1693], [-0.100471, 0.99494, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["Acts_passenger_flatground_leanright"], "Exile_Trader_AircraftCustoms", "WhiteHead_14", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"Exile_Headgear_SantaHat","",[],["","","","","",""]], [4010.49, 4385.38, 72.1693], [-0.984982, -0.172655, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Aircraft", "WhiteHead_07", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"Exile_Headgear_SantaHat","G_Tactical_Clear",[],["","","","","",""]], [14337.2, 17052.2, 16.9865], [-0.678018, -0.735045, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["Acts_passenger_flatground_leanright"], "Exile_Trader_AircraftCustoms", "WhiteHead_18", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"Exile_Headgear_SantaHat","",[],["","","","","",""]], [14336.6, 17051.3, 16.9865], [-0.526673, 0.850068, 0], [0, 0, 1]],
["Exile_Trader_Boat", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Boat", "WhiteHead_10", [[],[],[],["U_OrestesBody",[]],[],[],"Exile_Headgear_SantaHat","",[],["","","","","",""]], [14480, 2706.39, 5.36146], [-0.906868, -0.421416, 0], [0, 0, 1]],
["Exile_Trader_BoatCustoms", ["Acts_passenger_flatground_leanright"], "Exile_Trader_BoatCustoms", "WhiteHead_03", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"Exile_Headgear_SantaHat","",[],["","","","","",""]], [14479.1, 2705.81, 5.36146], [0.459618, -0.888117, 0], [0, 0, 1]],
["Exile_Trader_Boat", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Boat", "WhiteHead_07", [[],[],[],["U_OrestesBody",[]],[],[],"Exile_Headgear_SantaHat","G_Tactical_Clear",[],["","","","","",""]], [6075.72, 10737.8, 6.35771], [0.956894, 0.290438, 0], [0, 0, 1]],
["Exile_Trader_BoatCustoms", ["Acts_passenger_flatground_leanright"], "Exile_Trader_BoatCustoms", "WhiteHead_07", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [6076.66, 10738.3, 6.35771], [-0.330888, 0.94367, 0], [0, 0, 1]],
["Exile_Trader_Boat", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Boat", "AfricanHead_02", [[],[],[],["U_OrestesBody",[]],[],[],"Exile_Headgear_SantaHat","G_Tactical_Clear",[],["","","","","",""]], [15885.6, 13143.2, 5.15035], [-0.906868, -0.421416, 0], [0, 0, 1]],
["Exile_Trader_BoatCustoms", ["Acts_passenger_flatground_leanright"], "Exile_Trader_BoatCustoms", "WhiteHead_20", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [15884.7, 13142.6, 5.15035], [0.459618, -0.888117, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["Acts_passenger_flatground_leanright"], "Exile_Trader_WasteDump", "WhiteHead_14", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [14333.2, 17053.7, 16.9865], [0.854343, 0.51971, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["Acts_passenger_flatground_leanright"], "Exile_Trader_WasteDump", "Sturrock", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [16063.6, 18753.2, 93.4027], [-0.7729, 0.634528, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["Acts_passenger_flatground_leanright"], "Exile_Trader_WasteDump", "WhiteHead_18", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [15887, 13138.9, 5.06208], [-0.430917, 0.902392, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["Acts_passenger_flatground_leanright"], "Exile_Trader_WasteDump", "WhiteHead_12", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Tactical_Black",[],["","","","","",""]], [18113.5, 2058.09, 135.189], [0.781009, 0.62452, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["Acts_passenger_flatground_leanright"], "Exile_Trader_WasteDump", "WhiteHead_09", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [14481.3, 2702, 5.36146], [0.854343, 0.51971, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["Acts_passenger_flatground_leanright"], "Exile_Trader_WasteDump", "WhiteHead_19", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","G_Combat",[],["","","","","",""]], [4009.56, 4388.56, 72.1693], [0.148873, -0.988856, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["Acts_passenger_flatground_leanright"], "Exile_Trader_WasteDump", "GreekHead_A3_05", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"Exile_Headgear_SantaHat","",[],["","","","","",""]], [6075.05, 10742.1, 6.35771], [-0.930925, -0.365209, 0], [0, 0, 1]]
];

{
    private _logic = "Logic" createVehicleLocal [0, 0, 0];
    private _trader = (_x select 0) createVehicleLocal [0, 0, 0];
    private _animations = _x select 1;
    
    _logic setPosWorld (_x select 5);
    _logic setVectorDirAndUp [_x select 6, _x select 7];
    
    _trader setVariable ["BIS_enableRandomization", false];
    _trader setVariable ["BIS_fnc_animalBehaviour_disable", true];
    _trader setVariable ["ExileAnimations", _animations];
    _trader setVariable ["ExileTraderType", _x select 2];
    _trader disableAI "ANIM";
    _trader disableAI "MOVE";
    _trader disableAI "FSM";
    _trader disableAI "AUTOTARGET";
    _trader disableAI "TARGET";
    _trader disableAI "CHECKVISIBLE";
    _trader allowDamage false;
    _trader setFace (_x select 3);
    _trader setUnitLoadOut (_x select 4);
    _trader setPosWorld (_x select 5);
    _trader setVectorDirAndUp [_x select 6, _x select 7];
    _trader reveal _logic;
    _trader attachTo [_logic, [0, 0, 0]];
    _trader switchMove (_animations select 0);
    _trader addEventHandler ["AnimDone", {_this call ExileClient_object_trader_event_onAnimationDone}];
}
forEach _npcs;


