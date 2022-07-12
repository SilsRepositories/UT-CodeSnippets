/*
  Only use THIS when you want the enemy to DODGE attacks
*/
//DamageWriter = instance_create_depth(x, y - 170, -100, obj_MonsterHP);
//DamageWriter.MyHP = MyHP;
//DamageWriter.MyCurrentHP = MyHP;
//DamageWriter.MyHPToBe = MyHP;
//DamageWriter.MyMaxHP = MyMaxHP;
//DamageWriter.ShowBar = false;
//DamageWriter.Damage = "MISS";
//DodgeAnim = 0;

DamageWriter = instance_create_depth(x, y - 30, -100, obj_MonsterHP);
DamageWriter.MyHP = MyHP;
DamageWriter.MyCurrentHP = MyHP;
DamageWriter.MyHPToBe = (MyHP - global.Damage);
DamageWriter.MyMaxHP = MyMaxHP;
DamageWriter.Damage = global.Damage;
if (global.Damage <= 0) {
	DamageWriter.ShowBar = false;
	DamageWriter.Damage = "MISS";
}
else {
	ShakeEffect = 20;
	MyHP -= global.Damage;
	audio_play_sound(MonsterHurt, 0, false);
}

