////////////////////////////////////////////////////////////////
//															  //
//				FOR REMEMBERING THE BORING STUFF			  //
//															  //
////////////////////////////////////////////////////////////////


// -------------------------------------------------------------
// TO LOAD MULTIPLE FILES, DISREGARDING NAMES OR FILE EXTENSIONS
// -------------------------------------------------------------

// mainly works if there is a subdirectory containing a bunch of audiofiles and nothing else:

(
p = PathName.new(
		PathName(thisProcess.nowExecutingPath).pathOnly +/+ "samples"
	).entries;
b = p.collect({|file|
	Buffer.read(s, file);
});
)

// thisProcess.nowExecutingPath returns the directory of the file that supercollider currently runs. 
// 'entries' only returns the files in that folder. 'collect' returns an array of Buffer objects.

// Another way is to use 'File.getcwd' to get the current working directory. Still using PathName, but is
// slightly more condensed. 

(
p = PathName.new(File.getcwd +/+ "samples/").entries;
b = p.collect({|file|
	Buffer.read(s, file.fullPath);
	});
)

// For some reason you need to use '.fullPath' on the path argument of Buffer.read
// These can behave differently on different editors: the 'thisProcess'-approach does only work on SCIDE or
// Emacs, although I am writing this in neovim -> SCNvim. 
// -> This can be a major headache when sending sketches between friends.
