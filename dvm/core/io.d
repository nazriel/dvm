/**
 * Copyright: Copyright (c) 2007-2011 Jacob Carlborg. All rights reserved.
 * Authors: Jacob Carlborg
 * Version: Initial created: 2007
 * License: $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost Software License 1.0)
 * 
 */
module dvm.core.io;

version (Tango)
{
	import tango.io.Stdout;
	import tango.io.Console;
	
	import mambo.core.string;
}

else 
	import std.stdio;

/**
 * Print to the standard output
 * 
 * Params:
 *     args = what to print
 */
void print (A...)(A args)
{
	version (Tango)
	{
		static const string fmt = "{}{}{}{}{}{}{}{}"
					        	  "{}{}{}{}{}{}{}{}"
					        	  "{}{}{}{}{}{}{}{}";
				
		static assert (A.length <= fmt.length / 2, "dvm.core.io.print :: too many arguments");
		
		Stdout.format(fmt[0 .. args.length * 2], args).flush;
	}
		
	
	else
		write(args);
}

/**
 * Print to the standard output, adds a new line
 * 
 * Params:
 *     args = what to print
 */
void println (A...)(A args)
{
	version (Tango)
	{
		static const string fmt = "{}{}{}{}{}{}{}{}"
					        	  "{}{}{}{}{}{}{}{}"
					        	  "{}{}{}{}{}{}{}{}";

		static assert (A.length <= fmt.length / 2, "dvm.core.io.println :: too many arguments");
		
		Stdout.formatln(fmt[0 .. args.length * 2], args);
	}

	else
		writeln(args);
}