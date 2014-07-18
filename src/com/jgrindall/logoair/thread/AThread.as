package com.jgrindall.logoair.thread{
 	import com.jgrindall.logoair.events.ThreadEvent;
 	
 	import flash.events.EventDispatcher;
 
 	public class AThread extends EventDispatcher{
 		
		protected var fn:Function;
		protected var obj:Object;
		 	
	 	public function AThread(threadFunction:Function, threadObject:Object){
			fn = threadFunction;
		 	obj = threadObject;
	 	}
	 	protected function finished():void{
	 		dispatchEvent(new ThreadEvent(ThreadEvent.COMPLETE,true,true));
	 	}
 	} 
}
