private["_reward","_killerMoney","_newMoney","_killerb","y"];
_money = _this select 0;
_killerb = player getvariable["bounty",1];
_y= player getvariable["highscore",[0,0,0,0,0,0,0,0]];
_y set [0,(_y select 0)+1]; player setvariable["highscore",_y,false];
multikill = multikill +1;
[]Spawn {sleep 5;multikill=0};
_killermoney = player getvariable["cmoney",500];
if(multikill >= 2)then {
  _money = _money * multikill;
  _name = name player;
  chocostring =format["[%1,%2]call mk;",multikill,_name];publicvariable"chocostring";call compile chocostring;
};
[]call countingbounty;
_money = floor (_money);
[_money]call chocokingMoney;
player setVariable["cmoney", _killermoney + _money, true];
player setvariable["ks",(player getvariable"ks")+1,false];
_y= player getvariable"highscore";_y set [5,(_y select 5)+_money]; player setvariable["highscore",_y,false];
_y= player getvariable"highscore";if((player getvariable"ks") > (_y select 1))then{_y set [1, (player getvariable"ks")]; player setvariable["highscore",_y,false];};
if ((player getvariable"ks") > (chocoland getvariable["ks",[0,"nobody"]]) select 0)then{chocoland setvariable["ks",[(player getvariable"ks"),name player],true]};  
