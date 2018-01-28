package io.newgrounds.components;

import io.newgrounds.NG;

class LoaderComponent extends Component {
	
	public function new (core:NG){ super(core); }
	
	public function loadAuthorUrl(host:String, redirect:Bool = true):Call { 
		
		return new Call(_core, "Loader.loadAuthorUrl")
			.addComponentParameter("host", host)
			.addComponentParameter("redirect", redirect);
	}
	
	public function loadMoreGames(host:String, redirect:Bool = true):Call { 
		
		return new Call(_core, "Loader.loadMoreGames")
			.addComponentParameter("host", host)
			.addComponentParameter("redirect", redirect);
	}
	
	public function loadNewgrounds(host:String, redirect:Bool = true):Call { 
		
		return new Call(_core, "Loader.loadNewgrounds")
			.addComponentParameter("host", host)
			.addComponentParameter("redirect", redirect);
	}
	
	public function loadOfficialUrl(host:String, redirect:Bool = true):Call { 
		
		return new Call(_core, "Loader.loadOfficialUrl")
			.addComponentParameter("host", host)
			.addComponentParameter("redirect", redirect);
	}
	
	public function loadReferral(host:String, redirect:Bool = true):Call { 
		
		return new Call(_core, "Loader.loadReferral")
			.addComponentParameter("host", host)
			.addComponentParameter("redirect", redirect);
	}
}