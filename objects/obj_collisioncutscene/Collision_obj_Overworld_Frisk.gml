obj_Overworld_Frisk.Frozen = true;
instance_create_depth(0, 0, 0, obj_ExampleCutscene);
instance_destroy();

// Tells the save data that you found this cutscene before
ConditionChange("cutscene1", true);