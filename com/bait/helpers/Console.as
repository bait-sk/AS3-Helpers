package com.bait.helpers{

	import flash.external.ExternalInterface;

	public class Console {

		public var track_time:Boolean;
		private var start_time = new Date();
		private var now = new Date();
		private var difference = new Date();
		private var diff_units:String;
		private var round_to_minutes_after:int;
		private var trace_message:String;
		private var log_firebug:Boolean;

		/**
		* Creates a console with logging functionality
		* @param boolean track_time Whether to track the time since compiling
		* @param integer minround Number of minutes to wait until rounding to minutes
		* @param boolean log_firebug Whether to send logged stuff also to Firebug
		*/
		public function Console(track_time = false, minround = 1, log_firebug = false) {
			this.track_time=track_time;
			this.round_to_minutes_after=minround;
			this.log_firebug=log_firebug;
		}

		/**
		* Traces a log message
		* @param string log_message The message to output
		*/
		public function log(log_message:String) {
			this.trace_message=">>>console>>> "+log_message;
			if (true==this.track_time) {
				this.now = new Date();
				this.difference=this.now-this.start_time;
				this.diff_units="ms";
				if (this.difference/1000>1) {
					this.difference=int(this.difference/1000*100)/100;
					this.diff_units="s";
					if (this.difference/60>round_to_minutes_after) {
						this.difference=int(this.difference/60*100)/100;
						this.diff_units="m";
					}
				}
				this.trace_message+=" <<<"+this.difference+this.diff_units+" after start<<<";
			}
			trace(this.trace_message);
			if (true==this.log_firebug) {
				ExternalInterface.call( "console.log" , this.trace_message);
			}
		}

	}

}