# enable basic logging for this file by declaring a namespace
namespace keykit

# make the Log method direct everything in the namespace 'myApp' to the log handler called DEBUG
Log::AddOutput keykit DEBUG
Log::AddOutput error STDERR

#subject=error Log "Something bad happened."

#Log "this is shown"
#Log::ResetAllOutputsAndFilters
#Log "this is not shown"
# You may also hardcode the use for the StdErr output directly:
#Console::WriteStdErr "This will be printed to STDERR, no matter what."
