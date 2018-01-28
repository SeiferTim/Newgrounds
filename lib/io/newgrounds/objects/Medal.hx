package io.newgrounds.objects;

import io.newgrounds.Call;
import io.newgrounds.NG;

class Medal extends Object {
	
	inline static public var EASY       :Int = 1;
	inline static public var MODERATE   :Int = 2;
	inline static public var CHALLENGING:Int = 3;
	inline static public var DIFFICULT  :Int = 4;
	inline static public var BRUTAL     :Int = 5;
	
	static var difficultyNames:Array<String> = 
		[ "Easy"
		, "Moderate"
		, "Challenging"
		, "Difficult"
		, "Brutal"
		];
	// --- FROM SERVER
	public var id         (default, null):Int;
	public var name       (default, null):String;
	public var description(default, null):String;
	public var icon       (default, null):String;
	public var value      (default, null):Int;
	public var difficulty (default, null):Int;
	public var secret     (default, null):Bool;
	public var unlocked   (default, null):Bool;
	// --- HELPERS
	public var difficultyName(get, never):String;
	
	public function new(core:NG, data:Dynamic):Void { super(core, data); }
	
	override function parse(data:Dynamic):Void {
		
		id          = data.id;
		name        = data.name;
		description = data.description;
		icon        = data.icon;
		value       = data.value;
		difficulty  = data.difficulty;
		secret      = data.secret == 1;
		unlocked    = data.unlocked;
	}
	
	public function unlock():Call {
		
		return new Call(_core, "Medal.unlock", true, true)
			.addDataHandler(onUnlock);
	}
	
	function onUnlock(reply:String):Void {
		
		unlocked = true;
	}
	
	public function get_difficultyName():String {
		
		return difficultyNames[difficulty - 1];
	}
	
	public function toString():String {
		
		return 'Medal: $id@$name (${unlocked ? "unlocked" : "locked"}, $value pts, $difficultyName).';
	}
}