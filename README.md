ActionScript3 Helpers
=====================

### this repository contains helpers written in Object Oriented ActionScript3


Console Helper
--------------

This class makes debugging your AS3 application easier. Instead of trace() function you can instantiate this class and use it's log method just like in popular Firefox addon Firebug.
Features: 

* ability to log time spent since compiling
* ability to send log also to Firebug extension, when debugging in browser
* more coming later

Usage: 


	var console = new Console(true, 2, true);



* @param boolean track_time Whether to track the time since compiling
* @param integer minround Number of minutes to wait until rounding to minutes
* @param boolean log_firebug Whether to send logged stuff also to Firebug
